import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../core/global/widgets/date_time_formate.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../domain/entities/order_history_entitiy/order_history_data_entity.dart';
import '../components/global_components/layout_header.dart';
import '../components/styles/text_styles.dart';

class OrdersScreen extends StatelessWidget {
  //OrderHistoryEntity orders = OrderHistoryEntity(data: [], status: -1);

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutCubit.get(context)
        .getOrderHistory(token: CacheHelper.getDate(key: 'token'));
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is GetOrderHistoryLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        }

        if (state is GetOrderHistoryErrorState) {
          showFlutterToast(
            message: state.errorMessage,
            state: ToastState.error,
          );
          //Navigator.of(context).pop();
        } else if (state is GetOrderHistorySuccessState) {
          print("alkcnlkdckadmckdamakcklmdklcmdkcdkaca");
          //orders = state.orderHistory;
          //Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        if (cubit.currentUserData != null && cubit.orders.status != -1) {
          return SingleChildScrollView(
            child: Column(
              children: [
                LayoutHeader(profileData: cubit.currentUserData!,token: CacheHelper.getDate(key: 'token')),
                //const SizedBox(height: 40,),
                ListView.builder(
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      BuildOrderItem(model: cubit.orders.data[index]),
                  itemCount: cubit.orders.data.length,
                ),
              ],
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

class BuildOrderItem extends StatelessWidget {
  final OrderHistoryDataEntity model;

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.type.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bodyMediumStyle
                          .copyWith(fontSize: 19.sp),
                    ),
                    Text(
                      model.description,
                      style: TextStyles.bodySmallStyle.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        Text(
                          model.carType,
                          style: TextStyles.bodySmallStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.green),
                        ),
                        const Spacer(),
                        Text(
                          dateTimeFormatted(s: 't', time: model.createdAt),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


