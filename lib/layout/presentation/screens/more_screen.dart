import 'package:elwarsha/authentication/presentation/screens/login_screen.dart';
import 'package:elwarsha/authentication/presentation/screens/start_splash_screen.dart';
import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/global/widgets/custom_dialog.dart';
import 'package:elwarsha/core/global/widgets/navigate_to.dart';
import 'package:elwarsha/core/global/widgets/show_flutter_toast.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_state.dart';
import 'package:elwarsha/layout/presentation/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/global/widgets/order_details.dart';
import '../../../core/services/cache_helper.dart';
import '../../../subscription/presentation/screens/subscription_details.dart';
import '../components/more_components/more_header.dart';
import '../components/more_components/more_item.dart';

class MoreScreen extends StatelessWidget {
  String? image;

  MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is SuccessUploadUserPhotoState) {
          // navigateToAndReplacement(
          //   context: context,
          //   destination: UpdateProfileScreen(
          //     cubit: LayoutCubit.get(context),
          //   ),
          // );
        }
        if (state is LoadingUploadUserPhotoState) {
          customDialog(context: context);
        }
        if (state is LogOutLoadingStates) {
          customDialog(context: context);
        }
        if (state is LogOutSuccessStates) {
          navigateToAndReplacement(
              context: context, destination: const SplashScreen());
        }
        if (state is SuccessUploadUserPhotoState) {
          Navigator.pop(context);
        }
        if (state is UpdateProfileErrorState) {
          showFlutterToast(
              message: state.errorMessage, state: ToastState.error);
        }
      },
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        if (cubit.currentUserData != null) {
          // print(image);
          // print("Ya rabbbbbbbbbbbbbbbbbbbbbbbb");
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    MoreHeader(
                      userImage: cubit.currentUserData!.avatar ??
                          'https://i.pinimg.com/736x/64/81/22/6481225432795d8cdf48f0f85800cf66.jpg',
                      accountName: cubit.currentUserData!.name,
                      accountPhoneNumber: cubit.currentUserData!.phone,
                      //accountProfileImage: cubit.currentUserData!.data.avatar!,
                    ),
                    //
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical:.0),
                    //   child: CircleAvatar(
                    //     radius: 35,
                    //     backgroundColor: Colors.black,
                    //     child: CircleAvatar(
                    //       radius: 34,
                    //       backgroundColor: Theme.of(context).cardTheme.color,
                    //       child: Icon(
                    //         Icons.list,
                    //         color: Theme.of(context).primaryColor,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.141),
                    BuildMoreItem(
                      title: "Subscription details",
                      icon: const Icon(
                        Icons.info,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        navigateTo(
                          context: context,
                          destination: SubscriptionDetailsScreen(),
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    BuildMoreItem(
                      title: "Update profile",
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        print("returned image : $image");
                        navigateTo(
                          context: context,
                          destination: UpdateProfileScreen(
                            cubit: cubit,
                          ),
                        );
                        // if (state is SuccessUploadUserPhotoState) {
                        //   print(state.image);
                        //   print("Ya rabbbbbbbbbbbbbbbbbbbbbbbb");
                        //   navigateTo(
                        //       context: context,
                        //       destination: UpdateProfileScreen(
                        //           image: state.image,
                        //           cubit: LayoutCubit.get(context)));
                        // } else {
                        //   navigateTo(
                        //       context: context,
                        //       destination: UpdateProfileScreen(
                        //           image: null,
                        //           cubit: LayoutCubit.get(context)));
                        // }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    /*BuildMoreItem(
                      title: "Subscription history",
                      icon: const Icon(
                        Icons.history,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        ///todo navigate to subscription history
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),*/
                    BuildMoreItem(
                      title: "Log out",
                      icon: const Icon(
                        Icons.subdirectory_arrow_left_rounded,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        cubit.logOut(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
      },
    );
  }
}
