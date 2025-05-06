import '../../domain/entities/product_entity.dart';
import 'dimension_model.dart';
import 'meta_model.dart';
import 'review_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.category,
      required super.price,
      required super.discountPercentage,
      required super.rating,
      required super.stock,
      required super.tags,
      required super.brand,
      required super.sku,
      required super.weight,
      required super.dimensions,
      required super.warrantyInformation,
      required super.shippingInformation,
      required super.availabilityStatus,
      required super.reviews,
      required super.returnPolicy,
      required super.minimumOrderQuantity,
      required super.meta,
      required super.images,
      required super.thumbnail});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPercentage: double.parse(json['discountPercentage'].toString()),
      rating: json['rating'],
      stock: json['stock'],
      tags: json["tags"] != null ? List<String>.from(json["tags"]) : [],
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
      dimensions: json['dimensions'] != null
          ? DimensionsModel.fromJson(json['dimensions'])
          : null,
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: json["reviews"] != null
          ? List.from(json["reviews"])
              .map(
                (element) => ReviewModel.fromJson(element),
              )
              .toList()
          : [],
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: json['meta'] != null ? MetaModel.fromJson(json['meta']) : null,
      images: json["images"] != null ? List<String>.from(json["images"]) : [],
      thumbnail: json['thumbnail'],
    );
  }
}
