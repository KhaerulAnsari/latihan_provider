import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Total with ChangeNotifier
{
  int _kurang= 0;

  int get kurang => _kurang;

  set kurang(int value){
    _kurang = value;
    notifyListeners();
  }
}