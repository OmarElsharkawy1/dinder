import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/my_profile_screen/domain/use_case/get_my_profile_use_case.dart';
import 'package:pile_up/features/my_profile_screen/presentation/controller/get_my_profile_event.dart';
import 'package:pile_up/features/my_profile_screen/presentation/controller/get_my_profile_state.dart';

class GetMyProfileBloc extends Bloc<BaseGetMyProfileEvent, GetMyProfileState> {
  GetMyProfileUseCase getMyProfileUseCase;

  GetMyProfileBloc({required this.getMyProfileUseCase}) : super(GetMyProfileInitial()) {
    on<GetMyProfileEvent>((event, emit) async {
      emit(const GetMyProfileLoadingState());
      final result = await getMyProfileUseCase.getMyProfile();
      result.fold(
          (l) => emit(GetMyProfileSuccessMessageState(myProfile: l)),
          (r) => emit(GetMyProfileErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
