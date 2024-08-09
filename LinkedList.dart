class Node<E> {
  late E val;
  Node<E>? next;

  Node.lastNode(E val) {
    this.val = val;
  }

  Node.middleNode(E val, Node<E>? next) {
    this.val = val;
    this.next = next;
  }
}

class LinkedList<E> {
  Node<E>? head;

  Node<E> _add(E val, Node<E>? node) {
    if (node == null) return Node.lastNode(val);

    node.next = _add(val, node.next);

    return node;
  }

  void add(E val) {
    head = _add(val, head);
  }

  Node<E>? _insertBefore(E before, E val, Node<E>? node) {
    if (node == null) return null;
    if (node.val == before) return Node.middleNode(val, node);

    node.next = _insertBefore(before, val, node.next);

    return node;
  }

  void insertBefore(E before, E val) {
    this.head = this._insertBefore(before, val, this.head);
  }

  Node<E>? _insertAfter(E after, E val, Node<E>? node) {
    if (node == null) return null;
    if (node.val == after) {
      node.next = Node.middleNode(val, node.next);

      return node;
    }

    node.next = _insertAfter(after, val, node.next);

    return node;
  }

  void insertAfter(E after, E val) {
    this.head = this._insertAfter(after, val, this.head);
  }

  Node<E>? _remove(E val, Node<E>? node) {
    if (node == null) return null;
    if (val == node.val) return node.next;

    node.next = _remove(val, node.next);

    return node;
  }

  void remove(E val) {
    this.head = _remove(val, this.head);
  }

  int _length(Node<E>? node) {
    return node == null ? 0 : _length(node.next) + 1;
  }

  int length() {
    return this._length(this.head);
  }

  void clear() {
    this.head = null;
  }

  String _toString(Node<E>? node) {
    return node == null ? '' : "${node.val} ${_toString(node.next)}";
  }

  @override
  String toString() {
    return _toString(this.head);
  }
}
