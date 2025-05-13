import 'package:dartz/dartz.dart';

import '../../../../core/error/auth/login_error.dart';
import '../repositories/login_repository.dart';

class LoginUser {
  final LoginRepository repository;
  LoginUser(this.repository);

  Future<Either<Failure, String>> call(String email, String password) async{
    return await repository.login(email, password);
  }
}
