
class Child {
  String name;
  int age;
  int timeLeft; // in minutes
  int totalReserved; // in minutes
  DateTime dateTimeReserved;
  late int number;

  Child({
    required this.name,
    required this.age,
    required this.totalReserved,
    this.timeLeft = 0, // Default value
    DateTime? dateTimeReserved, // Make this parameter optional
    this.number = 0, // Default value for number
  }) : dateTimeReserved = dateTimeReserved ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'timeLeft': timeLeft,
      'totalReserved': totalReserved,
      'dateTimeReserved': dateTimeReserved.toIso8601String(),
      'number': number,
    };
  }

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      name: json['name'],
      age: json['age'],
      totalReserved: json['totalReserved'],
      timeLeft: json['timeLeft'],
      dateTimeReserved: DateTime.parse(json['dateTimeReserved']),
      number: json['number'],
    );
  }

  void updateTimePassed() {
    if (timeLeft > 0) {
      DateTime now = DateTime.now();
      Duration difference = now.difference(dateTimeReserved);
      timeLeft = totalReserved - difference.inMinutes;
      if (timeLeft < 0) {
        timeLeft = 0;
      }
    }
  }
}
