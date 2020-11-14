import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'course_model.dart';

const baseUrl = "https://apis.scottylabs.org/course/";

Future<Course> getCourse(String courseId) async{

  print(courseId);

  String url = baseUrl + "courses/courseID/"+courseId;

  Map<String, String> headers = {"Content-type": "application/json"};


  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    Course course;


    var data = json.decode(response.body);

    course = new Course.fromJson(data);

    return course;
  }else{
    return null;
  }

}