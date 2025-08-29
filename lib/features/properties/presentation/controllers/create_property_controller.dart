import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/properties/data/model/create_property_request_model.dart';
import 'package:graduation_project/features/properties/data/repository/property_repository.dart';
import 'package:graduation_project/core/routes/routes.dart';

import '../../../ticket/data/model/ticket_model.dart';
import '../../data/model/property_model.dart';

class CreatePropertyController extends GetxController {
  final PropertyRepository _propertyRepository;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController description = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController numberOfBed = TextEditingController();
  final TextEditingController numberOfRooms = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController priceInMonth = TextEditingController();
  final TextEditingController numberOfBathrooms = TextEditingController();

  List<EnumModel<HouseType>> houseTypes = [
    EnumModel(label: 'بيت', value: HouseType.HOME),
    EnumModel(label: 'شقة', value: HouseType.UPPER_FLOOR),
    EnumModel(label: 'فيلا', value: HouseType.VILLA),
    EnumModel(label: 'مكتب', value: HouseType.OFFICE),
    EnumModel(label: 'قطعة أرض', value: HouseType.LAND),
    EnumModel(label: 'محل', value: HouseType.STORE),
    EnumModel(label: 'غير ذلك', value: HouseType.OTHER),
  ];

  List<EnumModel<Direction>> directions = [
    EnumModel(label: 'شمال', value: Direction.SOUTH),
    EnumModel(label: 'جنوب', value: Direction.NORTH),
    EnumModel(label: 'شرق', value: Direction.EAST),
    EnumModel(label: 'غرب', value: Direction.WEST),
    EnumModel(label: 'شمال - غرب', value: Direction.SOUTH_WEST),
    EnumModel(label: 'شمال - شرق', value: Direction.SOUTH_EAST),
    EnumModel(label: 'جنوب - شرق', value: Direction.NORTH_EAST),
    EnumModel(label: 'جنوب - غرب', value: Direction.NORTH_WEST),
  ];

  List<EnumModel<ServiceType>> serviceTypes = [
    EnumModel(label: 'بيع', value: ServiceType.BUY),
    EnumModel(label: 'شراء', value: ServiceType.SELL),
    EnumModel(label: 'استئجار', value: ServiceType.RENT),
  ];

  Rx<HouseType> selectedHouseType = Rx(HouseType.HOME);
  Rx<Direction> selectedDirection = Rx(Direction.SOUTH);
  Rx<ServiceType> selectedServiceType = Rx(ServiceType.BUY);

  late int clientId;
  SecureStorage storage = SecureStorage();

  CreatePropertyController(this._propertyRepository);

  Future<void> submitProperty() async {
    final userId = await storage.getOfficeId();
    final userIdInt = int.parse(userId!);
    if (!validateInput()) return;

    isLoading.value = true;
    errorMessage.value = '';

    final request = CreatePropertyRequestModel(
      officeId: userIdInt,
      description: description.text,
      houseType: selectedHouseType.value,
      serviceType: selectedServiceType.value,
      location: location.text,
      direction: selectedDirection.value,
      area: double.tryParse(area.text) ?? 0,
      numberOfBed: int.tryParse(numberOfBed.text) ?? 0,
      numberOfRooms: int.tryParse(numberOfRooms.text) ?? 0,
      numberOfBathrooms: int.tryParse(numberOfBathrooms.text) ?? 0,
      longitude: 0.0,
      latitude: 0.0,
      price: double.tryParse(price.text) ?? 0.0,
      priceInMonth: double.tryParse(priceInMonth.text) ?? 0.0,
    );

    final context = Get.context;
    if (context == null) return;

    final result = await _propertyRepository.createProperty(request);
    isLoading.value = false;

    result.fold(
      (failure) {
        errorMessage.value = failure.err_message;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "property Creation Failed",
          desc: errorMessage.value,
          btnOkOnPress: () {},
        ).show();
      },
      (response) {
        final id = response.data?.id;
        if (id == null) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: "Error",
            desc: "Failed to get property ID after creation.",
            btnOkOnPress: () {},
          ).show();
          return;
        }

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: "Success",
          desc: "Property created successfully. Proceed to add images.",
          btnOkText: "Add Images",
          btnOkOnPress: () {
            Get.offNamed(AppRoutes.addImagesToProperty, arguments: id);
          },
        ).show();
      },
    );
  }

  bool validateInput() {
    final formData = formKey.currentState;
    return formData?.validate() ?? false;
  }

  @override
  void onClose() {
    description.dispose();
    location.dispose();
    area.dispose();
    numberOfBed.dispose();
    numberOfRooms.dispose();
    numberOfBathrooms.dispose();
    super.onClose();
  }
}
