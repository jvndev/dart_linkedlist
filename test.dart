import 'dart:io';

import 'LinkedList.dart';

// Doesn't work with dart's ECMA regex engine :(
//const inputRegex = r'^([a|i|r]):(?(?<=i:)(\d+)|()):(\d+)$';
// Still have to do async
final LinkedList<int> linkedList = new LinkedList();

void main() {
  String? input;

  while ((input = stdin.readLineSync()?.trim()) != 'q') {
    if (input == null) return;

    final [action, opVal, val] = input.split(':');
    final int? intVal = val != '' ? int.parse(val) : null;
    final int? intOpVal = opVal != '' ? int.parse(opVal) : null;

    switch (action) {
      case 'add' || 'remove':
        if (intVal == null) break;

        if (action == 'add') linkedList.add(intVal);
        if (action == 'remove') linkedList.remove(intVal);
        break;
      case 'before' || 'after':
        if (intVal == null || intOpVal == null) break;

        if (action == 'before') linkedList.insertBefore(intOpVal, intVal);
        if (action == 'after') linkedList.insertAfter(intOpVal, intVal);
        break;
      case 'clear':
        linkedList.clear();
        break;
      default:
        print('???');
        continue;
    }

    String prefix = "$action($intOpVal, $intVal)";
    print("$prefix: ${linkedList.length() > 0 ? linkedList : 'empty'}");
  }
}
