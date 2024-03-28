abstract class DateFormatter {
  String formatTime(DateTime dateTime);
}

class DateFormatterImpl implements DateFormatter {
  @override
  String formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }
}
