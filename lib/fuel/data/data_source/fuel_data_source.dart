import 'package:dio/dio.dart';
import '../../../core/constant/api_consants.dart';
import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/dio_helper.dart';
import '../../domain/entities/fuel_entity.dart';
import '../../domain/usecase/fuel_usecase.dart';
import '../models/fuel_model.dart';

abstract class BaseFuelDataSource {
  Future<FuelEntity> makeOrderFuel(FuelParameter parameter);
}

class FuelDataSource extends BaseFuelDataSource {

  @override
  Future<FuelEntity> makeOrderFuel(FuelParameter parameter) async {
    try {
      var response = await DioHelper.postData(
        endPoint: ApiConstants.makeFuelOrder,
        data: FuelParameter.toJson(parameter),
        token: parameter.token,
      );
      return FuelModel.fromJson(response.data);
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