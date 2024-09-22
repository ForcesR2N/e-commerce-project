import "package:e_commerce_project/models/items.dart";
import "package:http/http.dart" as http;

class RemoteService {
  static var client = http.Client();
  static Future<Product?> fetchProduct() async {
    var response = await client.get(Uri.parse(
        "https://raw.githubusercontent.com/Stupidism/goat-sneakers/master/api.json"));
    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    } else {
      print('error response:${response.body}');
    }
    return null;
  }
}
