import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logiology/app/data/model/product_model.dart';

class ProductProvider {
  static Future<List<ProductModel>> fetchProducts() async {
    final res = await http.get(Uri.parse('https://dummyjson.com/products'));
    final data = json.decode(res.body);
    return List<ProductModel>.from(data['products'].map((e) => ProductModel.fromJson(e)));
  }
}
