import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';
part 'login_page_bloc.freezed.dart';

@injectable
class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc(this._signInUseCase) : super(const LoginPageState()) {
    on<LoginPasswordVisibility>(_onLoginPasswordVisibility);
    on<LoginAccount>(_onLoginAccount);
  }

  final LogInUseCase _signInUseCase;

  Future<void> _onLoginPasswordVisibility(
      LoginPasswordVisibility event, Emitter<LoginPageState> emit) async {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  Future<void> _onLoginAccount(
      LoginAccount event, Emitter<LoginPageState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading, errorMessage: ""));

    try {
      final user = await _signInUseCase.execute(
        LogInInput(
          email: event.email.trim(),
          password: event.password.trim(),
        ),
      );

      emit(state.copyWith(
        // ignore: unnecessary_null_comparison
        status: user != null ? LoginStatus.success : LoginStatus.failure,
        // ignore: unnecessary_null_comparison
        errorMessage: user == null ? "Invalid credentials" : "",
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.toString().isNotEmpty
            ? e.toString()
            : "Something went wrong. Please try again.",
      ));
    }
  }
}
