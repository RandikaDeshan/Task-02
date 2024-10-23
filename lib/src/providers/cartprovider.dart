import 'package:flutter/material.dart';
import 'package:second_app/src/models/cartmodel.dart';

class CartProvider extends ChangeNotifier{

  Map<String,CartItem> _products = {};

  Map<String,CartItem> get products {
    return {..._products};
  }

  void addToCart(String id, String title, String image, double price, int quantity){
    if(_products.containsKey(id)){
      _products.update(id, (existingCartItem)=>CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          image: existingCartItem.image,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + quantity));
    }else{
      _products.putIfAbsent(id.toString(), ()=>CartItem(
          id: id,
          title: title,
          image: image,
          price: price,
          quantity: quantity));
    }
    notifyListeners();
  }

  void removeProduct(String id){
    _products.remove(id);
    notifyListeners();
  }

  double get total{
    var total = 0.0;
    _products.forEach((key, cartItem){
      total += cartItem.price * cartItem.quantity;
    });
    notifyListeners();
    return total;
  }

  void addQuantity(String id){
    if(_products.containsKey(id)){
      _products.update(id, (existingItem)=>CartItem(
          id: existingItem.id,
          title: existingItem.title,
          image: existingItem.image,
          price: existingItem.price,
          quantity: existingItem.quantity + 1));
    }
    notifyListeners();
  }

  void removeQuantity(String id){
    if(_products[id]!.quantity >1){
      _products.update(id, (existingItem)=>CartItem(
          id: existingItem.id,
          title: existingItem.title,
          image: existingItem.image,
          price: existingItem.price,
          quantity: existingItem.quantity - 1));
    }
    notifyListeners();
  }
}