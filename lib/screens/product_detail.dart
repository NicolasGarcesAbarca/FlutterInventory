import 'package:flutter/material.dart';
import 'package:inventory/models/products.dart';
import 'package:inventory/widgets/image_storage.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 14),
                  child: ImageFromStorage(
                    product: product,
                    width: 200,
                    height: 200,
                  ),
                ),
                Container(
                  child: Text(
                    product.code ?? "-",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey.withOpacity(0.6)),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Text(
                      product.name ?? "-",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )),
                Container(
                    child: Text(
                  product.description ?? "-",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ))
              ],
            )),
      ),
    );
  }
}
