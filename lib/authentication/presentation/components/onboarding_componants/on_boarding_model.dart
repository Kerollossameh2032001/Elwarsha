import 'package:equatable/equatable.dart';

import '../../../../core/constant/app_path_constant.dart';

class PageModel extends Equatable {
  final String subTitle;
  final String title;
  final String icon;
  final String backgroundImage;

  const PageModel({
    required this.subTitle,
    required this.title,
    required this.icon,
    required this.backgroundImage,
  });

  @override
  List<Object> get props => [subTitle, title, icon, backgroundImage];
}

///ToDo: Not Forgot adding the images and Icons
List<PageModel> pageData = [
  const PageModel(
    subTitle: 'Your Car Fuel',
    title: 'Is Over? ',
    icon: AppPathConstant.fuelIcon,
    backgroundImage: AppPathConstant.onBoarding1Background,
  ),
  const PageModel(
    subTitle: 'Your Car has',
    title: 'broken down?',
    icon: AppPathConstant.brokenCarIcon,
    backgroundImage: AppPathConstant.onBoarding2Background,
  ),
  const PageModel(
    subTitle: 'just',
    title: 'Contact us..',
    icon: AppPathConstant.contactIcon,
    backgroundImage: AppPathConstant.onBoarding3Background,
  ),
];
