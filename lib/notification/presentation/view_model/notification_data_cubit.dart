import 'package:bloc/bloc.dart';
import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/services/cachehelper.dart';
import 'package:elwarsha/notification/data/repos/repo_abstract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/notifiaction_model.dart';

part 'notification_data_state.dart';

class NotificationDataCubit extends Cubit<NotificationDataState> {
  NotificationDataCubit(this.notificationRepo)
      : super(NotificationDataInitial());

  static NotificationDataCubit get(context) => BlocProvider.of(context);

  final NotificationRepo notificationRepo;

  Future<void> fetchNotificationData({required String token}) async {
    emit(NotificationDataLoading());
    var result = await notificationRepo.fetchNotificationData(
      token: token,
    );
    result.fold((failure) {
      emit(NotificationDataError(failure.message));
    }, (notify) {
      emit(NotificationDataSuccess(notify));
    });
  }
}
