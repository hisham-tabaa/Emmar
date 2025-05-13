// lib/features/login/presentation/bloc/login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/login_user.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  LoginBloc({required this.loginUser}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      final result = await loginUser(event.email, event.password);
      result.fold(
            (failure) => emit(LoginFailure(failure as String)),
            (token) => emit(LoginSuccess(token)),
      );
    });
  }
}
