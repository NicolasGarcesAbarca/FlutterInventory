import 'package:flutter/material.dart';
import 'package:inventory/models/products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inventory/widgets/list_products.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  static Future<List<Product>> getProducts() async {
    var url = Uri.parse("https://fc-6rqsavw2kq-uc.a.run.app/products");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> productsFuture = getProducts();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Product>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            return ListProducts(products: products);
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
