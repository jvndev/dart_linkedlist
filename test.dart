import 'dart:io';

import 'LinkedList.dart';
import 'DoublyLinkedList.dart';
import 'OwnList.dart';

// Doesn't work with dart's ECMA regex engine :(
//const inputRegex = r'^([a|i|r]):(?(?<=i:)(\d+)|()):(\d+)$';

List<String> checkArgs(List<String> args) {
  if (args.length == 0 || !['single', 'double'].contains(args[0]))
    throw new ArgumentError("Single or double flavor?");

  return args;
}

void main(List<String> args) {
  String? input;
  final OwnList<int> ownList = checkArgs(args)[0] == 'single'
      ? new LinkedList<int>()
      : new DoublyLinkedList<int>();

  while ((input = stdin.readLineSync()?.trim()) != 'q') {
    if (input == null) return;

    final [action, opVal, val] = input.split(':');
    final int? intVal = val != '' ? int.parse(val) : null;
    final int? intOpVal = opVal != '' ? int.parse(opVal) : null;

    switch (action) {
      case 'add' || 'remove':
        if (intVal == null) break;

        if (action == 'add') ownList.add(intVal);
        if (action == 'remove') ownList.remove(intVal);
        break;
      case 'before' || 'after':
        if (intVal == null || intOpVal == null) break;

        if (action == 'before') ownList.insertBefore(intOpVal, intVal);
        if (action == 'after') ownList.insertAfter(intOpVal, intVal);
        break;
      case 'clear':
        ownList.clear();
        break;
      default:
        print('???');
        continue;
    }

    String prefix = "$action($intOpVal, $intVal)";
    print("$prefix: ${ownList.length() > 0 ? ownList : 'empty'}");
  }
}
