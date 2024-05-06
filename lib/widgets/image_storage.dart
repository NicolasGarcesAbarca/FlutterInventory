import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:inventory/models/products.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageFromStorage extends StatefulWidget {
  final Product product;
  final double width;
  final double height;
  const ImageFromStorage(
      {Key? key,
      required this.product,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  State<ImageFromStorage> createState() => _ImageFromStorageState();
}

class _ImageFromStorageState extends State<ImageFromStorage> {
  Future<String> futureUrl = Future.value("");

  static Future<String> getUrl(String fileName) async {
    Reference refImage =
        FirebaseStorage.instance.ref().child("catalog/$fileName");
    final String url = await refImage.getDownloadURL();
    return url;
  }

  @override
  void initState() {
    super.initState();
    final String code = widget.product.code ?? "";
    futureUrl = getUrl("$code.png");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: futureUrl,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                width: widget.width,
                height: widget.height,
                child: const Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasData) {
            final url = snapshot.data!;
            return FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: url,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.fill,
            );
          } else {
            return SizedBox(
                width: widget.width,
                height: widget.height,
                child: const Text("Error"));
          }
        });
  }
}
