import 'package:elwarsha/subscription/domain/entities/subscribtion_data_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../layout/presentation/components/styles/text_styles.dart';


class UserSubscriptionHistoryScreen extends StatelessWidget {
  //OrderHistoryEntity orders = OrderHistoryEntity(data: [], status: -1);
  final List<SubscriptionDataEntity> subscriptionHistory;
  const UserSubscriptionHistoryScreen({Key? key, required this.subscriptionHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          BuildOrderItem(model: subscriptionHistory[index]),
      itemCount: subscriptionHistory.length,
    );
  }
}

class BuildOrderItem extends StatelessWidget {
  final SubscriptionDataEntity model;

  const BuildOrderItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height*.2,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            border: Border.all(color: Colors.black)),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.bodyMediumStyle.copyWith(fontSize: 19.sp),
                  ),
                  Text(
                    model.description!,
                    style: TextStyles.bodySmallStyle.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text(
                        dateTimeFormatted(s: 'y', time: model.endsAt),
                        style: TextStyles.bodySmallStyle.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.green),
                      ),
                      SizedBox(
                        width: 200.w,
                      ),
                      Text(
                        dateTimeFormatted(s: 'y', time: model.createdAt),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

String dateTimeFormatted({required String s, required String time}) {
  var now = DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedTime = DateFormat('kk:mm:a').format(now);
  String formattedDate = formatter.format(now);
  if (s == 't') {
    return formattedTime;
  }
  if (s == 'y') {
    return formattedDate;
  } else {
    return 'Enter t or y only';
  }
}
