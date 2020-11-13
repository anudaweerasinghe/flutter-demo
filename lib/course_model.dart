class Course{

  String name;
  List<dynamic> prereqs;
  String desc;
  String department;

  Course({
    this.name,
    this.prereqs,
    this.desc,
    this.department
  });

  factory Course.fromJson(Map<String, dynamic> json){
    return new Course(
      name: json['name'],
      prereqs: json['prereqs'],
      desc: json['desc'],
      department: json['department']
    );
  }

}