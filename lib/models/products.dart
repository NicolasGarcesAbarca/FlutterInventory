class Product {
  String? name;
  String? code;
  String? value;
  String? chilecompra;
  String? category;
  String? description;

  Product(
      {this.name,
      this.code,
      this.value,
      this.chilecompra,
      this.category,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    value = json['value'];
    chilecompra = json['chilecompra'];
    category = json['category'];
    description = json['description'];
  }
}
