import 'dart:convert';

import 'package:api_practicing/single_post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //   with model
  Future<SinlgeApiModel?> getSinglePost() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      );

      if (response.statusCode == 200) {
        SinlgeApiModel model = SinlgeApiModel.fromJson(
          json.decode(response.body),
        );
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }




  Future<dynamic> getSingleNoModel() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      );

      if (response.statusCode == 200) {
     final body=response.body;
     final data=jsonDecode(body);
     return data;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
