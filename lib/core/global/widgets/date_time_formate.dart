import 'package:intl/intl.dart';

String dateTimeFormatted({required String s, required String time}) {
  var now = DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedTime = DateFormat('kk:mm:a').format(now);
  String formattedDate = formatter.format(now);
  if (s == 't') {
    return formattedTime;
  }
  if (s == 'y') {
    return formattedDate;
  } else {
    return 'Enter t or y only';
  }
}
