import 'package:equatable/equatable.dart';
import 'package:pile_up/features/auth/data/auth_remote_data_source.dart';

abstract class SignInWithPlatformState extends Equatable {
  const SignInWithPlatformState();

  @override
  List<Object> get props => [];
}

class SignInWithPlatformInitial extends SignInWithPlatformState {}

class SignWithPlatFormLoadingState extends SignInWithPlatformState {
  const SignWithPlatFormLoadingState();
}

class SignWithGoogleErrorMessageState extends SignInWithPlatformState {
  final String errorMessage;

  const SignWithGoogleErrorMessageState({required this.errorMessage});
}

class SignWithGoogleSuccessMessageState extends SignInWithPlatformState {
  final AuthWithGoogleModel userData;

  const SignWithGoogleSuccessMessageState({required this.userData});
}
