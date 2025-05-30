import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ValidationFailure extends Failure {
  final String message;

  ValidationFailure(this.message);

  @override
  List<Object> get props => [message];
}