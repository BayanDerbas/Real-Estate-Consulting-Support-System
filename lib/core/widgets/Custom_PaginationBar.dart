// lib/core/widgets/custom_pagination_bar.dart

import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';

class CustomPaginationBar extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final void Function(int page) onPageSelected;

  const CustomPaginationBar({
    Key? key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const maxVisiblePages = 5;
    List<Widget> pages = [];

    int startPage = 0;
    int endPage = totalPages;

    if (totalPages > maxVisiblePages) {
      if (currentPage <= 2) {
        endPage = maxVisiblePages - 1;
      } else if (currentPage >= totalPages - 3) {
        startPage = totalPages - (maxVisiblePages - 1);
      } else {
        startPage = currentPage - 1;
        endPage = currentPage + 2;
      }
    }

    if (startPage > 0) {
      pages.add(_buildPageButton(0));
      pages.add(const Text("..."));
    }

    for (int i = startPage; i <= endPage && i < totalPages; i++) {
      pages.add(_buildPageButton(i));
    }

    if (endPage < totalPages - 1) {
      pages.add(const Text("..."));
      pages.add(_buildPageButton(totalPages - 1));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pages,
    );
  }

  Widget _buildPageButton(int pageIndex) {
    final bool isCurrent = pageIndex == currentPage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isCurrent ? AppColors.deepNavy : AppColors.softWhite,
          foregroundColor: isCurrent ? AppColors.softWhite : AppColors.deepNavy,
          minimumSize: const Size(40, 40),
          padding: EdgeInsets.zero,
        ),
        onPressed: () => onPageSelected(pageIndex),
        child: Text("${pageIndex + 1}"),
      ),
    );
  }
}
