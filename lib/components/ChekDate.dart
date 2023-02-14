// ignore: file_names, non_constant_identifier_names
ChekDate(String Date) {
  String number1 = '';
  String number2 = '';
  for (int i = 0; i < 2; i++) {
    number1 = number1 + Date[i];
  }
  // ignore: avoid_print
  print(number1);
  for (int i = 2; i < 4; i++) {
    number2 = number1 + Date[i];
  }
  // ignore: avoid_print
  print(number1);
  if (int.parse(number1) <= 12) {
    if (int.parse(number2) >= 23) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
