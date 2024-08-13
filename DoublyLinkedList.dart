import 'OwnList.dart';

class Node<E> {
  Node<E>? prev;
  Node<E>? next;
  late E val;

  Node(E val) {
    this.val = val;
  }

  Node<E> setPrev(Node<E> prev) {
    this.prev = prev;

    return this;
  }

  Node<E> setNext(Node<E> next) {
    this.next = next;

    return this;
  }
}

class DoublyLinkedList<E> extends OwnList<E> {
  Node<E>? head, tail;

  Node<E> _add(E val, Node<E>? node) {
    if (node == null) return tail = Node(val);

    return node.setNext(_add(val, node.next).setPrev(node));
  }

  @override
  void add(E val) {
    this.head = _add(val, this.head);
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  void insertAfter(E after, E val) {
    // TODO: implement insertAfter
  }

  @override
  void insertBefore(E before, E val) {
    // TODO: implement insertBefore
  }

  int _length(Node<E>? node) {
    if (node == null) return 0;

    return 1 + _length(node.next);
  }

  @override
  int length() {
    return _length(this.head);
  }

  @override
  void remove(E val) {
    // TODO: implement remove
  }

  String _toString(Node<E>? node, bool forward) {
    return node == null
        ? ''
        : "${node.val} ${_toString(forward ? node.next : node.prev, forward)}";
  }

  @override
  String toString() {
    String forward = _toString(this.head, true);
    String backward = _toString(this.tail, false);

    return "->$forward:$backward<-";
  }
}
