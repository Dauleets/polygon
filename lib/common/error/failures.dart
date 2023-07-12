abstract class Failure {
  String get message;
}

class ServerFailure extends Failure {
  final int? statusCode;

  ServerFailure({this.statusCode});

  @override
  String get message {
    switch (statusCode) {
      case -3:
        return 'Internet Connection Error';
      case 403:
        return 'Forbidden';
      default:
        return 'Response Error';
    }
  }
}
