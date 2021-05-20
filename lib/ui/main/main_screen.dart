
import 'package:paradigm_flutter/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:paradigm_flutter/app_configs.dart';
import 'package:paradigm_flutter/language/app_translations.dart';
import 'package:paradigm_flutter/ui/settings/setting_screen.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>MainScreenState();
}
class MainScreenState extends State<MainScreen>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text("",
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen())), child: Text(AppTranslations.of(context).text("choose_language"))),
            RaisedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())), child: Text(AppTranslations.of(context).text("login")))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {

        },
        child: Icon(Icons.add),
      ), 
    );
  }
}