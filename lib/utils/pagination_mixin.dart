import 'package:flutter/material.dart';

mixin PaginationMixin {
  final searchController = TextEditingController();
  final scrollController = ScrollController();

  bool isPaginating = false;
  String prevQuery = '';

  int totalItems = 0;
  int currentPage = 1;
  int currentPageLength = 0;
  int limit = 20;

  int get pageCount => (totalItems / limit).ceil();

  void initListener() {
    scrollController.addListener(() async {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = 120;

      if (maxScroll - currentScroll <= delta) {
        if (!isPaginating && totalItems > currentPageLength) {
          isPaginating = true;

          await onPageChange(currentPage + 1);

          isPaginating = false;
        }
      }
    });
  }

  void onRowTap(int index) {}

  Future<void> onPageChange(int page) async {
    currentPage = page;
    await reloadData();
  }

  Future<void> reloadData() async {
    currentPage = (searchController.text == prevQuery) ? currentPage : 1;
    prevQuery = searchController.text;
  }
}
