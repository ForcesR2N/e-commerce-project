import 'dart:convert';

// Function to parse JSON data and return Product object
Product productFromJson(String str) => Product.fromJson(json.decode(str));

// Function to convert Product object back to JSON
String productToJson(Product data) => json.encode(data.toJson());

// Main Product class which includes Healthcheck and Sneakers
class Product {
  Healthcheck healthcheck;
  List<Sneaker> sneakers;

  Product({
    required this.healthcheck,
    required this.sneakers,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        healthcheck: Healthcheck.fromJson(json["healthcheck"]),
        sneakers:
            List<Sneaker>.from(json["sneakers"].map((x) => Sneaker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "healthcheck": healthcheck.toJson(),
        "sneakers": List<dynamic>.from(sneakers.map((x) => x.toJson())),
      };
}

// Healthcheck class for basic health status
class Healthcheck {
  String message;

  Healthcheck({
    required this.message,
  });

  factory Healthcheck.fromJson(Map<String, dynamic> json) => Healthcheck(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

// Sneaker class containing only the fields you need
class Sneaker {
  String name;
  List<double> sizeRange;
  String mainPictureUrl;
  DateTime? releaseDate;
  int? retailPriceCents;
  String details;

  Sneaker({
    required this.name,
    required this.sizeRange,
    required this.mainPictureUrl,
    required this.releaseDate,
    required this.retailPriceCents,
    required this.details,
  });

  // Factory method to create Sneaker object from JSON
  factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        name: json["name"],
        sizeRange: List<double>.from(json["size_range"].map((x) => x?.toDouble())),
        mainPictureUrl: json["main_picture_url"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        retailPriceCents: json["retail_price_cents"],
        details: json["details"],
      );

  // Convert Sneaker object to JSON
  Map<String, dynamic> toJson() => {
        "name": name,
        "size_range": List<dynamic>.from(sizeRange.map((x) => x)),
        "main_picture_url": mainPictureUrl,
        "release_date": releaseDate?.toIso8601String(),
        "retail_price_cents": retailPriceCents,
        "details": details,
      };
}

void main() {
  // Example JSON data
  const jsonData = '''
  {
    "healthcheck": {
      "message": "OK"
    },
    "sneakers": [
      {
        "name": "Air Jordan 1 Retro High OG 'Shadow' 2018",
        "size_range": [10, 10.5, 11, 11.5],
        "main_picture_url": "https://image.goat.com/750/attachments/product_template_pictures/images/011/119/994/original/218099_00.png.png",
        "release_date": "2018-04-14T23:59:59.000Z",
        "retail_price_cents": 16000,
        "details": "Black/White-Medium Grey"
      },
      {
        "name": "Air Jordan 1 Retro High OG 'Bred' 2019",
        "size_range": [8, 8.5, 9, 9.5],
        "main_picture_url": "https://image.goat.com/750/attachments/product_template_pictures/images/011/119/995/original/218100_00.png.png",
        "release_date": "2019-04-14T23:59:59.000Z",
        "retail_price_cents": 17000,
        "details": "Black/Red-White"
      }
    ]
  }
  ''';

  // Parsing the JSON data
  final product = productFromJson(jsonData);

  // Iterate through each sneaker and print the filtered data
  for (var sneaker in product.sneakers) {
    print('Product Name: ${sneaker.name}');
    print('Available Sizes: ${sneaker.sizeRange}');
    print('Image URL: ${sneaker.mainPictureUrl}');
    print('Release Date: ${sneaker.releaseDate}');
    print('Price (Cents): ${sneaker.retailPriceCents}');
    print('Details: ${sneaker.details}');
    print('------------------------');
  }
}
