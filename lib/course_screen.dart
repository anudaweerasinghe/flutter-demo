import 'package:flutter/material.dart';
import 'course_model.dart';
import 'dart:async';
import 'api.dart';

class CourseScreen extends StatefulWidget{

  final Course courseData;

  CourseScreen(
      {Key key, @required this.courseData})
      : super(key: key);


  @override
  _CourseScreenState createState() => new _CourseScreenState(courseData: courseData);

}

class _CourseScreenState extends State<CourseScreen> {

  final Course courseData;

  _CourseScreenState(
      {Key key, @required this.courseData});

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            courseData.courseID,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 3, 169, 244),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: ListView(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        courseData.name,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      ),
                      Text(
                        courseData.department,
                        style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      ),
                      Text(
                          "Prerequisites: "+ courseData.prereqs.toString()
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      ),
                      Text(
                          courseData.desc
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}