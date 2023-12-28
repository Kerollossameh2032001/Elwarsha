import 'package:dio/dio.dart';
import '../../../core/constant/api_consants.dart';
import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/dio_helper.dart';
import '../../domain/entities/repair_entity.dart';
import '../../domain/usecase/repair_usecase.dart';
import '../model/repair_model.dart';

abstract class BaseRepairDataSource {
  Future<RepairEntity> makeRepairOrder(RepairParameter parameter);
}

class RepairDataSource extends BaseRepairDataSource {

  @override
  Future<RepairEntity> makeRepairOrder(RepairParameter parameter) async{
    try {
      var response = await DioHelper.postData(
        endPoint: ApiConstants.makeRepairOrder,
        data: RepairParameter.toJson(parameter),
        token: parameter.token,
      );
      return RepairModel.fromJson(response.data);
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