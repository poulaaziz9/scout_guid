
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scout_guid/Home_Dashboard.dart';

class SignIn extends StatefulWidget {

  final Function BackToSignUp;

  SignIn({this.BackToSignUp});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email,password;
  bool _rememberpassword = false;


  void _signIn({String em,pw}){
    _auth.signInWithEmailAndPassword(email: em, password: pw).then((authResult) {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeDashboard();
      }));
    }).catchError((err){
      print(err.code);
      if(err.code == 'wrong-password')
      {
        showCupertinoDialog(context: context, builder: (context) {
          return CupertinoAlertDialog(title: Text('The Password Was Incorrect ,  Please Try Again  '),actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed:(){
                Navigator.pop(context);
              } ,)
          ],);
        });
      }
      if(err.code == 'user-not-found')
          {
            showCupertinoDialog(context: context, builder: (context) {
              return CupertinoAlertDialog(title: Text('The User Was Incorrect ,  Please Try Again  '),actions: [
                CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed:(){
                    Navigator.pop(context);
                  } ,)
              ],);
            });
          }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(' Sign In  ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (textval){
              setState(() {
                email = textval;
              });
            },
          //  controller: _emailControl ,
            decoration: InputDecoration(
              enabledBorder : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white)
              ), hintText: 'Enter Your Name : ',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              focusColor: Colors.white,),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (textval){
              setState(() {
                password = textval;
              });
            },
           // controller: _passwordControl ,
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white)
              ), hintText: 'Password : ',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              focusColor: Colors.white,),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20),
          ),

          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Checkbox(
                activeColor: Colors.deepPurple,
                value: _rememberpassword,
                onChanged: (newvalue){
                  setState(() {
                    _rememberpassword = newvalue;
                  });
                },),
              Text('Remember Password',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0 ),
              ),

              SizedBox(
                width: 20.0,
              ),
              Text('Forgot Password ?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    decoration: TextDecoration.underline),),

            ],
          ),

          SizedBox(
            height: 10.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              InkWell(
                onTap: (){
                  _signIn(em: email,pw: password);
                },
             child: Container(

                padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 110.0
                ),
                decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)),

                child :Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('LOGIN',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)
                ),
                    ],
                ),

              ),
              ),
            ],),
          SizedBox(
            height: 30,
          ),


          InkWell(
              onTap: (){
                widget..BackToSignUp();
              },
              child:
              Text('Don\'t have An Account ? Sign Up  ?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),)
          ),

        ],

      ),

    );
  }

}
