import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  // Create a DateFormat object for the desired format
  final dateFormat = DateFormat('dd/MM/yyyy');

  // Format the DateTime object to a string
  return dateFormat.format(dateTime);
} 


String parseMillisecondsSinceEpoch(int timestampMs) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch((timestampMs ~/ 1000).round() * 1000);
  int roundedMinutes = (dateTime.minute ~/ 10) * 10;
  
  dateTime = dateTime.subtract(Duration(
    minutes: dateTime.minute - roundedMinutes,
    seconds: dateTime.second,
    milliseconds: dateTime.millisecond,
    microseconds: dateTime.microsecond,
  ));

  return DateFormat('hh:mm a').format(dateTime).toLowerCase();
}
