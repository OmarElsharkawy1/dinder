import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pile_up/core/base_use_case/base_use_case.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/auth/domain/use_case/google_sign.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_event.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_state.dart';

class SignInWithPlatformBloc
    extends Bloc<BaseSignInWithPlatformEvent, SignInWithPlatformState> {
  final SignInWithGoogleUC signInWithGoogleUC;

  SignInWithPlatformBloc({
    required this.signInWithGoogleUC,
  }) : super(SignInWithPlatformInitial()) {
    on<SignGoogleEvent>((event, emit) async {
      emit(const SignWithPlatFormLoadingState());
      final result = await signInWithGoogleUC.call(const NoParameter());
      result.fold(
          (l) => emit(SignWithGoogleSuccessMessageState(userData: l)),
          (r) => emit(SignWithGoogleErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
