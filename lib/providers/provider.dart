import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory/models/products.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
Future<List<Product>> products(ProductsRef ref) async {
  var url = Uri.parse("https://fc-6rqsavw2kq-uc.a.run.app/products");
  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});
  final List body = json.decode(response.body);
  return body.map((e) => Product.fromJson(e)).toList();
}
