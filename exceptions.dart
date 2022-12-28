class MajorException implements Exception{
final String message;
  final String? errorCode;

  MajorException({required this.message, this.errorCode});
}

class MinorException implements Exception{
final String message;
  final String? errorCode;

  MinorException({required this.message, this.errorCode});
}
