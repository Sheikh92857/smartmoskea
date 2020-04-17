import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_moskea/pages/BeforeLoggedInMainScreen.dart';
import 'package:smart_moskea/pages/loggedInMainScreen.dart';



class AuthServices
{
  handleAuth()
  {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder:(BuildContext context, snapshot)
        {
          if(snapshot.hasData)
          {
            return LoggedInMainScreen();
          }
          else
          {
             return BeforeLoggedInMainScreen();

          }
        }
      );    
  }


  final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

    Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    return result;
  }

  




 //SignOut
  signOut()
  {
    FirebaseAuth.instance.signOut();
  }


  
  //SignIN
  signIn(AuthCredential authCredential)
  {
     FirebaseAuth.instance.signInWithCredential(authCredential);
  }

  
  signInWithOTPCode(smsCode, verId)
  {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
      verificationId: verId, 
      smsCode: smsCode);
    signIn(authCredential);
  }
}