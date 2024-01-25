import 'package:flutter/material.dart';

class WidgetsProvider extends ChangeNotifier {
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
