import 'package:flutter/cupertino.dart';

class CartItems {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems({required this.id, required this.title, required this.quantity, required this.price});
}

class Cart with ChangeNotifier {
  final Map<String, CartItems> _items = {};

  Map<String, CartItems> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productID, double price, String title) {
    if (_items.containsKey(productID)) {
      // change quantity......
      _items.update(
          productID,
          (existingCartItem) => CartItems(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1));
    } else {
      _items.putIfAbsent(productID,
          () => CartItems(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }

  void removeItem(String productID) {
    _items.remove(productID);
    notifyListeners();
  }

  void removeSingleItem(String productID) {
    if (!_items.containsKey(productID)) {
      return;
    }
    if (_items[productID]!.quantity > 1) {
      _items.update(
          productID,
          (existingCartItem) => CartItems(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity,
              price: existingCartItem.price - 1));
    } else {
      _items.remove(productID);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
