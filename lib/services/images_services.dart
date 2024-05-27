import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../models/images_model.dart';

class ImagesServices {
  static List<ImagesModel> list = [];

  static Future<List<ImagesModel>> getProductData() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://picsum.photos/v2/list?page=2&limit=100'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        list = data.map((e) => ImagesModel.fromJson(e)).toList();
      }
    } catch (e) {
      log("message", error: e.toString());
    }
    return list;
  }
}
