import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_request_model.dart';
import 'package:graduation_project/features/ticket/data/repository/ticket_repository.dart';
import 'package:graduation_project/core/routes/routes.dart';

class CreateTicketController extends GetxController {
  final TicketRepositoryImpl _ticketRepository;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController description = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController direction = TextEditingController();
  final TextEditingController lowPrice = TextEditingController();
  final TextEditingController highPrice = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController numberOfBed = TextEditingController();
  final TextEditingController numberOfRooms = TextEditingController();
  final TextEditingController numberOfBathrooms = TextEditingController();
  RxString houseType = 'HOME'.obs;
  RxString serviceType = 'BUY'.obs;
  late int clientId;
  SecureStorage storage = SecureStorage();

  CreateTicketController(this._ticketRepository);

  Future<void> submitTicket() async {
    final userId = await storage.getUserId();
    if (!validateInput()) return;

    isLoading.value = true;
    errorMessage.value = '';

    final request = PublishTicketRequestModel(
      clientId: userId.toString(),
      description: description.text,
      houseType: houseType.value,
      serviceType: serviceType.value,
      location: location.text,
      direction: direction.text,
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

    final result = await _ticketRepository.createTicket(request);
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

        Get.offNamed(AppRoutes.baseTicketsPage);
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
    direction.dispose();
    lowPrice.dispose();
    highPrice.dispose();
    area.dispose();
    numberOfBed.dispose();
    numberOfRooms.dispose();
    numberOfBathrooms.dispose();
    super.onClose();
  }
}
