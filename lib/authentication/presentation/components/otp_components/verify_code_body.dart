import 'package:elwarsha/authentication/presentation/components/otp_components/verify_code_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_path_constant.dart';
import 'counter_down_widget.dart';

class VerifyCodeBody extends StatelessWidget {
  const VerifyCodeBody({
    super.key,
    required this.formKey,
    required this.codeController1,
    required this.codeController2,
    required this.codeController3,
    required this.codeController4,
    required this.codeController5,
    required this.codeController6,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController codeController1;
  final TextEditingController codeController2;
  final TextEditingController codeController3;
  final TextEditingController codeController4;
  final TextEditingController codeController5;
  final TextEditingController codeController6;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 380,
          image: AssetImage(AppPathConstant.splashBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
          ),
          Container(
            width: 90.w,
            height: 90.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppPathConstant.lockIcon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Enter The code we sent",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 25.sp),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: VerifyCodeForm(
                codeController1: codeController1,
                codeController2: codeController2,
                codeController3: codeController3,
                codeController4: codeController4,
                codeController5: codeController5,
                codeController6: codeController6,
              ),
            ),
          ),
          CountdownWidget(),
          /*const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: MediaQuery.of(context).size.width * 0.3,
            ),
            child: CustomButton(
                onPressed: () {},
                color: AppColorConstant.backgroundColor!,
                child: TextButton(
                  onPressed: () {
                    */ /*cubit.sendVerificationCode(
                        phoneNumber: CacheHelper.getDate(
                            key: AppStringConstant
                                .cacheHelperSaveUserNumber));*/ /*
                  },
                  child: Text(
                    'Resend',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )),
          )*/
        ],
      ),
    );
  }
}
