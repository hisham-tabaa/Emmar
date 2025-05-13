import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/auth_repository.dart';

class CreateAccount implements UseCase<bool, CreateAccountParams> {
  final AuthRepository repository;

  CreateAccount(this.repository);

  @override
  Future<Either<Failure, bool>> call(CreateAccountParams params) async {
    return await repository.createAccount(
      params.name,
      params.email,
      params.phoneNumber,
      params.password,
    );
  }
}

class CreateAccountParams extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  const CreateAccountParams({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, phoneNumber, password];
}