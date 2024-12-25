class Child {
  String name;
  int age;
  String picture;
  int timeLeft;
  int totalReserved;
  int timePassed;

  Child({
    required this.name,
    required this.age,
    required this.picture,
    required this.timeLeft,
    required this.totalReserved,
    required this.timePassed,
  });

  void updateTimePassed() {
    if (timeLeft > 0) {
      timePassed++;
      timeLeft = totalReserved - timePassed;
      timeLeft = timeLeft < 0 ? 0 : timeLeft;
    }
  }
}
