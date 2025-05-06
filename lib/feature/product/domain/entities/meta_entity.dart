import 'package:equatable/equatable.dart';

class Meta extends Equatable {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  const Meta(
      {required this.createdAt,
        required this.updatedAt,
        required this.barcode,
        required this.qrCode});

  @override
  List<Object?> get props => [createdAt, updatedAt, barcode, qrCode];
}