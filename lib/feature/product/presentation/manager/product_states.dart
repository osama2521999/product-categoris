part of 'product_cubit.dart';

abstract class ProductStates extends Equatable {
  const ProductStates();

  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductStates {
  const ProductInitialState();

  @override
  List<Object?> get props => [];
}

class GetCategoriesLoadingState extends ProductStates {
  const GetCategoriesLoadingState();

  @override
  List<Object?> get props => [];
}

class GetCatProductsLoadingState extends ProductStates {
  const GetCatProductsLoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessGetCategoriesState extends ProductStates {
  final List<String> categories;

  const SuccessGetCategoriesState({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class SuccessGetCatProductsState extends ProductStates {
  final List<ProductEntity> catProducts;

  const SuccessGetCatProductsState({required this.catProducts});

  @override
  List<Object?> get props => [catProducts];
}

class SearchState extends ProductStates {
  final String val;

  const SearchState({required this.val});

  @override
  List<Object?> get props => [val];
}

class ChangeProductImageState extends ProductStates {
  final int index;

  const ChangeProductImageState({required this.index});

  @override
  List<Object?> get props => [index];
}

class ErrorGetCategoriesState extends ProductStates {
  final Failure fail;

  const ErrorGetCategoriesState({required this.fail});

  @override
  List<Object?> get props => [fail];
}

class ErrorGetCatProductsState extends ProductStates {
  final Failure fail;

  const ErrorGetCatProductsState({required this.fail});

  @override
  List<Object?> get props => [fail];
}
