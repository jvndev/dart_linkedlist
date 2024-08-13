abstract class OwnList<E> {
  void add(E val);
  void remove(E val);
  void insertBefore(E before, E val);
  void insertAfter(E after, E val);
  int length();
  void clear();
}
