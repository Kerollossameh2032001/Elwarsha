import 'package:dio/dio.dart';
import 'package:elwarsha/winch/data/models/winch_data_model.dart';
import 'package:elwarsha/winch/domain/usecase/winch_usecase.dart';

import '../../../core/constant/api_consants.dart';
import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/dio_helper.dart';
import '../../domain/entities/winch_entity.dart';
import '../models/winch_model.dart';

abstract class BaseWinchDataSource {
  Future<WinchEntity> makeOrderWinch(WinchParameter parameter);
}

class WinchDataSource extends BaseWinchDataSource {

  @override
  Future<WinchEntity> makeOrderWinch(WinchParameter parameter) async {
    try {
      var response = await DioHelper.postData(
        endPoint: ApiConstants.makeWinchOrder,
        data: WinchParameter.toJson(parameter),
        token: parameter.token,
      );
      return WinchModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response == null) {
        // Handle the case where the response is null
        throw ServerException(
          errorMessageModel:
              ErrorMessageModel(message: "Request doesn't reach to server"),
        ); // Or perform any other error handling logic
      } else if (e.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
        );
      } else {
        throw ServerException(
          errorMessageModel:
              const ErrorMessageModel(message: "Something went wrong "),
        );
      }
    }
  }

}
