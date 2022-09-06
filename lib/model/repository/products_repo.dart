import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/products_model.dart';

class ProductsRepo {
  Future getProductsData() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List finalData = [];
        print("data: $data");
        // var model = ProductsModel.fromJson(map);
        // print("Model: $model");
        data.forEach((element) {
          print(element);
          finalData.add(element);
        });
        return finalData;
        // return ProductsModel.fromJson(map[0]);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw (e);
    }
  }

  // List<ProductsModel> productsList = [];
  // Future<ProductsModel?> getProductsData() async {
  //   try {
  //     // var request =
  //     //     http.Request('GET', Uri.parse('https://fakestoreapi.com/products'));

  //     // http.StreamedResponse response = await request.send();
  //     // print(request);
  //     // print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       // var data = await response.stream.bytesToString();
  //       var map = json.decode(data);
  //       print("Map: $map");
  //       // var model = ProductsModel.fromJson(map);
  //       // print("Model: $model");
  //       return ProductsModel.fromJson(map);
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {
  //     throw (e);
  //   }
  // }
}
