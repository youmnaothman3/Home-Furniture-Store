class ProductModel {
  final String name;
  final String image;
  final double price;
  final bool boolshopping;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    this.boolshopping = false,
  });
}
