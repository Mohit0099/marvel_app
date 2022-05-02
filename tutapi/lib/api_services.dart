import 'package:http/http.dart' as http;
import 'package:tutapi/model.dart';

class ApiServices {
  var client = http.Client();

  var url = Uri.parse(
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie');

  Future<List<ProductModel>> fetchProducts() async {
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    }
    throw () {};
  }
}
