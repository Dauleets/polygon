import 'failures.dart';

class InvalidDataFailure extends Failure {
  @override
  final String message;

  InvalidDataFailure({required this.message});
}

class NetworkFailure extends Failure {
  @override
  String get message => 'No Internet Connection';
}
