class Product {
  String id;
  String name;
  String description;
  int price;
  int stock;

  Product({this.id, this.price, this.name, this.description, this.stock});

  Product.fromMap(Map snapshot, String id)
      : id = id ?? '',
        price = snapshot['price'] ?? '',
        name = snapshot['name'] ?? '',
        description = snapshot['description'] ?? '',
        stock = snapshot['stock'] ?? '';

  toJson() {
    return {
      "price": price,
      "name": name,
      "description": description,
      "stock": stock,
    };
  }
}
