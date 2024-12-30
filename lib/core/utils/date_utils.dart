import 'package:intl/intl.dart';

class DateUtils {
  String formatDateTimeInArabic(DateTime dateTime) {
    String dayOfWeek = DateFormat('EEEE', 'ar').format(dateTime);
    String day = DateFormat('d', 'ar').format(dateTime);
    String month = DateFormat('MMMM', 'ar').format(dateTime);
    String year = DateFormat('y', 'ar').format(dateTime);
    return '$dayOfWeek $day $month $year';
  }

  String dateFormatter(
      String notFormattedDate, {
        Duration subtractedDuration = const Duration(),
        bool showSeconds = false,
      }) {
    DateTime dateTimeObj = DateTime.parse(
        "${DateFormat("yyyy-MM-dd").format(DateTime.now())} $notFormattedDate")
        .subtract(subtractedDuration);
    return DateFormat(showSeconds ? "hh:mm:ss" : 'hh:mm').format(dateTimeObj);
  }
}
