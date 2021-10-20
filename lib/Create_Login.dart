import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scout_guid/Home_Dashboard.dart';



class CreateLogin extends StatefulWidget {
  final Function cancelBackToHome;

  CreateLogin({this.cancelBackToHome});
  @override
  _CreateLoginState createState() => _CreateLoginState();
}

class _CreateLoginState extends State<CreateLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email , password , RePassword  ;
  bool _termsAgreed = false;
  bool saveAttempted = false;
  final formkey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  void _CreateUser({String mail,pw})
  {
    _auth.createUserWithEmailAndPassword(email: mail, password: pw).then((authResult) {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return HomeDashboard();
        }));
    }).catchError((err){
      print(err.code);
      if(err.code == 'email-already-in-use')
      {
          showCupertinoDialog(context: context, builder: (context) {
            return CupertinoAlertDialog(title: Text('This Mail already has an account '),actions: [
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
    return Form(
      key: formkey,
      child: Column(
        children: [
          Text('Create Your Login ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            // ignore: deprecated_member_use
            autovalidate: saveAttempted,
            onChanged: (textValue){
              setState(() {
                email = textValue ;
              });
            },

            validator: (emailValue) {
              if (emailValue.isEmpty)
               { return'This field is Empty';}

              String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                  "\\@" +
                  "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                  "(" +
                  "\\." +
                  "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                  ")+";
              RegExp regExp = new RegExp(p);

              if (regExp.hasMatch(emailValue)) {
                // So, the email is valid
                return null;
              }

              return 'This is not a valid email';
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(
                  color: Colors.white),
              enabledBorder : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white)
              ), hintText: 'Enter E-Mail : ',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              focusColor: Colors.white,),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            // ignore: deprecated_member_use
            autovalidate: saveAttempted,
            onChanged: (textValue){
              setState(() {
                password = textValue ;
              });
            },
            validator: (pwValue) {
              if (pwValue.isEmpty)
              { return'This field is Empty';}
              if(pwValue.length < 8)
                {return 'Password Must Be at least 8 Characters';}
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              errorStyle: TextStyle(
                  color: Colors.white),
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
          TextFormField(
            // ignore: deprecated_member_use
            autovalidate: saveAttempted,
            onChanged: (textValue){
              setState(() {
                RePassword= textValue ;
              });
            },
            validator: (pwReValue) {
              if (pwReValue != password)
              { return'Passwords Must Match';}
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              errorStyle: TextStyle(
                  color: Colors.white),
              enabledBorder : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white)
              ), hintText: ' Re-Password : ',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
              focusColor: Colors.white,),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [Checkbox(
              activeColor: Colors.deepPurple,
              value: _termsAgreed,
              onChanged: (newvalue){
                setState(() {
                  _termsAgreed = newvalue;
                });
              },),
              SizedBox(
                height: 20.0,
              ),
              Text('Agreed To Terms & Conditions',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0 ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              InkWell(
                onTap: (){
                  widget.cancelBackToHome();
                },
                child : Text('Cancel',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              SizedBox(
                width: 100,
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    saveAttempted = true;
                  });

                  if(formkey.currentState.validate())
                    { formkey.currentState.save();
                    _CreateUser(mail: email , pw: password);
                    }
                },
                child : Container(
                padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 34.0
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Text('Save',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              ),
            ],)
        ],
      ),
    );
  }
}
