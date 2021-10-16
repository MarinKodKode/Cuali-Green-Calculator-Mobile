class Productos {
  final String image;
  final String price;
  final String name;
  final String descripcion;

  Productos(
      {required this.image,
      required this.price,
      required this.name,
      required this.descripcion});

  factory Productos.fromJson(Map<String, dynamic> json) {
    return Productos(
      image: json['image'],
      price: json['price'],
      name: json['name'],
      descripcion: json['descripcion'],
    );
  }
}
