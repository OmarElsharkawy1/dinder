import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/core/utils/constant_api.dart';
import 'package:pile_up/features/matching_screen/domain/model/dog_model.dart';

abstract class BaseRemotelyDataSourceDogs {
  Future<List<DogModel>> getDogs();
}

class DogsRemotelyDateSource extends BaseRemotelyDataSourceDogs {
  @override
  Future<List<DogModel>> getDogs() async {
    try {
      final response = await Dio().get(
        ConstantApi.getDogs,
      );

      List<DogModel> jsonData = List<DogModel>.from(
          (response.data as List).map((e) => DogModel.fromJson(e)));
      return jsonData;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(dioError: e, endpointName: "getDogs");
    }
  }
}
