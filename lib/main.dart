
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paradigm_flutter/app_color.dart';
import 'package:paradigm_flutter/app_configs.dart';
import 'package:paradigm_flutter/data/cache/pref_key.dart';
import 'package:paradigm_flutter/data/cache/preferences_helper.dart';
import 'package:paradigm_flutter/language/app_translations_delegate.dart';
import 'package:paradigm_flutter/language/application.dart';
import 'package:paradigm_flutter/ui/main/main_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init default config from file .env
  // NOTE: The filename will default to .env and doesn't need to be defined in this case
  await DotEnv.load(fileName: ".env");
  
  runApp(RootApplication());
}

class RootApplication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootApplicationState();
}

class RootApplicationState extends State<RootApplication> {
  AppTranslationsDelegate _newLocaleDelegate;
  @override
  void initState() {
    super.initState();
    //_newLocaleDelegate=AppTranslationsDelegate(newLocale: Locale("en",""));
    //load default langue emulator
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    initLangue();
  }

  void initLangue() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String code = await PreferencesHelper.getString(PrefKey.prefLanguage, "vi");
    onLocaleChange(Locale(code));
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColor.primaryColor,
          primaryColorDark: AppColor.primaryColorDark,
          accentColor: AppColor.accentColor,
          brightness: Brightness.light),
      home: MainScreen(),
      localizationsDelegates: [
        _newLocaleDelegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
        //provides Cupertino ios
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("vi", ""),
      ],
      
    );
  }
}
