import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scout_guid/Create_Login.dart';
import 'package:scout_guid/Home_Dashboard.dart';
import 'package:scout_guid/Sign_In.dart';
import 'package:scout_guid/home_sign_widget.dart';

class menu_frame extends StatelessWidget {
  PageController pageController = PageController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(

      child: Container( height : MediaQuery.of(context).size.height  ,

        child: SafeArea(

          child: Padding(

            padding: const EdgeInsets.symmetric (
                horizontal: 30.0, vertical: 30),

            child: Column(children:
            [
              Expanded(
                flex:1,
                child: AspectRatio(aspectRatio:0.8, child: Image(image: AssetImage('assets/Scout.png'),
                ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Expanded(
                flex: 2,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    HomeSignInWidget(
                      GoToSignUp: (){
                        pageController.animateToPage(1, duration: Duration(milliseconds: 180), curve: Curves.easeIn);
                      },
                      GoToSignIn:(){
                        pageController.animateToPage(2, duration: Duration(milliseconds: 180), curve: Curves.easeIn);
                      } ,),
                    CreateLogin(
                      cancelBackToHome: (){
                        pageController.animateToPage(0,
                            duration: Duration(
                                milliseconds: 180),
                            curve: Curves.easeIn);
                      },),
                    SignIn(
                      BackToSignUp: (){
                        pageController.animateToPage(0,
                            duration: Duration(
                                milliseconds: 180),
                            curve: Curves.easeIn);
                      },
                    ),
                  ],
                ),
              ),
                Positioned(child: RaisedButton(
                  onPressed: () {
                   Navigator.pushReplacement(context,
                       PageRouteBuilder(
                         transitionDuration: Duration(seconds: 2),
                           transitionsBuilder: (context,animation,animationTime,child){
                           animation = CurvedAnimation(
                             parent: animation,curve: Curves.elasticOut
                           );
                           return ScaleTransition(
                               alignment:Alignment.center,
                               scale: animation,
                           child: child,);
                           } ,

                       pageBuilder:  (context,animation,animationTime){
                           return HomeDashboard();
                    },
                       )
                    );
                  },
                  child: Text('Skip',style: TextStyle(color: Colors.white),),
                  color: Colors.deepPurple.shade900,

                ),)
            ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white,
          Colors.deepPurple.shade900],
        )),
      ),

    );

  }
}
