

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final String appName = "Para";
  static final String version = "1.0.0";

  static final String baseUrl = env['VAR_NAME'];

}

enum LANGUAGE { EN, VI }

extension LanguageExtension on LANGUAGE {
  String get displayName {
    switch (this) {
      case LANGUAGE.EN:
        return "English (Tiếng Anh)";
      case LANGUAGE.VI:
        return "Vietnamese (Tiếng Việt)";
      default:
        return "";
    }
  }

  String get code {
    switch (this) {
      case LANGUAGE.EN:
        return "en";
      case LANGUAGE.VI:
        return "vi";
      default:
        return "";
    }
  }
}