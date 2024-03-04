import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DataProvider extends ChangeNotifier {
  final dataInformation = Hive.box('dataContact');

  void getDataAdd(String dataName) {
    dataInformation.add(dataName);
    notifyListeners();
  }

  void getUpdateData(int index, String myData) {
    dataInformation.values.toList()[index] = myData;
    notifyListeners();
  }

  void getRemoveUserData(int index) {
    dataInformation.deleteAt(index);
    notifyListeners();
  }
}
