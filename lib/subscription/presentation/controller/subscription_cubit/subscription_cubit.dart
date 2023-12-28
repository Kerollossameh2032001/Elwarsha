import 'package:bloc/bloc.dart';
import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:elwarsha/subscription/domain/usecase/get_all_subscription_usecase.dart';
import 'package:elwarsha/subscription/domain/usecase/make_subscription_usecase.dart';
import 'package:elwarsha/subscription/presentation/controller/subscription_cubit/subscription_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../payment/core/network/constant.dart';
import '../../../../payment/core/network/dio.dart';
import '../../../../payment/models/order_registration_model.dart';
import '../../../../payment/models/payment_reqeust_model.dart';
import '../../../domain/entities/subscribtion_data_entitiy.dart';
import '../../../domain/usecase/renew_subscription_usecase.dart';

class SubscriptionCubit extends Cubit<SubscriptionStates> {
  final MakeSubscriptionUserCase makeSubscriptionUserCase;
  final GetALlUserSubscriptionUseCase getAllUserSubscriptionUserCase;
  final RenewSubscriptionUseCase renewSubscriptionUseCase;

  SubscriptionCubit(this.makeSubscriptionUserCase,
      this.getAllUserSubscriptionUserCase, this.renewSubscriptionUseCase)
      : super(SubscriptionInitialState());

  static SubscriptionCubit get(context) => BlocProvider.of(context);

  void makeSubscription({required MakeSubscriptionParameter parameter}) async {
    emit(LoadingMakeSubscriptionState());
    var result = await makeSubscriptionUserCase(parameter);
    result.fold(
      (l) => emit(ErrorMakeSubscriptionState(errorMessage: l.message)),
      (r) {
        emit(SuccessMakeSubscriptionState(makeSubscriptionResponse: r));
      },
    );
  }

  void renewSubscription(
      {required RenewSubscriptionParameter parameter}) async {
    emit(RenewSubscriptionLoadingState());
    var result = await renewSubscriptionUseCase(parameter);
    result.fold(
      (l) => emit(RenewSubscriptionErrorState(errorMessage: l.message)),
      (r) => emit(RenewSubscriptionSuccessState(renewSubscriptionResponse: r)),
    );
  }

  void getAllUserSubscription({required String token}) async {
    emit(GetAllUserSubscriptionLoadingState());
    AllUserSubscriptionsParameter parameter =
        AllUserSubscriptionsParameter(token: token);
    var result = await getAllUserSubscriptionUserCase(parameter);
    result.fold(
      (l) => emit(GetAllUserSubscriptionErrorState(errorMessage: l.message)),
      (r) => emit(GetAllUserSubscriptionSuccessState(
          getAllUserSubscriptionResponse: r)),
    );
  }

  Future getOrderRegistrationID({
    required String price,
    required String phone,
  }) async {
    print(ApiContest.paymentFirstToken);
    print(ApiContest.getOrderId);
    emit(PaymentOrderIdLoadingStates());
    DioHelperPayment.postData(url: ApiContest.getOrderId, data: {
      'auth_token': ApiContest.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      OrderRegistrationModel orderRegistrationModel =
      OrderRegistrationModel.fromJson(value.data);
      ApiContest.paymentOrderId = orderRegistrationModel.id.toString();
      getPaymentRequest(price, phone);
      print('The order id 🍅 =${ApiContest.paymentOrderId}');
      emit(PaymentOrderIdSuccessStates());
    }).catchError((error) {
      print('Error in order id 🤦‍♂️');
      print(error.toString());
      emit(
        PaymentOrderIdErrorStates(error.toString()),
      );
    });
  }

  // for final request token

  Future<void> getPaymentRequest(
      String priceOrder,
      String phone,
      ) async {
    print('first token => ${ApiContest.paymentFirstToken}');
    print('order id => ${ApiContest.paymentOrderId}');
    emit(PaymentRequestTokenLoadingStates());
    DioHelperPayment.postData(
      url: ApiContest.getPaymentRequest,
      data: {
        "auth_token": ApiContest.paymentFirstToken,
        "amount_cents": priceOrder,
        "expiration": 3600,
        "order_id": ApiContest.paymentOrderId,
        "billing_data": {
          "apartment": "test",
          "email": "ahmed@gmial.com",
          "floor": "test",
          "first_name": "Ahmed",
          "street": "Shery",
          "building": "test",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "Assiut",
          "country": "Assiut",
          "last_name": "Khaled",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": ApiContest.integrationIdCard,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      PaymentRequestModel paymentRequestModel =
      PaymentRequestModel.fromJson(value.data);
      ApiContest.finalToken = paymentRequestModel.token;
      print('Final token 🚀 ${ApiContest.finalToken}');
      emit(PaymentRequestTokenSuccessStates());
    }).catchError((error) {
      print('Error in final token 🤦‍♂️');
      print(error.toString());
      emit(
        PaymentRequestTokenErrorStates(error.toString()),
      );
    });
  }




}
