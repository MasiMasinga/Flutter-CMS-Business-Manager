class Employee {
  final String id;
  final String name;
  final String role;
  final String department;

  Employee({required this.id, required this.name, required this.role, required this.department});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      department: json['department'],
    );
  }
}