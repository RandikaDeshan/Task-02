import 'dart:convert';
import 'package:second_app/src/models/productmodel.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<List<Product>> fetchAllData() async{
    const String url = "https://fakestoreapi.com/products/";
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        List<dynamic> responseData = json.decode(response.body);
        List<Product> products = responseData.map((json){
          return Product.fromJson(json);
        }).toList();

        return products;
      } else{
        print("Failed to fetch Products");
        throw Exception("Failed to fetch Products");
      }
    }catch(error){
      print("Error : $error");
      throw Exception("Failed to fetch Data");
    }
  }

  Future<Product> fetchSingleData(int id) async{
    final String url = "https://fakestoreapi.com/products/$id";

    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        Product product = Product.fromJson(json.decode(response.body));
        return product;
      }
      else{
        print("Failed to fetch the product");
        throw Exception("Failed to fetch the product");
      }
    }catch(error){
      print("Error : $error");
      throw Exception("Failed to fetch Data");
    }
  }
}