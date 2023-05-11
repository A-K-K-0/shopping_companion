import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.
  ///
  StreamController<String> _totalStream = StreamController.broadcast();
  Stream<String> get total => _totalStream.stream;

  StreamController<int> _itemCount = StreamController.broadcast();
  Stream<int> get itemCount => _itemCount.stream;
  List<double>? priceList;

  // State field(s) for CountController widget.
  int countControllerValue = 1;
  int position = -1;
  double _total = 0;

  /// Initialization and disposal methods.

  void increment(int clickedPosition, List<double> prices) {
    countControllerValue += 1;
    _itemCount.sink.add(countControllerValue);
    position = clickedPosition;
    calculateTotal(prices);
  }

  void decrement(int clickedPosition, List<double> prices) {
    if (countControllerValue <= 1) return;
    countControllerValue -= 1;
    _itemCount.sink.add(countControllerValue);
    position = clickedPosition;
    calculateTotal(prices);
  }

  void initState(BuildContext context) {}

  void dispose() {}

  void calculateTotal(List<double> prices) async {
    priceList = prices;
    _total = 0;
    for (int i = 0; i < prices.length; i++) {
      print(prices[i]);
      if (position == i) {
        _total += (prices[i]) * countControllerValue;
      } else {
        _total += (prices[i]);
      }
    }

    //inTotal
    _totalStream.sink.add(_total.toString());
  }

  int getNumOfItems() {
    return priceList?.length ?? 0;
  }

  double getTotal() {
    return _total;
  }

  /// Additional helper methods are added here.
}
