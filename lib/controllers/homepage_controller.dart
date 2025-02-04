import '../models/child.dart';

class ChildController {
  List<Child> children = [];
  final List<int> availableNumbers = [for (var i = 1; i <= 100; i++) i];
  void addChild(Child child) {
    availableNumbers.removeWhere(
        (number) => children.any((child) => child.number == number));
    child.number = availableNumbers.removeAt(0);
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

  void deleteChild(int index) {
    int availableNumber = children[index].number;
    availableNumbers.add(availableNumber);
    availableNumbers.sort(null);
    children.removeAt(index);
  }

  void setChildren(List<Child> childrenList) {
    children = childrenList;
  }
}
