import 'package:intl/intl.dart';

String calculateTimeDifferenceBetween(String startDate,
    [String format = "dd/MM/yyyy HH:mm"]) {
  Duration diff = DateTime.now().difference(DateTime.parse(startDate));
  if (diff.inSeconds < 60) {
    return '${diff.inSeconds} second';
  } else if (diff.inSeconds >= 60 && diff.inSeconds < 3600) {
    return '${diff.inMinutes} minute';
  } else if (diff.inSeconds >= 3600 && diff.inSeconds < 86400) {
    return '${diff.inHours} hour';
  } else if (diff.inDays < 99) {
    return '${diff.inDays} day';
  } else {
    return DateFormat(format).format(DateTime.parse(startDate));
  }
}

String format(DateTime value, [String? pattern]) {
  return DateFormat(pattern).format(value);
}
