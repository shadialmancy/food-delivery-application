import 'package:flutter/material.dart';

class DetailController {
  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  void backToHome() {
    Navigator.pop(context!);
  }

  void goToInformation() {
    Navigator.pushNamed(context!, '/informationRestaurant');
  }

  void goToItemsPage() {
    Navigator.pushNamed(context!, '/itemsPage');
  }
}
