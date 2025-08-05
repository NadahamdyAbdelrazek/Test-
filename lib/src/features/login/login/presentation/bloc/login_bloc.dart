import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:revision/src/features/login/login/domain/use_cases/login_use_case.dart';

import '../../../../../core/base/parameters.dart';
import '../../../../../core/constants/enums.dart';
import '../../../../../core/utils/cache/hive_manager.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUC;

  LoginBloc({required this.loginUC}) : super(LoginState(
    formKey: GlobalKey<FormState>(),
    passwordController: TextEditingController(),
    phoneControllerNew: TextEditingController(),
  ),) {
    on<FetchPhoneEvent>((event, emit) {
      emit(
        state.copyWith(
          validatePhoneNumber: event.validatePhoneNumber,
        ),
      );    });

    on<TogglePasswordEvent>((event, emit) {
      emit(
        state.copyWith(
          isPassword: !state.isPassword,
          suffixIcon:
          state.isPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
        ),
      );
    });
    on<LoginSubmittedEvent>((event, emit) async {
      emit(state.copyWith(requestState: RequestState.loading));

      final result = await loginUC(
        LoginParameterUC(
          email: state.phoneControllerNew.text.trim(),
          password: state.passwordController.text.trim(),
        ),
      );

      await result.fold(
            (failure) async {
          emit(state.copyWith(requestState: RequestState.error));
        },
            (_) async {
          final email = state.phoneControllerNew.text.trim();
          final password = state.passwordController.text.trim();

          await HiveManager.instance.save<String>('user', 'email', email);
          await HiveManager.instance.save<String>('user', 'password', password);

          emit(state.copyWith(requestState: RequestState.success));
          event.onSuccess?.call();
        },
      );
    });

  }
}
