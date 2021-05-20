import 'package:flutter/material.dart';
import 'package:paradigm_flutter/app_color.dart';
import 'package:paradigm_flutter/app_configs.dart';
import 'package:paradigm_flutter/data/cache/pref_key.dart';
import 'package:paradigm_flutter/data/cache/preferences_helper.dart';
import 'package:paradigm_flutter/language/app_translations.dart';
import 'package:paradigm_flutter/language/application.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  String codeLanguage;
  //String displayLanguageName = LANGUAGE.VI.displayName;

  ValueNotifier<String> displayLanguageName =
      ValueNotifier(LANGUAGE.VI.displayName);

  @override
  void initState() {
    super.initState();
    initValue();
  }

  void initValue() async {
    ///SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    codeLanguage =
        await PreferencesHelper.getString(PrefKey.prefLanguage, "vi");

    displayLanguageName.value = codeLanguage == LANGUAGE.VI.code
        ? LANGUAGE.VI.displayName
        : LANGUAGE.EN.displayName;
  }

  void onChangeLangue(LANGUAGE language) {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    PreferencesHelper.putString(PrefKey.prefLanguage, language.code);
    //sharedPreferences.setString("lang", language.code);
    this.codeLanguage = language.code;

    displayLanguageName.value = language.displayName;

    //apply change app
    application.onLocaleChanged(Locale(language.code));
  }

  Widget _languageWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTranslations.of(context).text("language"),
            style: TextStyle(
              color: AppColor.themeColor,
              fontSize: 16.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showDiglogChooseLanguage(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: displayLanguageName,
                  builder: (context, value, child) => Text(
                    value,
                    style: TextStyle(
                      color: AppColor.grayColor,
                      fontSize: 16.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 25,
                  color: AppColor.grayColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _infoWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTranslations.of(context).text("information"),
            style: TextStyle(
              color: AppColor.themeColor,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTranslations.of(context).text("version"),
                style: TextStyle(
                  color: AppColor.grayColor,
                  fontSize: 16.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                AppConfig.version,
                style: TextStyle(
                  color: AppColor.grayColor,
                  fontSize: 16.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }

  showDiglogChooseLanguage(context) {
    showDialog<LANGUAGE>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(AppTranslations.of(context).text("choose_language")),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, LANGUAGE.EN);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: LANGUAGE.EN.code == codeLanguage
                              ? AppColor.themeColor
                              : AppColor.whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: LANGUAGE.EN.code == codeLanguage
                            ? Icon(
                                Icons.check,
                                size: 15.0,
                                color: Colors.white,
                              )
                            : Icon(
                                null,
                                size: 15.0,
                                color: Colors.blue,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text(
                      LANGUAGE.EN.displayName,
                      style: TextStyle(
                        color: AppColor.grayColor,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ))
                    
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, LANGUAGE.VI);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: LANGUAGE.VI.code == codeLanguage
                              ? AppColor.themeColor
                              : AppColor.whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: LANGUAGE.VI.code == codeLanguage
                            ? Icon(
                                Icons.check,
                                size: 15.0,
                                color: Colors.white,
                              )
                            : Icon(
                                null,
                                size: 15.0,
                                color: Colors.blue,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text(
                      LANGUAGE.VI.displayName,
                      style: TextStyle(
                        color: AppColor.grayColor,
                       fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ))
                    
                  ],
                ),
              ),
            ],
          );
        }).then((value) => {onChangeLangue(value)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppTranslations.of(context).text("settings"), style: TextStyle(fontSize:18.0),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColor.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: Container(
        color: AppColor.whiteColor,
        child: ListView(
          children: [
            _languageWidget(context),
            SizedBox(
              height: 10,
            ),
            _infoWidget(context)
          ],
        ),
      ),
    );
  }
}
