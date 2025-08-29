import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import 'package:graduation_project/core/routes/routes.dart';

import '../../data/model/publish_ticket_request_model.dart';

class UpdateTicketController extends GetxController {
  final TicketRepositoryImpl _repository;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController description = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController lowPrice = TextEditingController();
  final TextEditingController highPrice = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController numberOfBed = TextEditingController();
  final TextEditingController numberOfRooms = TextEditingController();
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

  int ticketId = 0;
  SecureStorage storage = SecureStorage();

  UpdateTicketController(this._repository);

  Future<void> submitTicket() async {
    final userId = await storage.getIdByRole();
    if (!validateInput()) return;

    isLoading.value = true;
    errorMessage.value = '';

    final request = PublishTicketRequestModel(
      clientId: userId.toString(),
      description: description.text,
      houseType: selectedHouseType.value,
      serviceType: selectedServiceType.value,
      location: location.text,
      direction: selectedDirection.value,
      lowPrice: double.tryParse(lowPrice.text) ?? 0,
      highPrice: double.tryParse(highPrice.text) ?? 0,
      area: double.tryParse(area.text) ?? 0,
      numberOfBed: int.tryParse(numberOfBed.text) ?? 0,
      numberOfRooms: int.tryParse(numberOfRooms.text) ?? 0,
      numberOfBathrooms: int.tryParse(numberOfBathrooms.text) ?? 0,
      dateTime: DateTime.now(),
    );

    final context = Get.context;
    if (context == null) return;

    final result = await _repository.updateTicket(ticketId, request);
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
          title: "Ticket Creation Failed",
          desc: errorMessage.value,
          btnOkOnPress: () {},
        ).show();
      },
      (response) async {
        print(request.toJson());
        print('/////////////////////////////////////////////////////success');

        await AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: "Success",
          desc: "Ticket created successfully",
          autoHide: const Duration(seconds: 2),
        ).show();

        Get.back();
        Get.back();
      },

      // (response) async {
      //   print(request.toJson());
      //   print('/////////////////////////////////////////////////////success');
      //   AwesomeDialog(
      //     context: context,
      //     dialogType: DialogType.success,
      //     title: "Success",
      //     desc: "Ticket created successfully",
      //     autoHide: const Duration(seconds: 2),
      //   ).show();
      //   Get.offNamed(AppRoutes.baseTicketsPage);
      //   await Future.delayed(Duration(seconds: 2));
      // },
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
    lowPrice.dispose();
    highPrice.dispose();
    area.dispose();
    numberOfBed.dispose();
    numberOfRooms.dispose();
    numberOfBathrooms.dispose();
    super.onClose();
  }

  void fillController(Ticket model) {
    ticketId = model.id;
    selectedDirection.value = model.direction ?? Direction.SOUTH;
    selectedServiceType.value = model.serviceType ?? ServiceType.BUY;
    selectedHouseType.value = model.houseType ?? HouseType.HOME;
    description.text = model.description;
    location.text = model.location;
    lowPrice.text = model.lowPrice.toString();
    highPrice.text = model.highPrice.toString();
    area.text = model.area.toString();
    numberOfBed.text = model.numberOfBed.toString();
    numberOfRooms.text = model.numberOfRooms.toString();
    numberOfBathrooms.text = model.numberOfBathrooms.toString();
  }
}
