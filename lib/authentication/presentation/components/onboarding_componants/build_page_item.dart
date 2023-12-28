import 'package:elwarsha/authentication/presentation/components/onboarding_componants/on_boarding_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_path_constant.dart';

class BuildPageItem extends StatelessWidget {
  final PageModel model;
  const BuildPageItem({
    super.key, required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration:  BoxDecoration(
              image: DecorationImage(
                //colorFilter: ColorFilter.srgbToLinearGamma(),
                opacity: 400,
                image: AssetImage(model.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 100),
            child: Row(
              children: [
                VerticalDivider(
                  color: Colors.white,
                  thickness: 3,
                  endIndent: MediaQuery.of(context).size.height * 0.54,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.subTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                       model.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              width: 250,
              height: 250,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(model.icon),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}