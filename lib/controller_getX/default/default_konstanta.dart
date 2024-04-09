
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin defaultKonstanta{
  late SharedPreferences prefs;
  final formatDecimal = NumberFormat("###.###", "id_ID");
  final formatDecimalNol = NumberFormat("###.0000", "id_ID");
  
  sharedPref()async{
    prefs = await SharedPreferences.getInstance();
  }
}
