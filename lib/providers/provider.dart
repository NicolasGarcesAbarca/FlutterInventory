import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:inventory/models/products.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
class ProductList extends _$ProductList {
  @override
  Future<List<Product>> build() async {
    final url = Uri.parse("https://fc-6rqsavw2kq-uc.a.run.app/products");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Product.fromJson(e)).toList();
  }

  Future<void> addProduct(Product product, XFile image) async {
    final url = Uri.parse("https://fc-6rqsavw2kq-uc.a.run.app/products");

    final storageRef = FirebaseStorage.instance.ref();
    final mountainImagesRef = storageRef.child("catalog/${product.code}.png");

    await mountainImagesRef.putFile(File(image.path));

    await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product.toJson()));

    ref.invalidateSelf();
    await future;
  }
}
