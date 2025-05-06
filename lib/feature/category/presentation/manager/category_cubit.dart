import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/services/service_locator.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import '../../domain/use_cases/get_category_products_use_case.dart';

part 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(const CategoryInitialState()) {
    getCategories();
  }

  static CategoryCubit get(context) => BlocProvider.of(context);

  String pageId = "1";
  List<String> categories = [];
  List<String> searchedCategories = [];
  bool searchFlag = false;

  TextEditingController searchController = TextEditingController();

  void getCategories() async {
    emit(const GetCategoriesLoadingState());

    final result = await sl<GetCategoriesUseCase>().call();

    return result.fold(
      (fail) {
        emit(ErrorGetCategoriesState(fail: fail));
      },
      (data) {
        categories = data;
        searchedCategories = data;
        emit(SuccessGetCategoriesState(categories: data));
      },
    );
  }

  void catSearch(String val) async {
    if (val == "") {
      searchFlag = false;
      searchedCategories = categories;
    }
    searchFlag = true;

    searchedCategories = categories.where(
      (item) {
        return item.contains(val);
      },
    ).toList();

    emit(SearchState(val: val));
  }

  void getCatProducts({required String catName}) async {
    emit(const GetCatProductsLoadingState());

    final result =
        await sl<GetCategoryProductsUseCase>().call(catName: catName);

    return result.fold(
      (fail) {
        emit(ErrorGetCatProductsState(fail: fail));
      },
      (data) {
        emit(SuccessGetCatProductsState(catProducts: data));
      },
    );
  }

}
