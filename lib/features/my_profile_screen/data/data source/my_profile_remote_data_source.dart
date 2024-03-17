import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/my_profile_screen/domain/model/my_profile_mode.dart';

abstract class BaseRemotelyDataSourceMyProfile {
  Future<MyProfile> getMyProfile();
}

class MyProfileRemotelyDateSource extends BaseRemotelyDataSourceMyProfile {
  @override
  Future<MyProfile> getMyProfile() async {
    try {
      final response = await Dio().get(
        ConstantApi.getMyProfile,
      );

      MyProfile jsonData = response.data;
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "getMyProfile");
    }
  }
}
