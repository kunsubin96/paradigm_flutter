
import 'package:paradigm_flutter/data/auth_repository.dart';
import 'package:paradigm_flutter/data/cache/user_preferences_helper.dart';
import 'package:paradigm_flutter/data/remote/model/data_response.dart';
import 'package:paradigm_flutter/model/login_body.dart';
import 'package:flutter/material.dart';
import 'package:paradigm_flutter/app_color.dart';
import 'package:paradigm_flutter/language/app_translations.dart';
import 'package:paradigm_flutter/ui/utils/widget_utils.dart';
import 'package:paradigm_flutter/ui/widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>LoginScreenState();

}
class LoginScreenState extends State<LoginScreen>{
   TextEditingController textUsernameController;
  TextEditingController textPasswordController;

  @override
  void initState() {
    super.initState();
    textUsernameController = TextEditingController();
    textPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    textUsernameController.dispose();
    textPasswordController.dispose();
    super.dispose();
  }

  Widget _logoWidget(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 50, bottom: 50),
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: 120,
          height: 120,
        ),
      ),
    );
  }

  Widget _inputUsername(context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          autofocus: false,
          onTap: () {},
          style: TextStyle(fontSize: 16.0, color: AppColor.grayColor),
          controller: textUsernameController,
          maxLines: 1,
          decoration: InputDecoration(
            isDense: true,                      // Added this
          contentPadding: EdgeInsets.all(10.0),
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.circular(10.0)),
            hintText: AppTranslations.of(context).text("enter_username"),
            prefixIcon: Icon(
              Icons.email,
              size: 24,
            ),
          ),
        ));
  }

  Widget _inputPassword(context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        autofocus: false,
        onTap: () {},
        controller: textPasswordController,
        obscureText: true,
        
        style: TextStyle(fontSize: 16.0, color: AppColor.grayColor),
        maxLines: 1,
        decoration: InputDecoration(
          //labelText: "dsfkjjkds",
          //labelStyle: TextStyle(color: AppColor.grayColor, fontSize: 23.0),
          isDense: true,                      // Added this
          contentPadding: EdgeInsets.all(10.0),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: AppTranslations.of(context).text("enter_password"),
          prefixIcon: Icon(
            Icons.lock,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: RaisedButton(
          child: Text(AppTranslations.of(context).text("login"),
              style: TextStyle(
                fontSize: 17.0,
              )),
          onPressed: () {
            this.onLogin(context);
          },
          color: AppColor.themeColor,
          textColor: Colors.white,
          padding:
              EdgeInsets.only(top: 15.0, bottom: 15.0, right: 80.0, left: 80.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: AppColor.themeColor)),
        ),
      ),
    );
  }



  onLogin(context) async {
    //check
    if (textUsernameController.text?.length == 0) {
      WidgetUtils.showDialogInfo(
          context, "", AppTranslations.of(context).text("enter_username"));
      return;
    }
    if (textPasswordController.text?.length == 0) {
      WidgetUtils.showDialogInfo(
          context, "", AppTranslations.of(context).text("enter_password"));
      return;
    }
    // if (!ValidationHelper.isEmail(textUsernameController.text)) {
    //   WidgetUtils.showDialogInfo(
    //       context, "", AppTranslations.of(context).text("is_not_mail"));
    //   return;
    // }
    //show dialog loading
    ProgressDialog.show(context);
    try {
      LoginBody loginBody = LoginBody(
          username: textUsernameController.text,
          password: textPasswordController.text);

      DataResponse authResponse =
          await AuthRepository.getInstance().login(loginBody);
      ProgressDialog.hide(context);
      if(authResponse.success){
          //push token, user to cache
          
          WidgetUtils.showDialogInfo(context, "", authResponse.data);
      }else{
          WidgetUtils.showDialogInfo(context, "", authResponse.message);
      }
    } catch (e) {
      print(e);
      ProgressDialog.hide(context);
      UserPreferencesHelper.logOut();
      WidgetUtils.showDialogInfo(
          context, "", AppTranslations.of(context).text("login_fail"));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColor.grayColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        brightness: Brightness.light,
      ),
      body: Container(
        color: AppColor.mainColor,
        child: ListView(
          children: [
            _logoWidget(context),
            _inputUsername(context),
            SizedBox(height: 10.0),
            _inputPassword(context),
            _buttonLogin(context),
          ],
        ),
      ),
    );
  }
}