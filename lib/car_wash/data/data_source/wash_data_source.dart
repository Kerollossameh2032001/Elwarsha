import 'package:dio/dio.dart';
import 'package:elwarsha/car_wash/domain/entities/wash_entity.dart';
import 'package:elwarsha/car_wash/domain/usecase/wash_usecase.dart';

import '../../../core/constant/api_consants.dart';
import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/dio_helper.dart';
import '../models/wash_model.dart';

abstract class BaseWashDataSource {
  Future<WashEntity> makeOrderWash(WashParameter parameter);
}

class WashDataSource extends BaseWashDataSource {

  @override
  Future<WashEntity> makeOrderWash(WashParameter parameter) async {
    try {
      var response = await DioHelper.postData(
        endPoint: ApiConstants.makeWashOrder,
        data: WashParameter.toJson(parameter),
        token: parameter.token,
      );
      return WashModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response == null) {
        // Handle the case where the response is null
        throw ServerException(
          errorMessageModel:
          ErrorMessageModel(message: "Request doesn't reach to server"),
        ); // Or perform any other error handling logic
      } else if (e.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response!.data),
        );
      } else {
        throw ServerException(
          errorMessageModel:
           ErrorMessageModel(message: "Something went wrong ${e}"),
        );
      }
    }
  }

}