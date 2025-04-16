import 'package:flutter/material.dart';
import 'shoedata.dart';

class CartProvider with ChangeNotifier {
  final List<Shoe> _cart = [];

  List<Shoe> get cart => _cart;

  void addToCart(Shoe shoe) {
    _cart.add(shoe);
    notifyListeners();
  }

  void removeFromCart(Shoe shoe){
    _cart.remove(shoe);
    notifyListeners();
  }
}
