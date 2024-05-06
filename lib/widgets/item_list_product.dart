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
    final screenWidth = MediaQuery.of(context).size.width;
    final columnWidth = screenWidth * 0.7;
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ProductDetailPage(product: product))));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Color.fromARGB(95, 238, 235, 235),
          ),
          child: SizedBox(
              height: columnWidth * 1.2,
              width: columnWidth,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageFromStorage(
                        product: product,
                        width: columnWidth,
                        height: columnWidth * 0.8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: columnWidth,
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                )),
                            Container(
                                child: Text(
                              "\$${product.value.trim()}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )),
                            Container(
                                child: Text(
                              product.code,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(100, 31, 23, 23)),
                            ))
                          ]),
                    )
                  ])),
        ));
  }
}
