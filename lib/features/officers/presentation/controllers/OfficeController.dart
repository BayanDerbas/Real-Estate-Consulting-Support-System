import 'package:get/get.dart';
import '../../data/model/office.dart';
import '../../data/repository/OfficeRepository.dart';

class OfficeController extends GetxController {
  final OfficeRepository repository;

  var isLoading = true.obs;
  var officesList = <Office>[].obs;

  var officeStates = <int, Map<String, bool>>{}.obs;

  OfficeController(this.repository);

  @override
  void onInit() {
    super.onInit();
    fetchOffices();
  }

  void fetchOffices() async {
    isLoading(true);
    final result = await repository.getAllOffices();
    result.fold(
          (failure) => print(" فشل في جلب المكاتب: $failure"),
          (data) {
        print(" تم جلب المكاتب: ${data.data.content.length}");
        officesList.value = data.data.content;

        for (int i = 0; i < officesList.length; i++) {
          officeStates[i] = {
            "isFavorite": false,
            "isFollowing": false,
            "isExpanded": false,
          };
        }
      },
    );
    isLoading(false);
  }

  void toggleFavorite(int index) {
    final current = officeStates[index]?["isFavorite"] ?? false;
    officeStates[index]?["isFavorite"] = !current;
    officeStates.refresh();
  }

  void toggleFollow(int index) {
    final current = officeStates[index]?["isFollowing"] ?? false;
    officeStates[index]?["isFollowing"] = !current;
    officeStates.refresh();
  }

  void toggleExpand(int index) {
    final current = officeStates[index]?["isExpanded"] ?? false;
    officeStates[index]?["isExpanded"] = !current;
    officeStates.refresh();
  }
}
