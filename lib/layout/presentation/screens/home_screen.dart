import 'package:carousel_slider/carousel_slider.dart';
import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/fuel/presentation/screens/fuel_order_screen.dart';
import 'package:elwarsha/layout/domain/entities/products_entities/products_data.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_data.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';
import 'package:elwarsha/repair/presentation/screens/repair_order_screen.dart';
import 'package:elwarsha/subscription/presentation/screens/make_subscription_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/global/widgets/navigate_to.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/cache_helper.dart';
import '../../../winch/presentation/screens/winch_service_screen.dart';
import '../../domain/entities/products_entities/products_entity.dart';
import '../components/global_components/layout_header.dart';
import '../controller/layout_cubit/layout_cubit.dart';
import '../controller/layout_cubit/layout_state.dart';

class HomeScreen extends StatelessWidget {
  ProductEntity products = ProductEntity(data: [], status: -1);
  SliderEntity slider = SliderEntity(data: [], status: -1);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is GetSlidesLoadingState) {
          ///TODO: Take care from change state
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        } else if (state is GetSlidesErrorState) {
          showFlutterToast(
            message: state.errorMessage,
            state: ToastState.error,
          );
          //Navigator.of(context).pop();
        } else if (state is GetSlidesSuccessState) {
          slider = state.sliders;
          //Navigator.of(context).pop();
        }

        if (state is GetProductsLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        } else if (state is GetProductsErrorState) {
          showFlutterToast(
            message: state.errorMessage,
            state: ToastState.error,
          );
          //Navigator.of(context).pop();
        } else if (state is GetProductsSuccessState) {
          products = state.products;

          //Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        if (products.status != -1 &&
            slider.status != -1 &&
            cubit.currentUserData != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutHeader(
                  profileData: cubit.currentUserData!,
                  token: CacheHelper.getDate(key: 'token')),
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      LayoutCubit.get(context).changeActiveIndex(index: index);
                    },
                    height: 230,
                    autoPlay: true,
                    viewportFraction: 1,
                    reverse: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true),
                itemCount: slider.data.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return buildCarousal(slider.data[index], index);
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: LayoutCubit.get(context).activeIndex,
                  count: slider.data.length,
                  effect: const WormEffect(
                    activeDotColor: AppColorConstant.primaryColor,
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 3.5,
                    paintStyle: PaintingStyle.stroke,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 18.0, top: MediaQuery.of(context).size.height * 0.04),
                child: const FavoriteServiceBuilder(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04, left: 18),
                child: Text(
                  "Online Shop",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildOnlineShop(
                      context: context, index: index, product: products.data),
                  itemCount: products.data.length,
                ),
              )
            ],
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

class FavoriteServiceBuilder extends StatelessWidget {
  const FavoriteServiceBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Favorite Service",
            style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          children: [
            InkWell(
              onTap: () {
                if (LayoutCubit.get(context).isSubscribed) {
                  navigateTo(
                      context: context,
                      destination: const WinchServiceScreen());
                } else {
                  navigateTo(
                      context: context,
                      destination: MakeSubscriptionScreen(
                          userPhone:
                              LayoutCubit.get(context).currentUserData!.phone));
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                width: MediaQuery.of(context).size.width * .27,
                decoration: BoxDecoration(
                    color: AppColorConstant.backgroundColor,
                    border: Border.all(color: Colors.white)),
                child: Image.asset('assets/images/winsh.png'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .05,
            ),
            InkWell(
              onTap: () {
                if (LayoutCubit.get(context).isSubscribed) {
                  navigateTo(
                      context: context,
                      destination: RepairOrderScreen());
                } else {
                  navigateTo(
                      context: context,
                      destination: MakeSubscriptionScreen(
                          userPhone:
                              LayoutCubit.get(context).currentUserData!.phone));
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                width: MediaQuery.of(context).size.width * .27,
                decoration: BoxDecoration(
                    color: AppColorConstant.backgroundColor,
                    border: Border.all(color: Colors.white)),
                child: Image.asset('assets/images/car repair.png'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .05,
            ),
            InkWell(
              onTap: () {
                if(LayoutCubit.get(context).isSubscribed){
                  navigateTo(context: context, destination: FuelOrderScreen());
                }else{
                  navigateTo(context: context, destination: MakeSubscriptionScreen(userPhone: LayoutCubit.get(context).currentUserData!.phone));
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                width: MediaQuery.of(context).size.width * .27,
                decoration: BoxDecoration(
                    color: AppColorConstant.backgroundColor,
                    border: Border.all(color: Colors.white)),
                child: Image.asset('assets/images/fuel pump.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget buildCarousal(SliderDataEntity model, int index) => Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: NetworkImage(model.image),
            fit: BoxFit.cover,
          )),
    );

Widget buildOnlineShop(
        {required context,
        required List<ProductData> product,
        required int index}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height * .12,
          width: MediaQuery.of(context).size.width * .27,
          decoration: BoxDecoration(
              color: AppColorConstant.backgroundColor,
              border: Border.all(color: Colors.white)),
          child: Image.network(product[index].img, fit: BoxFit.cover),
        ),
      ),
    );
