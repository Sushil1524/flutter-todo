// useless file - made during tutorials lol

class Product {
  String name;
  String description;
  String image;
  final List<String> tags;

  Product(this.name, this.description, this.image, this.tags);

  static List<Product> getProducts() {
    return [
      Product(
        "Product 1",
        "Description for Product 1",
        "assets/images/product1.jpg",
        ["Tag 1", "Tag 2"],
      ),
      Product(
        "Product 2",
        "Description for Product 2",
        "assets/images/product2.jpg",
        ["Tag 3", "Tag 4"],
      ),
      Product(
        "Product 3",
        "Description for Product 3",
        "assets/images/product3.jpg",
        ["Tag 5", "Tag 6"],
      ),
    ];
  }
}
