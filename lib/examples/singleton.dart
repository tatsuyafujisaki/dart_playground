class Singleton {
  factory Singleton() => _singleton;
  Singleton._internal();
  static final Singleton _singleton = Singleton._internal();
}

void main() {
  final s1 = Singleton();
  final s2 = Singleton();
  print(identical(s1, s2)); // true
  print(s1 == s2); // true
}
