import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class DeniedNotify extends StatelessWidget {
  const DeniedNotify({Key? key}) : super(key: key);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/images/banner photo.jpeg'),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Service provider',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.bodyMediumStyle,
                  ),
                  Text(
                    'Denied your Request',
                    style: TextStyles.bodySmallStyle.copyWith(color: Colors.red),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}