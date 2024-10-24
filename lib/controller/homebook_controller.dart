import 'package:get/get.dart';

class HomebookController extends GetxController {
   List<String> categoriesBook = [
      "Novel",
      "Self-love",
      "Science",
      "Romance",
      "Thrillers",
      "Crime Fiction"
    ];

  int selectedIndex = 0;

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}