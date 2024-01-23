import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CurrentPage { home, category, source, article }

class TestCubit extends Cubit<dynamic> {
  TestCubit({this.data, this.selectedCategory, this.source, this.searchKeyword})
      : super(data);
  dynamic data;
  String? selectedCategory;
  String? source;
  CurrentPage? currentPage = CurrentPage.home;
  String? searchKeyword;

  void changeData(dynamic data) {
    this.data = data;
    emit(data);
  }

  void changeSource(String source) {
    this.source = source;
  }

  void changeCurrentPage(CurrentPage currentPage) {
    this.currentPage = currentPage;
  }

  selectCategory(category) {
    selectedCategory = category;
  }

  selectSearchKeyword(keyword) {
    searchKeyword = keyword;
  }

  getSearchKeyword() {
    return searchKeyword;
  }

  getSelectedCategory() {
    return selectedCategory;
  }

  getData() {
    return data;
  }

  getSource() {
    return source;
  }

  getCurrentPage() {
    return currentPage;
  }
}
