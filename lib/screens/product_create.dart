import 'package:flutter/material.dart';
import 'package:inventory/widgets/forms/product/create.dart';

class ProductCreate extends StatelessWidget {
  const ProductCreate({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Producto'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
          child: const SingleChildScrollView(
            child: FormCreateProduct(),
          )),
    );
  }
}
