import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';

class CustomAddDiscountDialog extends StatelessWidget {
  final TabController tabController;
  final TextEditingController codeController;
  final TextEditingController amountController;
  final TextEditingController validityController;
  final TextEditingController sessionsBeforeDiscountController;
  final TextEditingController discountPercentageController;
  final TextEditingController expiryDateController;
  final TextEditingController descriptionController;
  final TextEditingController descriptionSessionsController;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String codeLabel;
  final String amountLabel;
  final String validityLabel;
  final String sessionsLabel;
  final String percentageLabel;
  final String expiryLabel;
  final String descriptionLabel;
  final String codeHint;
  final String amountHint;
  final String validityHint;
  final String sessionsHint;
  final String percentageHint;
  final String expiryHint;
  final String descriptionHint;

  const CustomAddDiscountDialog({
    super.key,
    required this.tabController,
    required this.codeController,
    required this.amountController,
    required this.validityController,
    required this.sessionsBeforeDiscountController,
    required this.discountPercentageController,
    required this.expiryDateController,
    required this.descriptionController,
    required this.descriptionSessionsController,
    required this.onSave,
    required this.onCancel,
    this.codeLabel = "الكود",
    this.amountLabel = "مبلغ الخصم",
    this.validityLabel = "صلاحية",
    this.sessionsLabel = "عدد جلسات قبل الخصم",
    this.percentageLabel = "نسبة الخصم",
    this.expiryLabel = "تاريخ صلاحية",
    this.descriptionLabel = "الوصف",
    this.codeHint = "اكتب اسم الكود الذي تريد",
    this.amountHint = "اكتب المبلغ",
    this.validityHint = "مرات استخدام الكود",
    this.sessionsHint = "اكتب كم جلسة يجب ان يحجز ليتم خصم له",
    this.percentageHint = "اكتب النسبة",
    this.expiryHint = "لأي تاريخ صالح هذا العرض",
    this.descriptionHint = "الوصف...",
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.lightGrey,
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.98,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabBar(
                      controller: tabController,
                      indicatorColor: AppColors.lavender,
                      labelColor: AppColors.deepNavy,
                      unselectedLabelColor: Colors.black45,
                      dividerColor: AppColors.lightGrey,
                      labelStyle: Fonts.taj.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: Fonts.taj.copyWith(fontSize: 20),
                      tabs: const [Tab(text: 'كود'), Tab(text: 'جلسات')],
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          _buildCodeTab(),
                          _buildSessionsTab(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildButtons(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ).padding(EdgeInsets.symmetric(horizontal: 5));
  }

  Widget _buildCodeTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildField(codeLabel, codeHint, controller: codeController),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildField(amountLabel, amountHint, controller: amountController),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildField(validityLabel, validityHint, controller: validityController),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildField(
            descriptionLabel,
            descriptionHint,
            controller: descriptionController,
            minLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildSessionsTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildField(sessionsLabel, sessionsHint, controller: sessionsBeforeDiscountController),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildField(percentageLabel, percentageHint, controller: discountPercentageController),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildField(expiryLabel, expiryHint, controller: expiryDateController),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildField(
            descriptionLabel,
            descriptionHint,
            controller: descriptionSessionsController,
            minLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildField(
      String label,
      String hint, {
        int minLines = 1,
        TextEditingController? controller,
      }) {
    bool isDescriptionField = label == descriptionLabel;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              label,
              style: Fonts.taj.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              controller: controller,
              minLines: minLines,
              maxLines: minLines,
              style: Fonts.taj.copyWith(fontSize: 14),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: Fonts.taj.copyWith(
                  fontSize: 12,
                  color: AppColors.grey,
                ),
                filled: true,
                fillColor: AppColors.pureWhite,
                contentPadding: isDescriptionField
                    ? const EdgeInsets.symmetric(horizontal: 12, vertical: 40)
                    : const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.pureWhite),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.pureWhite),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.pureWhite),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            onCancel();
            Navigator.pop(context);
          },
          child: Text(
            "الغاء",
            style: Fonts.taj.copyWith(
              color: AppColors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onSave();
            Navigator.pop(context);
          },
          child: Text(
            "حفظ",
            style: Fonts.taj.copyWith(
              color: AppColors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}