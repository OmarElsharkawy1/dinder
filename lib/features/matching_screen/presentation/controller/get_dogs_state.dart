import 'package:equatable/equatable.dart';
import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';

abstract class GetDogsState extends Equatable {
  const GetDogsState();

  @override
  List<Object> get props => [];
}

class GetDogsInitial extends GetDogsState {}

class GetDogsLoadingState extends GetDogsState {
  const GetDogsLoadingState();
}

class GetDogsErrorMessageState extends GetDogsState {
  final String errorMessage;

  const GetDogsErrorMessageState({required this.errorMessage});
}

class GetDogsSuccessMessageState extends GetDogsState {
  final List<DogModel> dogs;

  const GetDogsSuccessMessageState({required this.dogs});
}
