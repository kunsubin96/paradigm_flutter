

import 'package:paradigm_flutter/language/app_translations.dart';

class DateUtils {
  

  static String getStringMonth(int month, context) {
    switch (month) {
      case 1:
        return AppTranslations.of(context).text("january");
      case 2:
        return AppTranslations.of(context).text("february");
      case 3:
        return AppTranslations.of(context).text("march");
      case 4:
        return AppTranslations.of(context).text("april");
      case 5:
        return AppTranslations.of(context).text("may");
      case 6:
        return AppTranslations.of(context).text("june");
      case 7:
        return AppTranslations.of(context).text("july");
      case 8:
        return AppTranslations.of(context).text("august");
      case 9:
        return AppTranslations.of(context).text("september");
      case 10:
        return AppTranslations.of(context).text("october");
      case 11:
        return AppTranslations.of(context).text("november");
      case 12:
        return AppTranslations.of(context).text("december");
      default:
        return "";
    }
  }
}
