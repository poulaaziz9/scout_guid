
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scout_guid/Books.dart';
import 'package:scout_guid/Books.dart';
import 'package:scout_guid/Compass.dart';

class HomeDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size ;
    return Scaffold(
      body: Stack(

          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,


              child:
            Container(

              height: size.height*0.4,
              decoration: BoxDecoration(

                  image: DecorationImage(

                    alignment: Alignment.topCenter,
                    image:  AssetImage('assets/scoutlogo.png'),

                  ),
              ),
            ),
            ),
            Positioned(
              top: 170,

                child:Container(
                  height: 500 ,
                  width: MediaQuery.of(context).size.width-40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,

                  ),
                    ],
            ),
                  child: GridView.count(

                    mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                    children: [
                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.deepPurple,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                       Image(image: AssetImage('assets/logobooks.png'),width: 70, fit: BoxFit.fill ,),

                            ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  FlatButton(
                                    child: Text('Books',style: TextStyle(  color: Colors.white)),
                                    onPressed: () {
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Books()));
                                    },
                                  ),

                                ],
                            ),
                          ],
                        ),
                        ),
                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.deepPurple,
                        child: Column(
                          children: [
                            Image(image: AssetImage('assets/staricon.png'),width: 70, fit: BoxFit.fill ,),
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  child: Text('favourite', style: TextStyle(  color: Colors.white)) ,
                                  onPressed: () {},

                                ),
                              ],
                            ),
                          ],

                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.deepPurple,
                        child:

                        Column(

                          children: [

                            Image(image: AssetImage('assets/compass.png'),width: 75, fit: BoxFit.fill ,),

                        FlatButton(
                         child: Text('Compass', style: TextStyle(  color: Colors.white)) ,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Compass()));
                          },
                        ),

                ],

                        ),
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Colors.deepPurple,
                        child:

                        Column(

                          children: [

                            Image(image: AssetImage('assets/compass.png'),width: 75, fit: BoxFit.fill ,),

                            FlatButton(
                              child: Text('Note', style: TextStyle(  color: Colors.white)) ,
                              onPressed: () {},
                            ),

                          ],

                        ),
                      ),
                      ],
                  ),

                  ),
                ),
           Positioned(
            top: 690,
             right: 0,
             left: 0,
             child: Column(

               children: [

                 Image(image: AssetImage('assets/BLUE.png'),width: 100, fit: BoxFit.fill ,),
               ],
               ),
           ),


          ],
      ),
    );
  }
}
