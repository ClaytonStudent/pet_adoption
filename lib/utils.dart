String calculateAge(String birthDate) {
  // Parse the birthDate string into a DateTime object
  DateTime birthDateTime = DateTime.parse(birthDate);
  DateTime currentDate = DateTime.now();

  // Calculate years, months, and days
  int years = currentDate.year - birthDateTime.year;
  int months = currentDate.month - birthDateTime.month;
  int days = currentDate.day - birthDateTime.day;

  // Adjust if necessary
  if (days < 0) {
    months -= 1;
    days += DateTime(currentDate.year, currentDate.month, 0)
        .day; // Get the number of days in the previous month
  }
  if (months < 0) {
    years -= 1;
    months += 12;
  }

  // Return the formatted age string
  return '${years}年 ${months}月 ${days}天';
}
