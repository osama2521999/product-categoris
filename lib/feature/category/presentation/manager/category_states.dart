part of 'category_cubit.dart';

abstract class CategoryStates extends Equatable {
  const CategoryStates();

  @override
  List<Object?> get props => [];
}

class CategoryInitialState extends CategoryStates {
  const CategoryInitialState();

  @override
  List<Object?> get props => [];
}

class GetCategoriesLoadingState extends CategoryStates {
  const GetCategoriesLoadingState();

  @override
  List<Object?> get props => [];
}

class GetCatProductsLoadingState extends CategoryStates {
  const GetCatProductsLoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessGetCategoriesState extends CategoryStates {
  final List<String> categories;

  const SuccessGetCategoriesState({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class SuccessGetCatProductsState extends CategoryStates {
  final List<ProductEntity> catProducts;

  const SuccessGetCatProductsState({required this.catProducts});

  @override
  List<Object?> get props => [catProducts];
}

class SearchState extends CategoryStates {
  final String val;

  const SearchState({required this.val});

  @override
  List<Object?> get props => [val];
}

class ErrorGetCategoriesState extends CategoryStates {
  final Failure fail;

  const ErrorGetCategoriesState({required this.fail});

  @override
  List<Object?> get props => [fail];
}

class ErrorGetCatProductsState extends CategoryStates {
  final Failure fail;

  const ErrorGetCatProductsState({required this.fail});

  @override
  List<Object?> get props => [fail];
}
