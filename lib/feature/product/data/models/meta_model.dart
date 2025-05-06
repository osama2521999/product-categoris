
import '../../domain/entities/meta_entity.dart';

class MetaModel extends Meta {
  const MetaModel(
      {required super.createdAt,
      required super.updatedAt,
      required super.barcode,
      required super.qrCode});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: DateTime.tryParse(json['createdAt']),
      updatedAt: DateTime.tryParse(json['updatedAt']),
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }
}
