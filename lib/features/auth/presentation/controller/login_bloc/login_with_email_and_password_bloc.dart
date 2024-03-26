import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';

class LoginWithEmailAndPasswordBloc extends Bloc<
    BaseLoginWithEmailAndPasswordEvent, LoginWithEmailAndPasswordState> {
  LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;

  LoginWithEmailAndPasswordBloc(
      {required this.loginWithEmailAndPasswordUseCase})
      : super(LoginWithEmailAndPasswordInitial()) {
    on<LoginWithEmailAndPasswordEvent>((event, emit) async {
      emit(const LoginWithEmailAndPasswordLoadingState());
      final result = await loginWithEmailAndPasswordUseCase
          .call(AuthModel(email: event.email, password: event.password));
      result.fold(
          (l) => emit(LoginWithEmailAndPasswordSuccessMessageState(
                successMessage: StringManager.loginSuccessfully,
                authModelResponse: l,
              )),
          (r) => emit(LoginWithEmailAndPasswordErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
