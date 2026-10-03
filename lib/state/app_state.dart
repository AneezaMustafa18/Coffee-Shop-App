import 'package:bigbrains_coffeeshop_task/models/coffee.dart';
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  // =========================================================
  // USER
  // =========================================================

  String userEmail = '';

  void setUserEmail(String email) {
    userEmail = email.trim();
    notifyListeners();
  }

  // =========================================================
  // FAVORITES
  // =========================================================

  final List<Coffee> _favorites = [];

  List<Coffee> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(Coffee coffee) {
    return _favorites.any(
          (item) =>
      item.name == coffee.name &&
          item.description == coffee.description,
    );
  }

  void toggleFavorite(Coffee coffee) {
    final index = _favorites.indexWhere(
          (item) =>
      item.name == coffee.name &&
          item.description == coffee.description,
    );

    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(coffee);
    }

    notifyListeners();
  }

  // =========================================================
  // CART
  // =========================================================

  final List<Coffee> _cartItems = [];

  List<Coffee> get cartItems => List.unmodifiable(_cartItems);

  int get cartCount => _cartItems.length;

  void addToCart(Coffee coffee) {
    _cartItems.add(coffee);
    notifyListeners();
  }

  void increaseQuantity(Coffee coffee) {
    _cartItems.add(coffee);
    notifyListeners();
  }

  void decreaseQuantity(Coffee coffee) {
    final index = _cartItems.indexWhere(
          (item) =>
      item.name == coffee.name &&
          item.description == coffee.description,
    );

    if (index != -1) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void removeFromCart(Coffee coffee) {
    final index = _cartItems.indexWhere(
          (item) =>
      item.name == coffee.name &&
          item.description == coffee.description,
    );

    if (index != -1) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void removeAllFromCart(Coffee coffee) {
    _cartItems.removeWhere(
          (item) =>
      item.name == coffee.name &&
          item.description == coffee.description,
    );

    notifyListeners();
  }

  int getQuantity(Coffee coffee) {
    return _cartItems.where(
          (item) =>
      item.name == coffee.name &&
          item.description == coffee.description,
    ).length;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // =========================================================
  // ORDERS
  // =========================================================

  final List<Coffee> _orders = [];

  List<Coffee> get orders => List.unmodifiable(_orders);

  void addOrder(List<Coffee> items) {
    _orders.addAll(items);
    notifyListeners();
  }

  // =========================================================
  // CART TOTAL
  // =========================================================

  double get cartSubtotal {
    return _cartItems.fold(
      0,
          (sum, coffee) {
        return sum + (double.tryParse(coffee.price) ?? 0);
      },
    );
  }

  double get deliveryFee {
    return _cartItems.isEmpty ? 0 : 1.00;
  }

  double get cartTotal {
    return cartSubtotal + deliveryFee;
  }
}