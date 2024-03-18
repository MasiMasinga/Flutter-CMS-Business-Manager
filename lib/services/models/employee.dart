class Employee {
  final String name;
  final String role;
  final String department;

  Employee({required this.name, required this.role, required this.department});

  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        role = json['role'],
        department = json['department'];
}
