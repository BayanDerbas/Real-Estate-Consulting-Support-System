import 'dart:developer';
import 'package:get/get.dart';
import 'package:graduation_project/features/posts/data/model/posts_response_model.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../data/repository/posts_repository.dart';

class PostsController extends GetxController {
  final PostsRepository repository;
  PostsController(this.repository);

  var selectedIndex = (-1).obs;
  var isLiked = false.obs;
  var isDisLiked = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var postsList = <PostsData>[].obs;
  final storage = SecureStorage();

  @override
  void onInit() {
    super.onInit();
    showPosts();
  }

  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  void toggleLike() {
    if (isDisLiked.value) {
      isLiked.value = false;
    }
    isLiked.value = !isLiked.value;
  }

  void toggleDisLike() {
    if (isLiked.value) {
      isDisLiked.value = false;
    }
    isDisLiked.value = !isDisLiked.value;
  }

  Future<void> showPosts() async {
    isLoading.value = true;
    errorMessage.value = '';
    await DioFactory.loadToken();

    final result = await repository.showPosts();
    result.fold(
      (failure) {
        errorMessage.value = failure.err_message;
        print("Error : $errorMessage");
      },
      (response) {
        postsList.assignAll(response.data ?? []);
        log("Fetch show posts Success: ${postsList.length} items");
      },
    );

    isLoading.value = false;
  }
}
