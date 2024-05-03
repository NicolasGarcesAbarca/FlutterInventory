import 'package:flutter/material.dart';
import 'package:inventory/models/products.dart';
import 'package:inventory/screens/product_detail.dart';
import 'package:inventory/widgets/image_storage.dart';

class ItemListProduct extends StatelessWidget {
  final Product product;

  const ItemListProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ProductDetailPage(product: product))));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(97, 209, 199, 199),
              borderRadius: BorderRadius.circular(10)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: ImageFromStorage(
                    product: product, width: 100, height: 100)),
            Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                      child: Text(
                    product.name ?? "",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
                  Container(
                      child: Text(
                    product.value ?? "",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )),
                  Container(
                      child: Text(
                    product.code ?? "",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(100, 31, 23, 23)),
                  ))
                ]))
          ]),
        ));
  }
}
