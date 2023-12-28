import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elwarsha/core/services/dio_helper.dart';
import 'package:elwarsha/notification/data/models/notifiaction_model.dart';
import '../../../core/exceptions/failure.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationModel>>> fetchNotificationData({
    required String token,
  });
}
