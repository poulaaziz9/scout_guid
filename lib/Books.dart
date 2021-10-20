import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';


import 'dart:convert';

class Books extends StatefulWidget{
  @override
  _BooksSate createState() => _BooksSate();
}
class _BooksSate extends State<Books> {

  final Stream<QuerySnapshot> _booksStream = FirebaseFirestore.instance.collection('Books').snapshots();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Books',
          style: TextStyle(color: Colors.white),
          ),
        centerTitle: true,
        backgroundColor:  Colors.deepPurple.shade900,
      ),
     body: StreamBuilder<QuerySnapshot>(
       stream: _booksStream,

       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         if (snapshot.hasError) {
           return Text('Something went wrong');
         }

         if (snapshot.connectionState == ConnectionState.waiting) {
           return Text("Loading");
         }

         return new ListView(
           children: snapshot.data.docs.map((DocumentSnapshot document) {
             Map<String, dynamic> data = document.data() as Map<String, dynamic>;
             return new ListTile(
               leading: Image.network(data['img']),
               title: Text(data['name']),
               subtitle: Text(data['detail']),

             );
           }).toList(),
         );
       },
     ),
    );
  }
}
