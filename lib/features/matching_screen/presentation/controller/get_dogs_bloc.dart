import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/matching_screen/domain/use_case/get_dogs_use_case.dart';
import 'package:pile_up/features/matching_screen/presentation/controller/get_dogs_event.dart';
import 'package:pile_up/features/matching_screen/presentation/controller/get_dogs_state.dart';

class GetDogsBloc extends Bloc<BaseGetDogsEvent, GetDogsState> {
  GetDogsUseCase getDogsUseCase;

  GetDogsBloc({required this.getDogsUseCase}) : super(GetDogsInitial()) {
    on<GetDogsEvent>((event, emit) async {
      emit(const GetDogsLoadingState());
      final result = await getDogsUseCase.getDogs();
      result.fold(
          (l) => emit(GetDogsSuccessMessageState(dogs: l)),
          (r) => emit(GetDogsErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
