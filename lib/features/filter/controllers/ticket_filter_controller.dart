import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/ticket/data/model/filter_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

enum PropertyType { HOME, UPPER_FLOOR, VILLA, OFFICE, LAND, STORE, OTHER }

enum PropertyDirection {
  SOUTH,
  NORTH,
  EAST,
  WEST,
  SOUTH_WEST,
  SOUTH_EAST,
  NORTH_EAST,
  NORTH_WEST,
}

enum PropertyService { BUY, RENT }

class ChipModel {
  final String label;
  final Enum value;

  ChipModel({required this.label, required this.value});
}

class TicketFilterController extends GetxController {
  TextEditingController search = TextEditingController();

  List<ChipModel> propertyTypes = [
    ChipModel(label: 'بيت', value: PropertyType.HOME),
    ChipModel(label: 'شقة', value: PropertyType.UPPER_FLOOR),
    ChipModel(label: 'فيلا', value: PropertyType.VILLA),
    ChipModel(label: 'مكتب', value: PropertyType.OFFICE),
    ChipModel(label: 'قطعة أرض', value: PropertyType.LAND),
    ChipModel(label: 'محل', value: PropertyType.STORE),
    ChipModel(label: 'غير ذلك', value: PropertyType.OTHER),
  ];

  List<ChipModel> propertyDirections = [
    ChipModel(label: 'شمال', value: PropertyDirection.SOUTH),
    ChipModel(label: 'جنوب', value: PropertyDirection.NORTH),
    ChipModel(label: 'شرق', value: PropertyDirection.EAST),
    ChipModel(label: 'غرب', value: PropertyDirection.WEST),
    ChipModel(label: 'شمال - غرب', value: PropertyDirection.SOUTH_WEST),
    ChipModel(label: 'شمال - شرق', value: PropertyDirection.SOUTH_EAST),
    ChipModel(label: 'جنوب - شرق', value: PropertyDirection.NORTH_EAST),
    ChipModel(label: 'جنوب - غرب', value: PropertyDirection.NORTH_WEST),
  ];

  List<ChipModel> propertyServices = [
    ChipModel(label: 'بيع', value: PropertyService.BUY),
    ChipModel(label: 'استئجار', value: PropertyService.RENT),
  ];

  Rx<SfRangeValues> prices = Rx(SfRangeValues(200, 800));
  Rx<SfRangeValues> area = Rx(SfRangeValues(100, 600));

  RxList<ChipModel> selectedPropertyTypes = <ChipModel>[].obs;
  RxList<ChipModel> selectedPropertyDirections = <ChipModel>[].obs;
  RxList<ChipModel> selectedPropertyServices = <ChipModel>[].obs;

  RxBool ignorePrice = false.obs;
  RxBool ignoreArea = false.obs;

  void onChangedPrice(SfRangeValues value) {
    prices(value);
  }

  void onChangedArea(SfRangeValues value) {
    area(value);
  }

  List<FilterItemModel> onFilter() {
    List<FilterItemModel> list = [];

    // list.add(
    //   FilterItemModel(
    //     operation: OperationEnum.LIKE_NAME,
    //     value: search.text,
    //     joinTable: "user",
    //   ),
    // );

    list.add(
      FilterItemModel(
        column: "description",
        operation: OperationEnum.LIKE,
        value: search.text,
      ),
    );
    list.add(
      FilterItemModel(
        column: "location",
        operation: OperationEnum.LIKE,
        value: search.text,
      ),
    );

    if (ignorePrice.isFalse) {
      list.add(
        FilterItemModel(
          column: "lowPrice",
          operation: OperationEnum.GREATER_THAN,
          value: prices.value.start * 1000000 - 1,
        ),
      );

      list.add(
        FilterItemModel(
          column: "highPrice",
          operation: OperationEnum.LESS_THAN,
          value: prices.value.end * 1000000 + 1,
        ),
      );
    }
    if (ignoreArea.isFalse) {
      list.add(
        FilterItemModel(
          column: "area",
          operation: OperationEnum.BETWEEN,
          value: "${area.value.start.round()},${area.value.end.round()}",
        ),
      );
    }
    if (selectedPropertyTypes.isNotEmpty) {
      FilterItemModel m = FilterItemModel(
        column: "houseType",
        value: selectedPropertyTypes
            .map((element) => element.value.name)
            .toList()
            .join(","),
        operation: OperationEnum.IN,
      );
      list.add(m);
    }

    if (selectedPropertyServices.isNotEmpty) {
      FilterItemModel m = FilterItemModel(
        column: "serviceType",
        value: selectedPropertyServices
            .map((element) => element.value.name)
            .toList()
            .join(","),
        operation: OperationEnum.IN,
      );
      list.add(m);
    }

    if (selectedPropertyDirections.isNotEmpty) {
      FilterItemModel m = FilterItemModel(
        column: "direction",
        value: selectedPropertyDirections
            .map((element) => element.value.name)
            .toList()
            .join(","),
        operation: OperationEnum.IN,
      );
      list.add(m);
    }

    return list;
  }
}
