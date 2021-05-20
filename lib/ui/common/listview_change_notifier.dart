import 'package:flutter/material.dart';

class ListViewChangeNotifier<T> extends ChangeNotifier {
  List<T> data = [];
  void setData(List<T> newData) {
    data.clear();
    data.addAll(newData);
    notifyListeners();
  }

  void addAllItem(List<T> newData) {
    data.addAll(newData);
    notifyListeners();
  }

  void addItem(T item) {
    data.add(item);
    notifyListeners();
  }

  void removeItem(T item) {
    int index=data.indexOf(item);
    removeItemAt(index);
  }

  void removeItemAt(int index){
    data.removeAt(index);
    notifyListeners();
  }

  void clearData() {
    data.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    data.clear();
    super.dispose();
  }
}
