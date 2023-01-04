import 'package:intl/intl.dart';

class MyDateUtils{
static String formattaskDate(DateTime dateTime){
  DateFormat formatter = DateFormat('dd / MM / yyyy');
  return formatter.format(dateTime);

}
}