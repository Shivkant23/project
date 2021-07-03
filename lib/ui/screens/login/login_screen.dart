import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omnirio/core/models/country.dart';
import 'package:omnirio/core/models/response/login_reponse_model.dart';
import 'package:omnirio/core/services/shared_pref_util.dart';
import 'package:omnirio/core/view_model/base_model.dart';
import 'package:omnirio/ui/common/custom_button.dart';
import 'package:omnirio/ui/screens/home_screen.dart';
import 'package:omnirio/ui/screens/signup/sign_up_screen.dart';
import 'package:omnirio/utils/utils.dart';


class LoginScreen extends StatefulWidget {
  static const String pathName = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();
  final _resetFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final resetEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final signupEmailController = TextEditingController();
  final fullnameEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final mobileController = TextEditingController();
  final emailForgotController = TextEditingController();
  String selectedCountry = "PH";
  String selectedCountryCode;
  List<CountryDetails> countryList = [
    CountryDetails(countryCode: "PH", name: "Philippines"),
    CountryDetails(countryCode: "IN", name: "India"),
    CountryDetails(countryCode: "SG", name: "Singapore"),
    CountryDetails(countryCode: "USA", name: "United States America"),
  ];
  TextStyle textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal);

  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode fullnameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode mobileFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode emailResetFocus = FocusNode();
  bool isPasswordVisible;
  bool isForgotPasswordVisible;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  bool rememberMe = false;
  bool referral = false;
  bool termsAndConditions = false;
  String moduleName = "login";
  String test1 = "Password must be of 8 or more characters in length.";
  String test2 = "Password must contain 1 or more uppercase characters.";
  String test3 = "Password must contain 1 or more lowercase characters.";
  String test4 = "Password must contain 1 or more special characters.";
  String test5 = "Password must contain 1 or more digit characters.";
  bool isMobileFieldValidated = false;
  String mobileError;
  double kMediumDeviceSize = 700;
  double kSmallDeviceSizeWidth = 400;
  double width;

  @override
  void initState() {
    super.initState();
    isPasswordVisible = false;
    isForgotPasswordVisible = false;
    if(SharedPrefUtil.getLoggedInStatus()  && SharedPrefUtil.getRememberMe()){
      emailController.text = SharedPrefUtil.getEmail();
      passwordController.text = SharedPrefUtil.getPassword();
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: 
      SingleChildScrollView(
        child: Form(
          key: moduleName == "login" ? _formKey :(moduleName == "forgot" ? _resetFormKey : _signupFormKey),
          autovalidateMode: _autoValidateMode,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child:Image.asset(
                              'assets/ominirio_logo.png',
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                              width: double.infinity,
                            )
                          ),
                          Container()
                        ],
                      ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: 250,
                        height: 150,
                        child: CustomPaint(
                          painter: OpenPainter(),
                        ),
                      ),
                      Image.asset(
                        'assets/gift.png',
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        height: 330,
                        width: MediaQuery.of(context).size.width/1.3,
                      ),
                      
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Column(children: <Widget>[
                  SizedBox(height: 15),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: selectModule(moduleName),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectModule(String module){
    switch(module){
      case "login": return loginModule();
       break;
      case "forgot": return forgotPassword();
        break;
      case "signup": return signUpModule();
        break;
    }
  }

  signUpModule(){
    return Padding(
      padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
  //                              key: UniqueKey(),
          children: [
            Text("Sign Up",
              style: (Theme.of(context).textTheme.headline6)
                      .copyWith(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text("Fullname*"),
            SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              focusNode: fullnameFocus,
              onFieldSubmitted: (v) {
                FocusScope.of(context)
                    .requestFocus(passwordFocus);
              },
              validator: (val) {
                if(val.trim().isEmpty){
                  return "This field should not be empty.";
                }
                return null;
              },
              controller: fullnameEmailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black26)
                ),
                hintText: "Fullname"
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Text("Email*"),
            SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: emailFocus,
              textInputAction: TextInputAction.next,
              validator: (val) {
                if(val.trim().isEmpty){
                  return "This field should not be empty";
                }else if(!isEmail(val)){
                  return "Enter email valid format";
                }
                return null;
              },
              controller: signupEmailController,
              decoration: InputDecoration(
                hintText: "Enter Email",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Password*"),
            SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: passFocus,
              textInputAction: TextInputAction.next,
              validator: (val) {
                if(val.trim().isEmpty){
                  return "This field should not be empty";
                }else if(!isPassword(val)){
                  return "Enter password valid format";
                }
                return null;
              },
              controller: signupPasswordController,
              decoration: InputDecoration(
                hintText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                suffixIcon: SizedBox(
                  width: MediaQuery.of(context).size.width/3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.info,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async{
                          var returnStr = await showDialog(
                            context: context,
                            builder: (_) => infoDialog()
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          !isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible =
                                !isPasswordVisible;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              obscureText: isPasswordVisible
            ),

            SizedBox(height: 10),
            Text("Mobile Number*"),
            SizedBox(height: 10),
            Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: isMobileFieldValidated ? Color(0xFFd32f2f) : (mobileFocus.hasFocus ? Theme.of(context).primaryColor :Color(0xFF9b9b9b)), width: mobileFocus.hasFocus ? 2 : 1)
              ),
              child: Row(
                children: <Widget>[
                  DropdownButtonHideUnderline(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 8, 5, 8),
                      child: DropdownButton<String>(
                        value: selectedCountry,
                        items: countryList.map((item) {
                          return DropdownMenuItem<String>(child: Text(item.countryCode), value: item.countryCode);
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != selectedCountry) {
                            setState(() {
                              selectedCountry = newValue;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Container(width: 1),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      focusNode: mobileFocus,
                      controller: mobileController,
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        border: InputBorder.none,
                      ),
                      onChanged: (val){
                        setState(() {
                          if(val.trim().isEmpty){
                            mobileError =  "This field should not be empty";
                            isMobileFieldValidated = true;
                          }else if(!isMobile(val)){
                            mobileError =  "Enter valid format";
                            isMobileFieldValidated = true;
                          }else{
                            mobileError =  "";
                            isMobileFieldValidated = false;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            isMobileFieldValidated ?
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 0, 10),
              child: Text(mobileError == null ? "This field should not be empty" : mobileError,
                style: TextStyle(
                  color: Color(0xFFd32f2f),
                  fontSize: 12,
                  fontWeight: FontWeight.normal
                ),
              ),
            ): Container(),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 20,
                  child: Checkbox(
                    value: referral, 
                    onChanged: (val){
                      setState(() {
                        referral = !referral;                            
                      });
                    }
                  ),
                ),
                SizedBox(width: 10,),
                Text("Do you have a referral code?", style: TextStyle(color: Theme.of(context).primaryColor),)
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 20,
                  child: Checkbox(
                    value: termsAndConditions, 
                    onChanged: (val){
                      setState(() {
                        termsAndConditions = !termsAndConditions;                            
                      });
                    }
                  ),
                ),
                SizedBox(width: 10,),
                Text("I agree with the terms and conditions", style: TextStyle(color: Theme.of(context).primaryColor),)
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if(mobileController.text.trim().isEmpty){
                          isMobileFieldValidated = true;
                        }else if(!isMobile(mobileController.text)){
                          isMobileFieldValidated = true;
                        }else{
                          isMobileFieldValidated = false;
                        }
                    });
                    if (_signupFormKey.currentState.validate()){
                      if(!termsAndConditions){
                        BotToast.showText(text: "Please read and accept Terms and Conditions");
                        return;
                      }
                      showSuccessMessage("Registered successfully.");
                      setState(() {
                        isMobileFieldValidated = false;
                      });
                    }
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text("Sign Up",  style: TextStyle(fontSize: 18),),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        // side: BorderSide(color: Colors.red)
                      )
                    ),
                  )
                ),
                GestureDetector(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(color: Colors.black)
                        ),
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline
                          )
                        ),
                      ]
                    )
                  ),
                  onTap: (){
                    setState(() {
                      moduleName = "login";              
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
    );
  }


  loginModule(){
    return Padding(
      padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login",
              style: (Theme.of(context).textTheme.headline6)
                      .copyWith(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text("Username or Email"),
            SizedBox(height: 16),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              focusNode: usernameFocus,
              onFieldSubmitted: (v) {
                FocusScope.of(context)
                    .requestFocus(passwordFocus);
              },
              validator: (val) {
                if(val.trim().isEmpty){
                  return "This field should not be empty";
                }else if(!isEmail(val)){
                  return "Enter email valid format";
                }
                return null;
              },
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black26)
                ),
                hintText: "Enter Username or Email"
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),
            Text("Password"),
            SizedBox(height: 16),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: passwordFocus,
              textInputAction: TextInputAction.done,
              validator: (val) {
                if(val.trim().isEmpty){
                  return "This field should not be empty";
                }else if(!isLoginPassword(val)){
                  return "Enter password valid format";
                }
                // if(!isRecurringNumber(val)){
                //   return "Enter password valid format 2";
                // }
                return null;
              },
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    !isForgotPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isForgotPasswordVisible =
                          !isForgotPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: isForgotPasswordVisible
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 20,
                  child: Checkbox(
                    value: rememberMe, 
                    onChanged: (val){
                      setState(() {
                        rememberMe = !rememberMe;                            
                      });
                    }
                  ),
                ),
                SizedBox(width: 10,),
                Text("Remember Me", style: TextStyle(color: Theme.of(context).primaryColor),)
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState.validate()){
                      SharedPrefUtil.setRememberMe(rememberMe);
                      SharedPrefUtil.setLoggedInStatus(true);
                      SharedPrefUtil.setEmail(emailController.text);
                      SharedPrefUtil.setPassword(passwordController.text);
                      showSuccessMessage("Logged in successfully");
                    }
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Login",  style: TextStyle(fontSize: 18),),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        // side: BorderSide(color: Colors.red)
                      )
                    ),
                  )
                ),
                Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: InkWell(
                  child: Text("Forgot Password ?", style: TextStyle(color: Theme.of(context).primaryColor),),
                  onTap: () {
                    setState(() {
                      moduleName = "forgot";
                    });
                  },
                ),
              ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(),
                Text("Don't have an account?"),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: InkWell(
                    child: Text("Sign Up", style: TextStyle(color: Theme.of(context).primaryColor),),
                    onTap: () {
                      setState(() {
                        moduleName = "signup";                                          
                      });
                    },
                  ),
                ),
                Container(),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
    );
  }

  forgotPassword(){
    return Padding(
      padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 10),
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forgot Password ?",
                style: (Theme.of(context).textTheme.headline6)
                      .copyWith(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text("Username or Email"),
              SizedBox(height: 16),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: emailResetFocus,
                validator: (val) {
                if(val.trim().isEmpty){
                  return "This field should not be empty";
                }else if(!isEmail(val)){
                  return "Enter email valid format";
                }
                return null;
              },
                controller: resetEmailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black26)
                  ),
                  hintText: "Enter Username or Email"
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                  onPressed: (){
                    if (_resetFormKey.currentState.validate()){
                      showSuccessMessage("Reset Password link sent by mail.");
                    }
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Reset",  style: TextStyle(fontSize: 18),),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        // side: BorderSide(color: Colors.red)
                      )
                    ),
                  )
                ),
                  ),
                  GestureDetector(
                    child: Text("Back to login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context)
                              .primaryColor,
                          fontSize: 16,
                          fontFamily: "Montserrat"),
                    ),
                    onTap: () {
                      setState(() {
                        moduleName = "login";
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 95),
            ],
          ),
        ),
    );
  }

  infoDialog(){
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Container(
          // height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height -  200 : MediaQuery.of(context).size.height - 80,
          // width: MediaQuery.of(context).size.width ,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Text("Password Specifications", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold,
                      color: Colors.black45
                    ),),
                    // IconButton(
                    //   icon: Icon(Icons.clear),
                    //   onPressed: (){
                    //     Navigator.pop(context);
                    //   }
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(test1, style: textStyle),
                    SizedBox(height: 10,),
                    Text(test2, style: textStyle),
                    SizedBox(height: 10,),
                    Text(test3, style: textStyle),
                    SizedBox(height: 10,),
                    Text(test4, style: textStyle),
                    SizedBox(height: 10,),
                    Text(test5, style: textStyle),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Text("Okay",  style: TextStyle(fontSize: 18),),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // side: BorderSide(color: Colors.red)
                                )
                              ),
                            )
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        )
      ],
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xfff0f1f6)
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(Offset(160, 140), 200, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}