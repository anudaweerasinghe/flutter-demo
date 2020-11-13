import 'package:flutter/material.dart';
import 'course_model.dart';
import 'dart:async';
import 'api.dart';


class HomeScreen extends StatefulWidget{

  @override
  _HomeScreenState createState() => new _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  TextEditingController textController = new TextEditingController();

  Course courseData = new Course();


  bool dataLoaded = false;

  _onPressSearch() async{


    String courseId = textController.text;
    print(courseId);


    courseData = await getCourse(courseId);

    setState(() {
      dataLoaded = true;
    });
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "ScottyLabs Course Search",
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
            TextField(
                keyboardType: TextInputType.number,
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter Course Number',
                ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            ),
            RaisedButton(
              onPressed: _onPressSearch,
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Container(
                width: double.infinity,
                child: Text(
                  "SEARCH",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            ),
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
                      dataLoaded?courseData.name:"",
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
                        dataLoaded?courseData.department:"",
                      style: new TextStyle(
                          fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    ),
                    Text(
                      "Prerequisites: "+ (dataLoaded?courseData.prereqs.toString():"")
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    ),
                    Text(
                        dataLoaded?courseData.desc:""
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