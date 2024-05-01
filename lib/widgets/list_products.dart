import 'package:flutter/material.dart';
import 'package:inventory/models/products.dart';
import 'package:inventory/screens/product_detail.dart';

class ListProducts extends StatelessWidget {
  final List<Product> products;

  const ListProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
            child: ListTile(
          title: Text(product.name ?? "--"),
          subtitle: Text(product.value ?? "--"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        ProductDetailPage(product: product))));
          },
        ));
      },
    );
  }
}
