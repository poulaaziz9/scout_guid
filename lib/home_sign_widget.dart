import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class  HomeSignInWidget extends StatelessWidget {
  final Function GoToSignUp;
  final Function GoToSignIn;
  HomeSignInWidget({this.GoToSignUp,this.GoToSignIn});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 15.0,)
          ,
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.facebookF,
                color: Colors.purple.shade900,
                size: 20.0,
              ),
              Text(' | Sing In With Facebook',
                style: TextStyle(color: Colors.purple.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),)
            ],
          ),
        ),
        SizedBox(
          height: 25.0,
        ),

        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,)
          ,
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.twitter,
                color: Colors.purple.shade900,
                size: 30.0,
              ),
              Text(' | Sign In With Twitter ',
                style: TextStyle(color: Colors.purple.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),)
            ],
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        InkWell(
          onTap: (){
            GoToSignUp();
          },
          child : Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,)
            ,
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(30.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(' Sign Up ',
                  style: TextStyle(color: Colors.purple.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        InkWell(
          onTap: (){
            GoToSignIn();
          },
          child :
          Text('AlReady Registered ?   Sign In ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),),
        ),

      ],

    );
  }
}
