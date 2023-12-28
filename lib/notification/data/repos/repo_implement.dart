import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/services/cachehelper.dart';
import 'package:elwarsha/notification/data/models/notifiaction_model.dart';
import 'package:elwarsha/notification/data/repos/repo_abstract.dart';
import '../../../core/constant/api_consants.dart';
import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/dio_helper.dart';

class NotificationRepoImplement implements NotificationRepo {
  @override
  Future<Either<Failure, List<NotificationModel>>> fetchNotificationData(
      {required String token}) async {
    try {
      var response = await DioHelper.getData(
        endPoint: ApiConstants.getFcmNotification,
        token: token,
      );
      print(response.data);
      return right(
          List<NotificationModel>.from((response.data['data'] as List).map(
        (e) => NotificationModel.fromJson(e),
      )));
    } on DioError catch (e) {
      print(e);
      if (e.response == null) {
        // Handle the case where the response is null
        throw ServerException(
          errorMessageModel: const ErrorMessageModel(
              message: "Request doesn't reach to server"),
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
