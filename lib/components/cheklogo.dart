// ignore: non_constant_identifier_names
Cheklogo(String number) {
  String number1 = '';
  for (int i = 0; i < 2; i++) {
    number1 = number1 + number[i];
  }
  // ignore: avoid_print
  print(number1);
  if (int.parse(number1) >= 50 && int.parse(number1) <= 55) {
    return 'mastercard';
  } else if (int.parse(number1) >= 41 && int.parse(number1) <= 49) {
    return 'visa';
  } else if (int.parse(number1) == 86) {
    return 'uzcard';
  } else if (int.parse(number1) == 56) {
    return 'humo';
  }
  return 'Salom';
}
