import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/networks/dio_factory.dart';
import '../../data/model/propertyImage_model.dart';
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
  final int pageSize = 20;
  var hasNextPage = true.obs;
  var totalPages = 30.obs;

  void goToPage(int index) {
    if (index != currentPage.value) {
      currentPage.value = index;
      fetchProperties();
    }
  }

  Future <void> fetchProperties({int? page, int? size}) async {
    isLoading.value = true;

    int current = page ?? currentPage.value;
    int limit = size ?? pageSize;
    String? type;
    switch (selectedIndex.value) {
      case 0:
        type = "HOME";
        break;
      case 1:
        type = "APPARTMENT";
        break;
      case 2:
        type = "VILLA";
        break;
      case 3:
        type = "LAND";
        break;
      case 4:
        type = "STORE";
        break;
      case 5:
        type = "OFFICE";
        break;
      case 6:
        type = "OTHER";
        break;
      default:
        type = null;
    }

    final result = await repository.getAllProperties(
      page: current,
      size: limit,
      type: type,
    );

    result.fold((failure) => failureMessage.value = failure.err_message, (
      data,
    ) {
      properties.value = data.data.content;
      allProperties = data.data.content;
      totalPages.value = data.data.totalPages ?? 1;
      hasNextPage.value = data.data.last != true;
      failureMessage.value = properties.isEmpty ? "لا توجد عقارات متاحة." : "";
    });

    isLoading.value = false;
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
    currentPage.value = 0;

    if (index == -1) {
      fetchProperties(page: 0, size: pageSize);
    } else {
      fetchProperties(page: 0, size: pageSize);
    }
  }

  void filterProperties() {
    if (selectedIndex.value == -1) {
      properties.value = allProperties;
      return;
    }

    String type;
    switch (selectedIndex.value) {
      case 0:
        type = "HOME";
        break;
      case 1:
        type = "APARTMENT";
        break;
      case 2:
        type = "VILLA";
        break;
      case 3:
        type = "LAND";
        break;
      case 4:
        type = "STORE";
        break;
      case 5:
        type = "OFFICE";
        break;
      case 6:
        type = "OTHER";
        break;
      default:
        type = "";
    }

    properties.value =
        allProperties.where((property) => property.houseType == type).toList();

    failureMessage.value =
        properties.isEmpty ? "لا توجد عقارات متاحة لهذه الفئة بعد." : "";
  }

  List<CustomProperties> get propertiesList {
    return properties.map((property) {
      final sortedImages = [
        ...property.propertyImageList.where((img) => img.type == "MAIN"),
        ...property.propertyImageList.where((img) => img.type == "SUB"),
      ];
      final mainImage =
          sortedImages.isNotEmpty
              ? sortedImages[0]
              : PropertyImageModel(
                id: 0,
                imageUrl: AppImages.noImage,
                type: "MAIN",
              );
      return CustomProperties(
        imagePath: mainImage.imageUrl,
        place: property.location,
        propertyType: property.houseType,
        propertyIcon: _getIconForType(property.houseType.name),
        onTap: () {
          Get.toNamed('/propertyDetails', arguments: property);
        },
      );
    }).toList();
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case "HOME":
        return Icons.house_sharp;
      case "APARTMENT":
        return Icons.apartment;
      case "VILLA":
        return Icons.villa;
      case "LAND":
        return Icons.landscape;
      case "STORE":
        return Icons.store;
      case "OFFICE":
        return Icons.business;
      case "OTHER":
        return Icons.category;
      default:
        return Icons.house;
    }
  }
}
