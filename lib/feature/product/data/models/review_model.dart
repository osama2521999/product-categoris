import '../../domain/entities/review_entity.dart';

class ReviewModel extends Review {
  const ReviewModel(
      {required super.rating,
      required super.comment,
      required super.date,
      required super.reviewerName,
      required super.reviewerEmail});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.tryParse(json['date']),
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}
