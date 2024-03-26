
import 'package:equatable/equatable.dart';
import 'package:pile_up/features/auth/domain/model/authModelResponse.dart';

abstract class LoginWithEmailAndPasswordState extends Equatable {
  const LoginWithEmailAndPasswordState();

  @override
  List<Object> get props => [];
}

class LoginWithEmailAndPasswordInitial extends LoginWithEmailAndPasswordState {}
class LoginWithEmailAndPasswordLoadingState extends LoginWithEmailAndPasswordState{
  const LoginWithEmailAndPasswordLoadingState();
}
class LoginWithEmailAndPasswordErrorMessageState extends LoginWithEmailAndPasswordState{
  final String errorMessage ;

  const LoginWithEmailAndPasswordErrorMessageState({required this.errorMessage});


}

class LoginWithEmailAndPasswordSuccessMessageState extends LoginWithEmailAndPasswordState{
  final String successMessage ;
  final AuthModelResponse authModelResponse;

  const LoginWithEmailAndPasswordSuccessMessageState({ required this.successMessage, required this.authModelResponse});

}