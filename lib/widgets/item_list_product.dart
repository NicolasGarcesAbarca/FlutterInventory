import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color.fromARGB(97, 209, 199, 199),
              borderRadius: BorderRadius.circular(10)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: ImageFromStorage(
                    product: product, width: 100, height: 100)),
            Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                      child: Text(
                    product.name ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
                  Container(
                      child: Text(
                    product.value ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )),
                  Container(
                      child: Text(
                    product.code ?? "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(100, 31, 23, 23)),
                  ))
                ]))
          ]),
        ));
  }
}
