import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'course_model.dart';

const baseUrl = "apis.scottylabs.org";

Future<Course> getCourse(String courseId) async{

  print(courseId);

  Map<String, String> headers = {"Content-type": "application/json"};
  final jsonRequest =  {
    'courseID': courseId,
  };

  final uri = Uri.http(baseUrl, '/course/courses',jsonRequest);

  final response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    Course course;

    var data = json.decode(response.body) as List;

    List<Course> courseList = data.map<Course>((json)=>Course.fromJson(json)).toList();;


    course = courseList[0];
    return course;
  }else{
    return null;
  }

}