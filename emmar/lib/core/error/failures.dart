import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure([String message = 'A server error occurred. Please try again later.'])
      : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String message = 'A cache error occurred. Please try again.'])
      : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'No internet connection. Please check your network.'])
      : super(message);
}
class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);

  @override
  List<Object> get props => [message];
}