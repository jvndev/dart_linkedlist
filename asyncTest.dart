import 'dart:math';

Future<int> fn(int id, Random rnd) async {
  await Future.delayed(Duration(seconds: rnd.nextInt(3)));

  return id;
}

void main() {
  Random rnd = new Random();
  for (int i = 0; i < 10; i++) {
    fn(i, rnd).then((id) => print("$id done"));
  }
}
