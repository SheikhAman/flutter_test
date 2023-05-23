import 'package:intl/intl.dart';

class Utils {
  static String formatDate(String dateString) {
    final inputFormat = DateFormat('yyyy-MM-dd');
    final outputFormat = DateFormat('MMM d, yyyy');

    final DateTime date = inputFormat.parse(dateString);
    final String formattedDate = outputFormat.format(date);

    return formattedDate;
  }
}
