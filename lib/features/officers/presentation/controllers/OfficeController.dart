import 'package:get/get.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../data/model/office.dart';
import '../../data/repository/OfficeRepository.dart';

class OfficeController extends GetxController {
  final OfficeRepository repository;
  final SecureStorage secureStorage = SecureStorage();
  var userRole = ''.obs;
  var isLoading = true.obs;
  var officesList = <Office>[].obs;
  var currentPage = 0.obs;
  var totalPages = 10.obs;
  var pageSize = 10;
  var role = ''.obs;
  var isFavoriteList = <int, RxBool>{}.obs;
  var isFollowingList = <int, RxBool>{}.obs;
  var isExpandedList = <int, RxBool>{}.obs;

  OfficeController(this.repository);

  void fetchOffices({int page = 0}) async {
    isLoading(true);
    try {
      final result = await repository.getAllOffices(page: page, size: pageSize);
      result.fold(
        (failure) {
          print("فشل في جلب المكاتب: $failure");
          officesList.clear();
          isFavoriteList.clear();
          isFollowingList.clear();
          isExpandedList.clear();
        },
        (data) {
          print("تم جلب المكاتب: ${data.data?.content?.length}");
          print("Raw Office Data: ${data.data?.content}");
          officesList.value = data.data!.content!;
          currentPage.value = data.data!.pageable!.pageNumber!;
          totalPages.value = data.data!.totalPages!;

          for (var office in officesList) {
            print(
              "Office: ${office.user?.firstName} ${office.user?.lastName},"
              " commercialRegisterImage: ${office.commercialRegisterImage}",
            );
          }

          isFavoriteList.clear();
          isFollowingList.clear();
          isExpandedList.clear();
          for (int i = 0; i < officesList.length; i++) {
            isFavoriteList[i] = false.obs;
            isFollowingList[i] = false.obs;
            isExpandedList[i] = false.obs;
          }
          print("isFavoriteList: ${isFavoriteList.value}");
          print("isFollowingList: ${isFollowingList.value}");
          print("isExpandedList: ${isExpandedList.value}");
        },
      );
    } catch (e, stackTrace) {
      print("خطأ في جلب المكاتب: $e");
      print("Stack Trace: $stackTrace");
      officesList.clear();
      isFavoriteList.clear();
      isFollowingList.clear();
      isExpandedList.clear();
    } finally {
      isLoading(false);
    }
  }

  void changePage(int newPage) {
    fetchOffices(page: newPage);
  }

  void toggleFavorite(int index) {
    if (isFavoriteList.containsKey(index)) {
      isFavoriteList[index]!.value = !isFavoriteList[index]!.value;
      print(
        "toggleFavorite: index=$index, isFavorite=${isFavoriteList[index]!.value}",
      );
    } else {
      print("Error: isFavoriteList does not contain index $index");
    }
  }

  void toggleFollow(int index) {
    if (isFollowingList.containsKey(index)) {
      isFollowingList[index]!.value = !isFollowingList[index]!.value;
      print(
        "toggleFollow: index=$index, isFollowing=${isFollowingList[index]!.value}",
      );
    } else {
      print("Error: isFollowingList does not contain index $index");
    }
  }

  Future<void> loadUserRole() async {
    final role = await secureStorage.getUserType();
    userRole.value = role ?? '';
    print("User Role: $userRole");
  }

  void toggleExpand(int index) {
    if (isExpandedList.containsKey(index)) {
      isExpandedList[index]!.value = !isExpandedList[index]!.value;
      print(
        "toggleExpand: index=$index, isExpanded=${isExpandedList[index]!.value}",
      );
    } else {
      print("Error: isExpandedList does not contain index $index");
    }
  }
}
