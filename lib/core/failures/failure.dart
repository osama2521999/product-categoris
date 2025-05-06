abstract class Failure {
  String statusCode;
  String? messageAr;
  String? messageEn;
  String? message;

  Failure({
    required this.statusCode,
    this.messageAr,
    this.messageEn,
    this.message,
  });
}
