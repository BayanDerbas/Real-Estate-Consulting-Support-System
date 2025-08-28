import 'package:get/get.dart';
import 'package:graduation_project/core/networks/dio_factory.dart';
import '../../data/model/get_posts_by_expertId/expert_posts_model.dart';
import '../../data/repository/expert_posts_repository.dart';

class ExpertPostsController extends GetxController {
  final ExpertPostsRepository repository;
  final int expertId;

  ExpertPostsController(this.repository, this.expertId);

  var isLoading = false.obs;
  var posts = <ExpertPost>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    final result = await repository.getPostsByExpert(expertId);
    isLoading.value = false;

    result.fold(
      (failure) {
        Get.snackbar("Error", failure.err_message);
        posts.value = [];
      },
      (response) {
        posts.value = response.data ?? [];
      },
    );
  }
}
