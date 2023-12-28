import 'package:flutter/cupertino.dart';

class MainCustomSizedBox extends StatelessWidget {
  const MainCustomSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .05,
    );
  }
}
