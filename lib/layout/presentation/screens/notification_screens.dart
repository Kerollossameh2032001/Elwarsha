import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/services/cachehelper.dart';
import 'package:elwarsha/layout/presentation/components/styles/text_styles.dart';
import 'package:elwarsha/notification/data/models/notifiaction_model.dart';
import 'package:elwarsha/notification/data/repos/repo_abstract.dart';
import 'package:elwarsha/notification/data/repos/repo_implement.dart';
import 'package:elwarsha/notification/presentation/view_model/notification_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/global/widgets/custom_dialog.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../components/notifications_conponents/accepted_notify.dart';
import '../components/notifications_conponents/denied_notify.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key, required this.token}) : super(key: key);

  List<NotificationModel>? models;
  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationDataCubit(NotificationRepoImplement())
        ..fetchNotificationData(token: token),
      child: BlocConsumer<NotificationDataCubit, NotificationDataState>(
        listener: (context, state) {
          if (state is NotificationDataSuccess) {
            models = state.notify;
            //Navigator.pop(context);
          }
          if (state is NotificationDataLoading) {
            customDialog(context: context);
          }
          if (state is NotificationDataError) {
            showFlutterToast(message: state.error, state: ToastState.error);
          }
        },
        builder: (context, state) {
          /*print(CacheHelper.getDate(
            key: AppConstantKey.getToken,
          ));*/
          NotificationDataCubit cubit = NotificationDataCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColorConstant.backgroundColor,
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is NotificationDataSuccess)
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => AcceptedNotify(
                        model: models![index],
                      ),
                      itemCount: models!.length,
                    ),
                  ),
                if (state is NotificationDataError)
                  const Text('Try again latter')
              ],
            ),
          );
        },
      ),
    );
  }
}
