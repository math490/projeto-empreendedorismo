import 'package:flutter/material.dart';

class CashNotifier extends ValueNotifier<int> {
  CashNotifier() : super(0);

  void addCash(int amount) {
    value += amount;
  }
}

final cashNotifier = CashNotifier();
