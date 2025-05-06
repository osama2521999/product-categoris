import '../../domain/entities/dimension_entity.dart';

class DimensionsModel extends Dimensions {
  const DimensionsModel(
      {required super.width, required super.height, required super.depth});

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: json['width'],
      height: json['height'],
      depth: json['depth'],
    );
  }
}
