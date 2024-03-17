import 'package:equatable/equatable.dart';
import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';
import 'package:pile_up/features/my_profile_screen/domain/model/my_profile_mode.dart';

abstract class GetMyProfileState extends Equatable {
  const GetMyProfileState();

  @override
  List<Object> get props => [];
}

class GetMyProfileInitial extends GetMyProfileState {}

class GetMyProfileLoadingState extends GetMyProfileState {
  const GetMyProfileLoadingState();
}

class GetMyProfileErrorMessageState extends GetMyProfileState {
  final String errorMessage;

  const GetMyProfileErrorMessageState({required this.errorMessage});
}

class GetMyProfileSuccessMessageState extends GetMyProfileState {
  final MyProfile myProfile;

  const GetMyProfileSuccessMessageState({required this.myProfile});
}
