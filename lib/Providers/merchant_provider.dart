import 'package:flutter/material.dart';
import 'package:marketplace/General/config.dart';

class MerchantProvider with ChangeNotifier {
  Map _selectedMerchant = merchants[0];

  Map get selectedMerchant => _selectedMerchant;

  void setMerchant(Map merchant) {
    _selectedMerchant = merchant;
    notifyListeners();
  }
}