import '../models/child.dart';

class ChildController {
  final List<Child> children = [];

  void addChild(Child child) {
    children.add(child);
  }

  void editChild(int index, Child updatedChild) {
    children[index] = updatedChild;
  }

  void updateTimes() {
    for (var child in children) {
      child.updateTimePassed();
    }
    children.sort((a, b) => a.timeLeft.compareTo(b.timeLeft));
  }

}
