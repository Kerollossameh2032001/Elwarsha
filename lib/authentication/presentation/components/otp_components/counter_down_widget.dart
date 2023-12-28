import 'dart:async';

import 'package:elwarsha/core/constant/app_constant_key.dart';
import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int _countdownValue = 90;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_countdownValue < 1) {
          timer.cancel();
          if(CacheHelper.getDate(key: AppConstantKey.getToken) == null) {
            Navigator.pop(context);
            Navigator.pop(context);
          }

        } else {
          _countdownValue = _countdownValue - 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Time out: $_countdownValue',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
