import 'package:flutter/material.dart';

import '../../../../core/constant/app_color_constant.dart';

class CategoryItem extends StatelessWidget {
  final void Function()? onTap;
  final String categoryTitle;
  final String image;

  const CategoryItem({
    super.key,
    required this.onTap,
    required this.categoryTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .155,
            width: MediaQuery.of(context).size.width * .35,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image),scale: 7),
                color: AppColorConstant.backgroundColor,
                border: Border.all(color: Colors.white)),
          ),
          const SizedBox(height: 12),
          Text(
            categoryTitle,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
