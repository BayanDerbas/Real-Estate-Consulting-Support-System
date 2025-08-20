import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/constants/styles.dart';
import '../../../../core/widgets/base_filter_screen.dart';
import '../../data/model/filter_tickets_request_model.dart' as filter;
import '../controllers/get_filtered_tickets_controller.dart';

class FilteredTicketPage extends StatelessWidget {
  FilteredTicketPage({super.key});

  final controller = Get.find<FilteredTicketsController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BaseFilteredScreen(
      appBarTitle: "filtered_tickets".tr,
      bodyText: "",
      bodyBuilder:
          (ctx) => Obx(() {
            if (controller.isLoading.value && controller.tickets.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.errorMessage.isNotEmpty) {
              return Center(child: Text(controller.errorMessage.value));
            }
            if (controller.tickets.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.noData,
                      fit: BoxFit.fill,
                      height: height / 4,
                    ),
                    Text(
                      "no_tickets_found".tr,
                      style: setTextStyle(
                        GoogleFonts.itim,
                        15,
                        AppColors.black,
                        FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: controller.tickets.length,
              itemBuilder: (context, index) {
                final ticket = controller.tickets[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(ticket.description ?? 'No Description'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location: ${ticket.location ?? "N/A"}'),
                        Text(
                          'Price: \$${ticket.lowPrice} - \$${ticket.highPrice}',
                        ),
                        Text('Area: ${ticket.area} sq.m'),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
      filterSheetBuilder: (ctx, onApply) {
        return _buildFilterSheet(ctx, onApply);
      },
      onFilterApply: () {
        debugPrint("Filter Applied");
      },
    );
  }

  Widget _buildFilterSheet(BuildContext context, VoidCallback onApply) {
    final lowPriceController = TextEditingController();
    final highPriceController = TextEditingController();
    final lowAreaController = TextEditingController();
    final highAreaController = TextEditingController();
    final locationController = TextEditingController();

    String? selectedServiceType = "BUY";
    String? selectedHouseType = "HOME";

    return StatefulBuilder(
      builder: (ctx, setState) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            top: 20,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(
                  "low_price".tr,
                  lowPriceController,
                  TextInputType.number,
                ),
                _buildTextField(
                  "high_price".tr,
                  highPriceController,
                  TextInputType.number,
                ),
                _buildTextField(
                  "low_area".tr,
                  lowAreaController,
                  TextInputType.number,
                ),
                _buildTextField(
                  "high_area".tr,
                  highAreaController,
                  TextInputType.number,
                ),
                _buildTextField(
                  "location".tr,
                  locationController,
                  TextInputType.text,
                ),

                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedServiceType,
                  items:
                      ['buy', 'rent']
                          .map(
                            (type) => DropdownMenuItem(
                              value: type.toUpperCase(),
                              child: Text(type.tr),
                            ),
                          )
                          .toList(),
                  onChanged:
                      (value) => setState(() => selectedServiceType = value),
                  decoration: InputDecoration(
                    labelText: 'service_type'.tr,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedHouseType,
                  items:
                      [
                            'HOME',
                            'UPPER_FLOOR',
                            'VILLA',
                            'OFFICE',
                            'LAND',
                            'STORE',
                            'OTHER',
                          ]
                          .map(
                            (type) => DropdownMenuItem(
                              value: type.toUpperCase(),
                              child: Text(type.tr),
                            ),
                          )
                          .toList(),
                  onChanged:
                      (value) => setState(() => selectedHouseType = value),
                  decoration: InputDecoration(
                    labelText: 'house_type'.tr,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final filterModel = filter.FilterTicketsModel(
                      lowPrice: double.tryParse(lowPriceController.text),
                      highPrice: double.tryParse(highPriceController.text),
                      serviceType: selectedServiceType,
                      houseType: selectedHouseType,
                      lowArea:
                          lowAreaController.text.isNotEmpty
                              ? lowAreaController.text
                              : null,
                      highArea:
                          highAreaController.text.isNotEmpty
                              ? highAreaController.text
                              : null,
                      location:
                          locationController.text.isNotEmpty
                              ? locationController.text
                              : null,
                    );
                    print(filterModel.toJson());
                    controller.fetchFilteredTickets(filterModel);
                    onApply();
                  },
                  child: Text("apply_filters".tr),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    TextInputType keyboardType,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
