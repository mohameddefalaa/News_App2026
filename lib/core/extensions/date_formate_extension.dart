import 'package:intl/intl.dart';

extension DateFormate on String {
  String formatTimeAgo(String? publishedAtStr) {
    try {
      if (publishedAtStr == null) return "";

      Duration difference = DateTime.now().difference(
        DateTime.parse(this).toLocal(),
      );

      if (difference.inSeconds < 60) {
        return 'a second ago';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes}m ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours}h ago';
      } else if (difference.inDays < 30) {
        return '${difference.inDays}d ago';
      } else {
        return DateFormat('yyyy-MM-dd').format(DateTime.parse(this).toLocal());
      }
    } catch (e) {
      return 'unknown date';
    }
  }
}
