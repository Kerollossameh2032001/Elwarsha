import 'package:elwarsha/notification/data/models/notifiaction_model.dart';
import 'package:flutter/material.dart';
import '../styles/text_styles.dart';

class AcceptedNotify extends StatelessWidget {
  const AcceptedNotify({Key? key, required this.model}) : super(key: key);
  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height*.2,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            border: Border.all(
                color: Colors.black
            )
        ),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.bodyMediumStyle,
              ),
              Row(
                children: [
                  Text(
                    model.type.toUpperCase(),
                    style: TextStyles.bodySmallStyle.copyWith(color: Colors.green),
                  ),
                  const Spacer(),
                  Text(
                    model.createdAt,
                    style: TextStyles.bodySmallStyle.copyWith(color: Colors.green),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}