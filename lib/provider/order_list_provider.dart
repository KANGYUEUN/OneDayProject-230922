import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListProvider extends ChangeNotifier {
  final List<String> _orderList = [];

  List<String> get orderList => _orderList;

  void addToOrderList(String product) {
    if (product.isNotEmpty) {
      _orderList.add(product);
      notifyListeners(); // 변경 사항을 리스너에게 알립니다.
    }
  }

  void removeFromOrderList(String item) {
    _orderList.remove(item);
    notifyListeners(); // 변경 사항을 리스너에게 알립니다.
  }
}
