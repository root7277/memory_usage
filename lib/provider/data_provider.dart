import 'package:flutter/material.dart';
import 'package:memory_usage/provider/data_model.dart';

class DataProvider extends ChangeNotifier {
  List<Data> dataInformation = [];

  void getDataAdd(Data data_1) {
    dataInformation.add(data_1);
    notifyListeners();
  }

  void getUpdateData(int id, String myData) {
    dataInformation[id].information = myData;
    notifyListeners();
  }

  void getRemoveUserData(int index) {
    dataInformation.removeAt(index);
    notifyListeners();
  }
}
