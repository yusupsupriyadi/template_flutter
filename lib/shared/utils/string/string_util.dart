import 'package:intl/intl.dart';

extension NumExtension on num {
  String get currency {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(this);
  }
}
