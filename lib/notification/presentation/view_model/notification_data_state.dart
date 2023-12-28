part of 'notification_data_cubit.dart';

@immutable
abstract class NotificationDataState {}

class NotificationDataInitial extends NotificationDataState {}

class NotificationDataLoading extends NotificationDataState {}

class NotificationDataSuccess extends NotificationDataState {
  final List<NotificationModel> notify;

  NotificationDataSuccess(this.notify);
}

class NotificationDataError extends NotificationDataState {
  final String error;

  NotificationDataError(this.error);
}
