String calculateTimeDifferenceBetween(String startDate) {
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
    return startDate;
  }
}
