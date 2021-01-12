import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier
{
  int _quality= 0;

  int get quality => _quality;

  set quality(int value){
    _quality = value;
    notifyListeners();
  }
}