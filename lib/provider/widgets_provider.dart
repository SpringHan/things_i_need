import 'package:flutter/material.dart';

class WidgetsProvider extends ChangeNotifier {
  final GlobalKey appBarKey = GlobalKey();
  double? appBarHeight;

  bool usingAddPage = false;

  // Add Page
  FocusNode textFieldFocus = FocusNode();
  TextEditingController textController = TextEditingController();

  void addPageChange() {
    usingAddPage = !usingAddPage;
    notifyListeners();
  }

  // void focusNodeDispose() {
  //   textFieldFocus.dispose();
  // }
}
