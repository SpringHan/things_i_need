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

  void unfocus() {
    if (textFieldFocus.hasFocus) {
      textFieldFocus.unfocus();
    }
  }

  // void focusNodeDispose() {
  //   textFieldFocus.dispose();
  // }
}
