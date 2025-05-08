import 'package:dsa_dart/data_staructures/list/linked_list/linked_list.dart';

void main() {
  final list = LinkedList<int>();

  print('Initial list: $list');
  print('Initial length: ${list.length}');

  list.add(10);
  print('After adding 10: $list');

  list.add(1);
  list.add(3);
  list.insert(1, 2);
  print('After inserting 2 at index 1: $list');

  final removed = list.removeAt(1);
  print('Removed element at index 1: $removed');
  print('After removal: $list');

  list.add(5);
  print('List contains 5: ${list.contains(5)}');
  print('List contains 6: ${list.contains(6)}');

  list.add(7);
  list.add(8);
  print('Index of 8: ${list.indexOf(8)}');
  print('Index of 9: ${list.indexOf(9)}');

  list.clear();
  print('After clearing the list: $list');

  list.add(1);
  list.add(2);
  list[1] = 20;
  print('After setting index 1 to 20: $list');

  final list2 = LinkedList<int>();
  list.add(1);
  list.add(2);
  list2.add(3);
  list2.add(4);
  final combined = list + list2;
  print('Combined list: $combined');

  list.add(1);
  list.add(2);
  list.add(3);
  final newList = list - 2;
  print('List after removing 2: $newList');

  list.clear();
  list.add(1);
  list.add(2);
  list.add(3);
  list.add(4);

  final List<int> result = [];
  list.forEach((element) {
    result.add(element * 10);
  });
  print('Result after forEach: $result');

  final mapped = list.map((element) => element * 2);
  print('Mapped list: $mapped');

  final filtered = list.where((element) => element % 2 == 0);
  print('Filtered list (even numbers): $filtered');
}