import 'package:flutter/material.dart';
import 'course_model.dart';
import 'dart:async';
import 'api.dart';
import 'course_screen.dart';


class HomeScreen extends StatefulWidget{

  @override
  _HomeScreenState createState() => new _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  Color blue = Color.fromARGB(255, 3, 169, 244);

  TextEditingController textController = new TextEditingController();

  Course courseData = new Course();

  bool loading = false;



  _onPressSearch() async{

    setState(() {
      loading = true;
    });
    String courseId = textController.text;
    print(courseId);


    courseData = await getCourse(courseId);

    setState(() {
      loading = false;
    });
    if(courseData == null){
      _showDialog("We couldn't find a course with the ID "+courseId);
    }else{
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (ctxt) => new CourseScreen(courseData: courseData)),
      );
    }
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
        backgroundColor: blue,
      ),
      body: Padding(
          padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              color: loading?blue:Colors.redAccent,
              textColor: Colors.white,
              child: Container(
                width: double.infinity,
                child: Text(
                  loading?"LOADING...":"SEARCH",
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
          ],
        ),
      )
    );
  }

  void _showDialog(String response) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Course Not found"),
          content: new Text(response),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK", style: new TextStyle(color: Colors.white),),
              color: new Color.fromARGB(255, 255, 75, 43),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}