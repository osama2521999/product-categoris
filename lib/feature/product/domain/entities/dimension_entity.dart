import 'package:equatable/equatable.dart';

class Dimensions extends Equatable {
  final double? width;
  final double? height;
  final double? depth;

  const Dimensions(
      {required this.width, required this.height, required this.depth});

  @override
  List<Object?> get props => [width, height, depth];
}
