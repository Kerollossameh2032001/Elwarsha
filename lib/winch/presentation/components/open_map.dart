import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import '../../../core/constant/app_constant_key.dart';

class OpenMapScreen extends StatelessWidget {
  const OpenMapScreen({Key? key, required this.lat, required this.long})
      : super(key: key);
  final double lat, long;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpenStreetMapSearchAndPick(
          center: LatLong(lat, long),
          buttonColor: Colors.blue,
          locationPinIconColor: Colors.red,
          buttonText: 'Set destination Location',
          //onGetCurrentLocationPressed: (){},
          onPicked: (pickedData) {
            const SnackBar(content: Text("destination selected success"));
            print("lat destination => ${pickedData.latLong.latitude}");
            print("long destination => ${pickedData.latLong.longitude}");
            print("address => ${pickedData.address.characters}");
            CacheHelper.saveData(
                key: AppConstantKey.latTo, value: pickedData.latLong.latitude.toDouble());
            CacheHelper.saveData(
                key: AppConstantKey.longTo,
                value: pickedData.latLong.longitude.toDouble());
            CacheHelper.saveData(
                key: AppConstantKey.getCityNameDestination,
                value: pickedData.address.characters.toString());
            Navigator.pop(context);
          }),
    );
  }
}
