import 'package:dio/dio.dart';
import 'package:elwarsha/subscription/data/models/make_subscrition_model/make_subscription_model.dart';
import 'package:elwarsha/subscription/domain/entities/renew_subscription_entity/renue_subscription_entity.dart';
import 'package:elwarsha/subscription/domain/entities/subscribtion_data_entitiy.dart';
import 'package:elwarsha/subscription/domain/usecase/make_subscription_usecase.dart';
import 'package:elwarsha/subscription/domain/usecase/renew_subscription_usecase.dart';

import '../../../core/constant/api_consants.dart';
import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/dio_helper.dart';
import '../../domain/entities/make_subscription_entity/make_subscribtion_entity.dart';
import '../../domain/usecase/get_all_subscription_usecase.dart';
import '../models/renue_subscription_model/renue_subscription_model.dart';
import '../models/subscription_data_model.dart';

abstract class BaseSubscriptionDataSource {
  Future<MakeSubscriptionEntity> makeSubscription(MakeSubscriptionParameter parameter);
  Future<RenewSubscriptionEntity> renewSubscription(RenewSubscriptionParameter parameter);
  Future<List<SubscriptionDataEntity>> getAllUserSubscription(AllUserSubscriptionsParameter parameter);
}

class SubscriptionDataSource extends BaseSubscriptionDataSource {

  @override
  Future<MakeSubscriptionEntity> makeSubscription(MakeSubscriptionParameter parameter) async {
    try {
      var response = await DioHelper.postData(
        endPoint: ApiConstants.makeSubscription,
        token: parameter.token,
        data: MakeSubscriptionParameter.toJson(parameter),
      );
      print(response.data);
      return MakeSubscriptionModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response == null) {
        // Handle the case where the response is null
        throw ServerException(
          errorMessageModel:
          const ErrorMessageModel(message: "Request doesn't reach to server"),
        ); // Or perform any other error handling logic
      } else if (e.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response!.data),
        );
      } else {
        throw ServerException(
          errorMessageModel:
          ErrorMessageModel(message: "Something went wrong $e"),
        );
      }
    }
  }

  @override
  Future<List<SubscriptionDataEntity>> getAllUserSubscription(AllUserSubscriptionsParameter parameter) async {
    try {
      var response = await DioHelper.getData(
        endPoint: ApiConstants.allUserSubscription,
        token: parameter.token,
      );
      print(response.data);
      return List<SubscriptionDataModel>.from(
          (response.data['data'] as List).map(
                (e) => SubscriptionDataModel.fromJson(e),
          ));
    } on DioError catch (e) {
      print(e);
      if (e.response == null) {
        // Handle the case where the response is null
        throw ServerException(
          errorMessageModel:
          const ErrorMessageModel(message: "Request doesn't reach to server"),
        ); // Or perform any other error handling logic
      }
      else if (e.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response!.data),
        );
      }
      else {
        throw ServerException(
          errorMessageModel:
          ErrorMessageModel(message: "Something went wrong $e"),
        );
      }
    }
  }

  @override
  Future<RenewSubscriptionEntity> renewSubscription(RenewSubscriptionParameter parameter) async{
    try {
      var response = await DioHelper.getData(
        endPoint: ApiConstants.renewSubscription,
        token: parameter.token,
      );
      print(response.data);
      return RenewSubscriptionModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response == null) {
        // Handle the case where the response is null
        throw ServerException(
          errorMessageModel:
          const ErrorMessageModel(message: "Request doesn't reach to server"),
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