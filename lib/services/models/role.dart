class Role {
  final String jobTitle;
  final String salary;
  final String department;

  Role(
      {required this.jobTitle, required this.salary, required this.department});

  Role.fromJson(Map<String, dynamic> json)
      : jobTitle = json['jobTitle'],
        salary = json['salary'],
        department = json['department'];
}
