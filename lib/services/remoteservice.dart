import 'package:http/http.dart' as http;
import 'package:test3/models/productmodel.dart';

class RemotesService {
  static String url = 'https://dummyjson.com/products';
  static Uri uri = Uri.parse(url);
  static Future<List<Product>?> getProducts() async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return totalProductsFromJson(jsonString).products;
    } else {
      return null;
    }
  }
}
