import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../data/model/property_model.dart';
import '../../data/repository/property_repository.dart';
import '../widgets/Custom_Properties.dart';

class PropertiesController extends GetxController {
  final PropertyRepository repository;

  PropertiesController(this.repository);

  var selectedIndex = (-1).obs;
  var allProperties = <PropertyModel>[];
  var properties = <PropertyModel>[].obs;
  var failureMessage = ''.obs;
  var isLoading = false.obs;
  var currentPage = 0.obs;
  final int pageSize = 2;
  var hasNextPage = true.obs;
  var totalPages = 10.obs;

  void goToPage(int index) {
    if (index != currentPage.value) {
      currentPage.value = index;
      fetchProperties();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchProperties(page: currentPage.value, size: pageSize);
  }

  void fetchProperties({int? page, int? size}) async {
    isLoading.value = true;
    await DioFactory.loadToken();

    int current = page ?? currentPage.value;
    int limit = size ?? pageSize;
    String? type;
    switch (selectedIndex.value) {
      case 0:
        type = "Home";
        break;
      case 1:
        type = "Apartment";
        break;
      case 2:
        type = "Store";
        break;
      case 3:
        type = "UPPER_FLOOR";
        break;
      default:
        type = null;
    }

    final result = await repository.getAllProperties(
      page: current,
      size: limit,
    );

    result.fold((failure) => failureMessage.value = failure.err_message, (
      data,
    ) {
      properties.value = data;
      hasNextPage.value = data.length == limit;
      failureMessage.value =
          properties.isEmpty ? "No properties available." : "";
    });

    isLoading.value = false;
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
    currentPage.value = 0;
    fetchProperties(page: 0, size: pageSize);
  }

  void filterProperties() {
    if (selectedIndex.value == -1) {
      properties.value = allProperties;
      return;
    }

    String type;
    switch (selectedIndex.value) {
      case 0:
        type = "Home";
        break;
      case 1:
        type = "Apartment";
        break;
      case 2:
        type = "Store";
        break;
      case 3:
        type = "UPPER_FLOOR";
        break;
      default:
        type = "";
    }

    properties.value =
        allProperties.where((property) => property.houseType == type).toList();

    failureMessage.value =
        properties.isEmpty
            ? "No properties available for this category yet."
            : "";
  }

  List<CustomProperties> get propertiesList {
    return properties.map((property) {
      final hasImages =
          property.propertyImageList != null &&
          property.propertyImageList!.isNotEmpty;

      return CustomProperties(
        imagePath:
            hasImages
                ? property.propertyImageList![0].imageUrl
                : AppImages.noImage,
        place: property.location ?? 'Unknown Location',
        propertyType: property.houseType ?? 'Unknown Type',
        propertyIcon: Icons.house,
        onTap: () {
          Get.toNamed('/propertyDetails', arguments: property);
        },
      );
    }).toList();
  }
}
