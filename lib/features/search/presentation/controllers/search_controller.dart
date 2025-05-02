import 'package:get/get.dart';

class MainSearchController extends GetxController {
  var selectedFilters = <String>[].obs;
  void selectFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  bool isSelected(String filter) => selectedFilters.contains(filter);

  final List<String> filters = ['خبير', 'عقار', 'الكل'];
}
