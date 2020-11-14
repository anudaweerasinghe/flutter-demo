class Course{

  String name;
  List<dynamic> prereqs;
  String desc;
  String department;
  String courseID;

  Course({
    this.name,
    this.prereqs,
    this.desc,
    this.department,
    this.courseID
  });

  factory Course.fromJson(Map<String, dynamic> json){
    return new Course(
      name: json['name'],
      prereqs: json['prereqs'],
      desc: json['desc'],
      department: json['department'],
      courseID: json['courseID']
    );
  }

}