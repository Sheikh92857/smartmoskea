
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_moskea/pages/loggedInMainScreen.dart';
import 'package:smart_moskea/style/theme.dart' as Theme;
import 'package:smart_moskea/utils/bubble_indication_painter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_moskea/requests/authServices.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodePhone = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _autoValidate = false;
  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupPhoneController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
  new TextEditingController();

  var _formKeySignIn = GlobalKey<FormState>();
  var _formKeySignUp = GlobalKey<FormState>();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  int SelectedRadio;
  bool viewComVisible = false ;
  bool viewImamVisible = false;


  File _image;

  String phoneNumber, verificationId, smsCode, _signInPhoneNumber;

  bool smsSent=false;



  void open_camera()
    async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }


  void open_gallery()
  async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future uploadImage(BuildContext context) async{
    String filename = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('Certificate');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print('certificate  upoaded');
    });
  }


final FirebaseAuth _auth = FirebaseAuth.instance;
getCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    // Similarly we can get email as well
    //final uemail = user.email;
    print("user id is" + uid);
    //print(uemail);
  }


  Widget commette_feild() {
    return  Visibility(
      visible: viewComVisible,
        child: Column(
          children: <Widget>[
            Container(
              height: 10.0,
              child: _image==null ? Text(" ") : Image.file(_image),),
            FlatButton(
              color: Colors.deepOrangeAccent,
              child: Text("Upload Mosque Receipt"),
              onPressed: () {
                open_camera();
              },
            ),
            FlatButton(
              child: Text("Open Gallery"),
              onPressed: () {
                open_gallery();
              },
            )
          ],
        ),
      );
  }

  Widget imam_feild() {
    return  Visibility(
      visible: viewImamVisible,
      child: Padding(
        padding: EdgeInsets.only(
            top: 0.0, bottom: 0.0, left: 25.0, right: 25.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 10.0,
              child: _image==null ? Text(" ") : Image.file(_image),),
            FlatButton(
              color: Colors.deepOrangeAccent,
              child: Text("Upload Certificate"),
              onPressed: () {
                open_camera();
              },
            ),
            FlatButton(
              child: Text("Upload Certificate from Gallery "),
              onPressed: () {
                open_gallery();
              },
            )
          ],
        ),
      ),
    );
  }

  void showComWidget(){
    setState(() {
      viewComVisible = true ;
    });
  }

  void hideComWidget(){
    setState(() {
      viewComVisible = false ;
    });
  }
void showImamWidget(){
    setState(() {
      viewImamVisible = true ;
    });
  }

  void hideImamWidget(){
    setState(() {
      viewImamVisible = false ;
    });
  }


  final DatabaseReference database = FirebaseDatabase.instance.reference().child("users");

  sendData()  {
    database.push().set({
      'name' : signupNameController.text,
      'phonenumber': signupPhoneController.text,
      'catogery': SelectedRadio,
      'password': signupConfirmPasswordController.text
      });




  DBCrypt dBCrypt = DBCrypt();
  const plainPwd = 'password';

  String hasedPWD = dBCrypt.hashpw(plainPwd, dBCrypt.gensalt());
  assert(dBCrypt.checkpw(plainPwd, hasedPWD), true);
  String salt = dBCrypt.gensaltWithRounds(12);
  hasedPWD = dBCrypt.hashpw(plainPwd, salt);
  assert(dBCrypt.checkpw(plainPwd, hasedPWD), true);  
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Theme.Colors.loginGradientStart,
                    Theme.Colors.loginGradientEnd
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignIn(context),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignUp(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodePhone.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SelectedRadio=0;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  setSelectedRadio(int val){
    setState(() {
      SelectedRadio = val;
    });
    if(SelectedRadio==1)
    {
      hideComWidget();
      hideImamWidget();
    }
    if(SelectedRadio==2)
    {
      showComWidget();
      hideImamWidget();
    }
    if (SelectedRadio==3)
    {
      showImamWidget();
      hideComWidget();
    }
    print(SelectedRadio);
  }


String validateMobile(String value) 
{
String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
RegExp regExp = new RegExp(patttern);
if (value.length == 0) {
      return 'Please enter mobile number';
}
else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
}
return null;
} 

String validatePassword(String value)
{
  if(value.isEmpty)
  {
    return "Please enter Password";
  }
}

String validateName(String value)
{
  if(value.isEmpty)
  {
    return "Please enter your Name";
  }
}

String validateSignupPassword(String value)
{
  if(value.isEmpty)
  {
    return "Please Enter Email";
  }
  if(value.length<8)
  {
    return "Enter More Then 8 Characters";
  }
}


// signIn() async{

//       await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginEmailController.text, password:loginPasswordController.text).then((user){
//        //Navigator.of(context).pushReplacementNamed('/homepage');
//          print('signed in with phone number successful: user -> $user');
//     }).catchError((e){
//        print("error in signing in");
//     });
//   }

      Future<String> getPhoneNumber() async {
        String result = (await FirebaseDatabase.instance.reference().child("users/phonenumber").once()).value;
        print('number is '+ result);
        return result;
      }



      Future<String> getPassword() async {
        String result = (await FirebaseDatabase.instance.reference().child("users/password").once()).value;
        print('password is '+ result);
        return result;
      }


  getdata() {
      if(loginEmailController.text==getPhoneNumber()){
        if(loginPasswordController.text==getPassword()){
          LoggedInMainScreen();
        }
        else {
          print('error');
        }
      }
}


 




  // void showInSnackBar(String value) {
  //   FocusScope.of().requestFocus(new FocusNode());
  //   _scaffoldKey.currentState?.removeCurrentSnackBar();
  //   _scaffoldKey.currentState.showSnackBar(new SnackBar(
  //     content: new Text(
  //       value,
  //       textAlign: TextAlign.center,
  //       style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 16.0,
  //           fontFamily: "WorkSansSemiBold"),
  //     ),
  //     backgroundColor: Colors.blue,
  //     duration: Duration(seconds: 3),
  //   ));
  // }

  Widget _buildMenuBar(BuildContext context) {
    return  Container(
        width: 300.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Color(0x552B2B2B),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: CustomPaint(
          painter: TabIndicationPainter(pageController: _pageController),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: _onSignInButtonPress,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: left,
                        fontSize: 16.0,
                        fontFamily: "WorkSansSemiBold"),
                  ),
                ),
              ),
              //Container(height: 33.0, width: 1.0, color: Colors.white),
              Expanded(
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: _onSignUpButtonPress,
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: right,
                        fontSize: 16.0,
                        fontFamily: "WorkSansSemiBold"),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

  Widget _buildSignIn(BuildContext context) {
    return Form(
      key: _formKeySignIn,
          child: Container(
        padding: EdgeInsets.only(top: 23.0),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 300.0,
                    height: 230.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            validator: validateMobile,
                            focusNode: myFocusNodeEmailLogin,
                            controller: loginEmailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                            ),
                            onChanged: (String val)
                            {
                              _signInPhoneNumber = val;
                            },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            validator: validatePassword,
                            focusNode: myFocusNodePasswordLogin,
                            controller: loginPasswordController,
                            obscureText: _obscureTextLogin,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                size: 22.0,
                                color: Colors.black,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleLogin,
                                child: Icon(
                                  _obscureTextLogin
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 220.0),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.Colors.loginGradientStart,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                      BoxShadow(
                        color: Theme.Colors.loginGradientEnd,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                    ],
                    gradient: new LinearGradient(
                        colors: [
                          Theme.Colors.loginGradientEnd,
                          Theme.Colors.loginGradientStart
                        ],
                        begin: const FractionalOffset(0.2, 0.2),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Theme.Colors.loginGradientEnd,
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: "WorkSansBold"),
                        ),
                      ),
                      onPressed: ()  {
                        getdata();
                        
                      }  
                )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: "WorkSansMedium"),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.white10,
                            Colors.white,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white10,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Form(
      key: _formKeySignUp,
          child: Container(
        padding: EdgeInsets.only(top: 10.0,),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 360.0,
                    height:580.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            validator: validateName,
                            focusNode: myFocusNodeName,
                            controller: signupNameController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.black,
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                            ),
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            validator: validateMobile,
                            onChanged: (val)
                            {
                              this.phoneNumber=val;
                            },
                            focusNode: myFocusNodePhone,
                            controller: signupPhoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.phoneAlt,
                                color: Colors.black,
                              ),
                              hintText: "+923xxxxxxxxxxx",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                            ),
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(value: 1,groupValue: SelectedRadio,activeColor: Colors.black, onChanged: (val) {
                              setSelectedRadio(val);}),
                            Text("User"),
                            Radio(value: 2, groupValue: SelectedRadio,activeColor: Colors.black,  onChanged: (val) {
                              setSelectedRadio(val);                          }),
                            Text("Commettee"),
                            Radio(value: 3, groupValue: SelectedRadio,activeColor: Colors.black,  onChanged:  (val) {
                              setSelectedRadio(val);                          }),
                            Text("Imam"),
                          ],
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                          imam_feild(),
                          commette_feild(),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 10.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            validator: validateSignupPassword,
                            focusNode: myFocusNodePassword,
                            controller: signupPasswordController,
                            obscureText: _obscureTextSignup,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignup,
                                child: Icon(
                                  _obscureTextSignup
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            validator: (String value)
                            {
                              if(value != signupConfirmPasswordController.text)
                              {
                                return "Your Password & Confirm Password is not same";
                              }
                            },
                            controller: signupConfirmPasswordController,
                            obscureText: _obscureTextSignupConfirm,
                            style: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                              ),
                              hintText: "Confirmation",
                              hintStyle: TextStyle(
                                  fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignupConfirm,
                                child: Icon(
                                  _obscureTextSignupConfirm
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 550.0),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.Colors.loginGradientStart,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                      BoxShadow(
                        color: Theme.Colors.loginGradientEnd,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                    ],
                    gradient: new LinearGradient(
                        colors: [
                          Theme.Colors.loginGradientEnd,
                          Theme.Colors.loginGradientStart
                        ],
                        begin: const FractionalOffset(0.2, 0.2),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Theme.Colors.loginGradientEnd,
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0,),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: "WorkSansBold"),
                        ),
                      ),
                      onPressed: () async{ 
                        setState(() {
                          if(_formKeySignUp.currentState.validate())
                          {
                              verifyPhoneNumber(phoneNumber);
                              sendData();
                              uploadImage(context);
                              getCurrentUser();
                              
                          }
                        });
                      },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhoneNumber(phoneNumber) async
  {

    final PhoneVerificationCompleted verfied = (AuthCredential authResult)
    {
      AuthServices().signIn(authResult);
    };

    final PhoneVerificationFailed verifivationFailed = (AuthException authException)
    {
      print('${authException.message}');
    };


    Future<bool> smsCodeDialog(BuildContext context)
    {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return new AlertDialog(
            title: Text("Enter SMS Code"),
            content: TextField(
              onChanged: (value)
              {
                this.smsCode=value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text("Verify"),
                onPressed: ()
                {
            AuthServices().signInWithOTPCode(smsCode, verificationId);
                },
              )
            ],
          );
        }
      );
    }

    final PhoneCodeSent smsSent = (String verId, [int forceResend])
    {
      this.verificationId=verId;
     // smsCodeDialog(context);
    };


    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId)
    {
      this.verificationId=verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber, 
      timeout: const Duration(seconds:5), 
      verificationCompleted: verfied, 
      verificationFailed: verifivationFailed, 
      codeSent: smsSent, 
      codeAutoRetrievalTimeout: autoTimeout
      );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }
}