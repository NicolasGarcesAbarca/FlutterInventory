import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:inventory/models/products.dart';

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
    return Container(
        child: FutureBuilder<String>(
            future: futureUrl,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    width: widget.width,
                    height: widget.height,
                    child: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasData) {
                final url = snapshot.data!;
                return Image.network(
                  url,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.cover,
                );
              } else {
                return Container(
                    width: widget.width,
                    height: widget.height,
                    child: Text("Error"));
              }
            }));
  }
}
