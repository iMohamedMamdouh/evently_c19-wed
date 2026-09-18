class AppDate {
  static List<String> shortMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  static List<String> fullMonths = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  static String getShortDate(DateTime date) {
    return "${date.day} ${shortMonths[date.month - 1]}";
  }

  static String getFullDate(DateTime date) {
    return "${date.day} ${fullMonths[date.month - 1]}";
  }
}
