import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/failures/failure.dart';
import '../../domain/entities/product_entity.dart';

part 'product_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit({required this.selectedProduct}) : super(const ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  int imageIndex = 0;
  late ProductEntity? selectedProduct;

  void changeProductImage({required bool right}) {
    imageIndex = right ? imageIndex + 1 : imageIndex - 1;
    emit(ChangeProductImageState(index: imageIndex));
  }
}
