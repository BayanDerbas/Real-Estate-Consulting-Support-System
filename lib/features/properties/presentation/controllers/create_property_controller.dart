import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/properties/data/model/create_property_request_model.dart';
import 'package:graduation_project/features/properties/data/repository/property_repository.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_request_model.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import 'package:graduation_project/core/routes/routes.dart';

class CreatePropertyController extends GetxController {
  final PropertyRepository _propertyRepository;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController description = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController direction = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController numberOfBed = TextEditingController();
  final TextEditingController numberOfRooms = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController priceInMonth = TextEditingController();
  final TextEditingController numberOfBathrooms = TextEditingController();
  RxString houseType = 'HOME'.obs;
  RxString serviceType = 'BUY'.obs;
  late int clientId;
  SecureStorage storage = SecureStorage();

  CreatePropertyController(this._propertyRepository);

  Future<void> submitProperty() async {
    final userId = await storage.getUserId();
    final userIdInt = int.parse(userId!);
    if (!validateInput()) return;

    isLoading.value = true;
    errorMessage.value = '';

    final request = CreatePropertyRequestModel(
      officeId: userIdInt,
      description: description.text,
      houseType: houseType.value,
      serviceType: serviceType.value,
      location: location.text,
      direction: direction.text,
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
        print(failure.err_message);
        print(request.toJson());
        print('/////////////////////////////////////////////////////failure');
        errorMessage.value = failure.err_message;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "property Creation Failed",
          desc: errorMessage.value,
          btnOkOnPress: () {},
        ).show();
      },
      (response) async {
        final id = await response.data?.id;
        print(request.toJson());
        print(
          '/////////////////////////////////////////////////////success$id',
        );

        await AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: "Success",
          desc: "property created successfully",
          autoHide: const Duration(seconds: 2),
        ).show();
        Future.delayed(Duration(seconds: 2));
        Get.offNamed(AppRoutes.addImagesToProperty, arguments: id);
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
    direction.dispose();
    area.dispose();
    numberOfBed.dispose();
    numberOfRooms.dispose();
    numberOfBathrooms.dispose();
    super.onClose();
  }
}
