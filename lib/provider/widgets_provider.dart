import 'package:flutter/material.dart';

class WidgetsProvider extends ChangeNotifier {
  WidgetsProvider() {
    listViewController.addListener(() {
        if (listViewController.hasClients) {
          if (
            listViewController.position.atEdge
            && listViewController.position.pixels == 0
          ) {
            onTop = true;
          } else {
            onTop = false;
          }

          notifyListeners();
        }
    });
  }

  bool usingAddPage = false;

  // Add Page
  FocusNode textFieldFocus = FocusNode();
  TextEditingController textController = TextEditingController();

  // Floating Add Button in main page.
  bool onTop = true;
  ScrollController listViewController = ScrollController();

  void addPageChange() {
    usingAddPage = !usingAddPage;
    notifyListeners();
  }

  void unfocus() {
    if (textFieldFocus.hasFocus) {
      textFieldFocus.unfocus();
    }
  }
}
