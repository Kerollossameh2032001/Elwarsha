import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:elwarsha/layout/domain/entities/order_history_entitiy/order_history_entity.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/prfile_data.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';
import 'package:elwarsha/layout/domain/usecase/check_subscription_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/presentation/screens/more_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../authentication/presentation/screens/start_splash_screen.dart';
import '../../../../core/constant/app_constant_key.dart';
import '../../../../core/global/widgets/navigate_to.dart';
import '../../../../core/services/cache_helper.dart';
import '../../../../core/services/upload_image.dart';
import '../../../../payment/core/network/constant.dart';
import '../../../../payment/core/network/dio.dart';
import '../../../../payment/models/authentication_request_model.dart';
import '../../../domain/usecase/get_order_history_usercase.dart';
import '../../../domain/usecase/get_profile_data_usecase.dart';
import '../../../domain/usecase/get_slides_usecase.dart';
import '../../../domain/usecase/update_profile_usecase.dart';
import '../../screens/categories screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/orders screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  final GetSlidesUserCase getSlides;
  final GetProductUseCase getProductsUseCase;
  final GetProfileDataUseCase getProfileDataUseCase;
  final GetOrderHistoryUseCase getOrderHistoryUseCase;
  final CheckSubscriptionUseCase checkSubscriptionUseCase;
  final UpdateProfileDataUseCase updateProfileDataUseCase;

  LayoutCubit(
      this.getSlides,
      this.getProductsUseCase,
      this.getProfileDataUseCase,
      this.getOrderHistoryUseCase,
      this.checkSubscriptionUseCase,
      this.updateProfileDataUseCase)
      : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    OrdersScreen(),
    MoreScreen(),
  ];

  void changeBottomIndex({required int index}) {
    currentIndex = index;
    emit(LayoutChangeBottomNavBar());
  }

  int activeIndex = 0;

  void changeActiveIndex({required int index}) {
    activeIndex = index;
    emit(AppChangeCarousalActiveIndexState());
  }

  void getSliders({required String token}) async {
    emit(GetSlidesLoadingState());
    SlideParameter parameter = SlideParameter(token: token);
    var result = await getSlides(parameter);
    result.fold(
      (l) => emit(GetSlidesErrorState(errorMessage: l.message)),
      (r) => emit(GetSlidesSuccessState(sliders: r)),
    );
  }

  void getProducts({required String token}) async {
    emit(GetProductsLoadingState());
    ProductParameter parameter = ProductParameter(token: token);
    var result = await getProductsUseCase(parameter);
    result.fold(
      (l) => emit(GetProductsErrorState(errorMessage: l.message)),
      (r) => emit(GetProductsSuccessState(products: r)),
    );
  }

  OrderHistoryEntity orders = OrderHistoryEntity(data: [], status: -1);

  void getOrderHistory({required String token}) async {
    emit(GetOrderHistoryLoadingState());
    OrderHistoryParameter parameter = OrderHistoryParameter(token: token);
    var result = await getOrderHistoryUseCase(parameter);
    result.fold(
      (l) => emit(GetOrderHistoryErrorState(errorMessage: l.message)),
      (r) {
        orders = r;
        emit(GetOrderHistorySuccessState(orderHistory: r));
      },
    );
  }

  ProfileData? currentUserData;

  void getProfileData({required String token}) async {
    emit(GetProfileLoadingState());
    ProfileParameter parameter = ProfileParameter(token: token);
    var result = await getProfileDataUseCase(parameter);
    result.fold(
      (l) => emit(GetProfileErrorState(errorMessage: l.message)),
      (r) {
        currentUserData = r.data;
        emit(GetProfileSuccessState(userData: r));
      },
    );
  }

  void updateProfileData({required UpdateProfileParameter parameter}) async {
    emit(UpdateProfileLoadingState());

    var result = await updateProfileDataUseCase(parameter);
    result.fold(
      (l) => emit(UpdateProfileErrorState(errorMessage: l.message)),
      (r) {
        currentUserData = r.data;

        emit(UpdateProfileSuccessState(userData: r));
      },
    );
  }

  bool isSubscribed = false;

  void checkSubscription({required String token}) async {
    emit(CheckSubscriptionLoadingState());
    CheckSubscriptionParameter parameter =
        CheckSubscriptionParameter(token: token);
    var result = await checkSubscriptionUseCase(parameter);
    result.fold(
      (l) => emit(CheckSubscriptionErrorState(errorMessage: l.message)),
      (r) {
        isSubscribed = !r.message.contains('not');
        emit(CheckSubscriptionSuccessState(
            subscribed: !r.message.contains('not')));
      },
    );
  }

  File? imagePath;
  final imagePicker = ImagePicker();
  String? userImage;
  int numImage = 0;

  Future setImage() async {
    //image = null;
    var pickerImage = await imagePicker.pickImage(source: ImageSource.gallery);
    emit(LoadingUploadUserPhotoState());
    if (pickerImage != null) {
      imagePath = File(pickerImage.path);
      print('test image => $imagePath');

      if (CacheHelper.getDate(key: 'imagesCounter') == null) {
        uploadImage(numImage: numImage, image: imagePath).then((value) {
          //image = null;
          numImage++;
          CacheHelper.saveData(key: 'imagesCounter', value: numImage);
          print('image url => $value');
          userImage = value;
          emit(SuccessUploadUserPhotoState(userImage!));
        }).catchError((error) {
          emit(ErrorUploadUserPhotoState(error.toString()));
          print('error while upload photo $error');
        });
      } else {
        uploadImage(
                numImage: CacheHelper.getDate(key: 'imagesCounter'),
                image: imagePath)
            .then((value) {
          //image = null;
          int imagesCounter = CacheHelper.getDate(key: 'imagesCounter');
          imagesCounter++;
          CacheHelper.saveData(key: 'imagesCounter', value: imagesCounter);
          print('image url => $value');
          userImage = value;
          emit(SuccessUploadUserPhotoState(userImage!));
        }).catchError((error) {
          emit(ErrorUploadUserPhotoState(error.toString()));
          print('error while upload photo $error');
        });
      }
    } else {
      emit(ErrorUploadUserPhotoState('Try again latter!'));
    }
  }

  late String lat;
  late String long;
  late Position? position;

  Future<void> getUserCurrentLocation() async {
    try {
      bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        await Geolocator.requestPermission();
      }

      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      position = await Geolocator.getLastKnownPosition();
      lat = position!.latitude.toString();
      long = position!.longitude.toString();
      emit(SuccessGetUserCurrentLocationState(lat, long));
      print('lat =>$lat , long =>$long');
    } catch (error) {
      print("location: ${error.toString()}");
      emit(ErrorGetUserCurrentLocationState(error.toString()));
    }
  }

  bool enableUpdate = false;

  void changeEnableUpdate() {
    enableUpdate = !enableUpdate;
    emit(EnableUpdateDataState());
  }

  AuthenticationRequestModel? authTokenModel;

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingStates());
    DioHelperPayment.postData(url: ApiContest.getAuthToken, data: {
      'api_key': ApiContest.paymentApiKey,
    }).then((value) {
      authTokenModel = AuthenticationRequestModel.fromJson(value.data);
      ApiContest.paymentFirstToken = authTokenModel!.token;
      print('The token 🍅');
      emit(PaymentAuthSuccessStates());
      print('returned token => ${ApiContest.paymentFirstToken}');
    }).catchError((error) {
      print('Error in auth token 🤦‍♂️');
      print(error.toString());
      emit(
        PaymentAuthErrorStates(error.toString()),
      );
    });
  }

  void logOut(context) {
    emit(LogOutLoadingStates());

    CacheHelper.removeData(key: AppConstantKey.getCityName);
    CacheHelper.removeData(key: AppConstantKey.longitude);
    CacheHelper.removeData(key: AppConstantKey.latitude);
    //CacheHelper.removeData(key: AppConstantKey.getTokenDevice);
    CacheHelper.removeData(key: AppConstantKey.getToken);
    CacheHelper.removeData(key: AppConstantKey.latTo);
    CacheHelper.removeData(key: AppConstantKey.longTo);
    CacheHelper.removeData(key: AppConstantKey.getCityNameDestination).then((value) {
      emit(LogOutSuccessStates());
    });

  }

/* Future<void> getUserCurrentLocation() async {
    try {
      // Request location permission
      PermissionStatus permissionStatus = await Permission.location.request();

      // Check if permission is granted
      if (permissionStatus.isGranted) {
        // Location permission granted, proceed with getting the current location
        await LocationHelper.detectCurrentLocation();
        position = await Geolocator.getLastKnownPosition();
        lat = position!.latitude.toString();
        long = position!.longitude.toString();
        emit(SuccessGetUserCurrentLocationState(lat, long));
        print('lat => $lat, long => $long');
      } else {
        // Location permission not granted, handle accordingly
        emit(ErrorGetUserCurrentLocationState('Location permission not granted.'));
      }
    } catch (error) {
      print("Kerollos: ${error.toString()}");
      emit(ErrorGetUserCurrentLocationState(error.toString()));
    }
  }*/
}
