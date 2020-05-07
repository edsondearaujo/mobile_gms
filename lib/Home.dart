import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _image;

  Future _recoverImage(bool cam) async{

    File selectedImage;
    if(cam){
      selectedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    }

    setState(() {
      _image = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3f3f95),
        appBar: AppBar(
          title: Text("Mobile_GMS",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF008d35)
            ),
          ),
          backgroundColor: Color(0xFF3f3f95),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              color: Color(0xFF008d35),
              onPressed: (){
                _recoverImage(true);
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              color: Color(0xFF008d35),
              onPressed: (){},
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF3f3f95),
            border: Border.all(width: 3, color: Color(0xFF008d35)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                            hintText: 'image name'
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              
              //
              _image == null
              ? Container(
                child:
                  Image.asset("images/logo.png",
                  )
                )
                : Image.file(_image),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const MaterialButton(onPressed: null,
                    child: Text('Back',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF008d35),
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const MaterialButton(onPressed: null,
                        child: Text('Next',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF008d35),
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      )

                    ],
                  )
                ],
              ),
          ]
          ),
        )
    );
  }
}
