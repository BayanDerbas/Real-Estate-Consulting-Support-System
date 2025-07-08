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
      appBarTitle: "Filtered Tickets",
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
                      " No tickets found , Apply a filter to start.",
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
    String? selectedHouseType = "UPPER_FLOOR";

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
                  "Low Price",
                  lowPriceController,
                  TextInputType.number,
                ),
                _buildTextField(
                  "High Price",
                  highPriceController,
                  TextInputType.number,
                ),
                _buildTextField(
                  "Low Area",
                  lowAreaController,
                  TextInputType.number,
                ),
                _buildTextField(
                  "High Area",
                  highAreaController,
                  TextInputType.number,
                ),
                _buildTextField(
                  "Location",
                  locationController,
                  TextInputType.text,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedServiceType,
                  items:
                      ['BUY', 'RENT']
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ),
                          )
                          .toList(),
                  onChanged:
                      (value) => setState(() => selectedServiceType = value),
                  decoration: const InputDecoration(
                    labelText: 'Service Type',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedHouseType,
                  items:
                      ['UPPER_FLOOR', 'GROUND_FLOOR']
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ),
                          )
                          .toList(),
                  onChanged:
                      (value) => setState(() => selectedHouseType = value),
                  decoration: const InputDecoration(
                    labelText: 'House Type',
                    border: OutlineInputBorder(),
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
                    controller.fetchFilteredTickets(filterModel);
                    onApply(); // Will call Navigator.pop and trigger onFilterApply
                  },
                  child: const Text("Apply Filters"),
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
