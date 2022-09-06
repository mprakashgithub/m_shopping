import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../model/repository/products_repo.dart';

class ProductsProvider with ChangeNotifier {
  List? productsModel;
  // List<ProductsModel> productData = [];
  bool isLoaded = false;

  Future<List?> productsApi() async {
    // productsModel = (await ProductsRepo().getProductsData())!;
    productsModel = await ProductsRepo().getProductsData();
    print("Product provider ${json.encode(productsModel)}");
    setIsLoaded(true);
    notifyListeners();
  }

  bool getIsLoaded() {
    return isLoaded;
  }

  void setIsLoaded(bool value) {
    isLoaded = value;
    notifyListeners();
  }
}
