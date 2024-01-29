import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
// class DateUtil {
//   static String todMMMy(DateTime date) {
//     return DateFormat("EEEE, d MMM y").format(date);
//   }
// }

extension DateTimeExtension on DateTime {
  String get fullDate {
    return DateFormat("dd MMMM yyyy").format(this);
  }

  String get shortDate {
    return DateFormat("dd MMM yy").format(this);
  }

  String get dayAndDate {
    return DateFormat("EEEE, d").format(this);
  }

  String get time24 {
    return DateFormat("HH:mm").format(this);
  }

  String get time12 {
    return DateFormat("h:mm a").format(this);
  }

  String get time12NoPeriod {
    return DateFormat("h:mm").format(this);
  }

  String get time12MonthName {
    return DateFormat("h:mm a, MMMM dd, yyyy").format(this);
  }

  String get time12DayAndDate {
    return DateFormat("h:mm a, EEEE, d").format(this);
  }
}
