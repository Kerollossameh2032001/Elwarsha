import 'package:elwarsha/core/global/widgets/custom_button.dart';
import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:elwarsha/layout/domain/usecase/update_profile_usecase.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_color_constant.dart';

class UpdateProfileScreen extends StatefulWidget {
  final LayoutCubit cubit;

  const UpdateProfileScreen({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.cubit.currentUserData?.name ?? 'Customer';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColorConstant.primaryColor,
        onPressed: () {
          setState(() {});
          widget.cubit.changeEnableUpdate();
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Text(
                                "My Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 20.sp,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              widget.cubit.currentUserData?.name ?? 'Customer',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              widget.cubit.currentUserData!.phone,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.green,
                                      fontSize: 20.sp,
                                      //color: AppColorConstant.titleMedColor,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.16,
                        child: widget.cubit.currentUserData!.avatar == null
                            ? CircleAvatar(
                                radius: 50.sp,
                                backgroundColor: Colors.grey,
                                backgroundImage: const NetworkImage(
                                    'https://i.pinimg.com/736x/64/81/22/6481225432795d8cdf48f0f85800cf66.jpg'),
                              )
                            : CircleAvatar(
                                radius: 50.sp,
                                backgroundColor: Colors.grey,
                                // backgroundImage: FileImage(
                                //   image,
                                // ),
                                backgroundImage: NetworkImage(widget.cubit.currentUserData!.avatar!),
                              ),
                        // child: CircleAvatar(
                        //   radius: 50,
                        //   backgroundImage: AssetImage('assets/images/banner photo.jpeg'),
                        // ),
                      ),
                      if (widget.cubit.enableUpdate)
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.250,
                          left: MediaQuery.of(context).size.width * 0.49,
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: IconButton(
                                onPressed: () async{
                                  print("Kerollos Sameh Foaud");
                                  await widget.cubit.setImage();
                                },
                                icon: const Icon(Icons.camera_alt_outlined)),
                          ),
                        )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        cursorColor:
                            Theme.of(context).textTheme.bodyLarge!.color,
                        controller: nameController,
                        enabled: widget.cubit.enableUpdate,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 25),
                        decoration: InputDecoration(
                          hintText:
                              widget.cubit.currentUserData?.name ?? 'Customer',
                          hintStyle:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: AppColorConstant.primaryColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColorConstant.primaryColor,
                            ),
                          ),
                          enabled: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        //controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (String? value) {
                          if (value!.length < 11) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      if (widget.cubit.enableUpdate)
                        CustomButton(
                          onPressed: () {
                            print('Controller => ${nameController.text}');
                            UpdateProfileParameter parameter =
                                UpdateProfileParameter(
                              token: CacheHelper.getDate(key: 'token'),
                              name: nameController.text,
                              avatar: widget.cubit.userImage!,
                            );
                            widget.cubit
                                .updateProfileData(parameter: parameter);
                            Navigator.pop(context);
                          },
                          color: Theme.of(context).primaryColor,
                          child: const Text('Update'),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
