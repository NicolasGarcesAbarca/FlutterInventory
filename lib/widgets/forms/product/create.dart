import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory/models/products.dart';
import 'package:inventory/providers/provider.dart';

class FormCreateProduct extends ConsumerStatefulWidget {
  const FormCreateProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FormCreateProductState();
}

class _FormCreateProductState extends ConsumerState<FormCreateProduct> {
  Future<void>? _pendingAddProduct;

  XFile? _imageFile;
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _code = "";
  String _value = "";
  String _chilecompra = "";
  String _category = "";
  String _description = "";

  void _pickImageFromGallery() async {
    final XFile? pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _pendingAddProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nombre"),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a name" : null,
                  onSaved: (value) => setState(() => _name = value!),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Código"),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a code" : null,
                  onSaved: (value) => setState(() => _code = value!),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Precio"),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a value" : null,
                  onSaved: (value) => setState(() => _value = value!),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Chilecompra"),
                  onSaved: (value) => setState(() => _chilecompra = value!),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Categoría"),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a category" : null,
                  onSaved: (value) => setState(() => _category = value!),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Descripción"),
                  maxLines: null, // allows multi-line text input
                  onSaved: (value) => setState(() => _description = value!),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Wrap(children: [
                      ElevatedButton(
                        onPressed: _pickImageFromGallery,
                        child: const Text('Buscar imagen en galería'),
                      ),
                      (_imageFile != null)
                          ? Image.file(
                              File(_imageFile!.path),
                              width: screenWidth * 0.8,
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: Text("No hay imagen"))
                    ])),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _imageFile != null) {
                        _formKey.currentState!.save();

                        final future = ref
                            .read(productListProvider.notifier)
                            .addProduct(
                                Product(
                                    name: _name,
                                    code: _code,
                                    value: _value,
                                    chilecompra: _chilecompra,
                                    category: _category,
                                    description: _description),
                                _imageFile!);
                        setState(() {
                          _imageFile = null;
                          _pendingAddProduct = future;
                        });
                      }
                    },
                    child: const Text(
                      'Guardar',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
