// https://stackoverflow.com/a/55348216

/// Singleton by factory constructor
class Singleton1 {
  factory Singleton1() => _instance;
  Singleton1._privateConstructor();
  static final _instance = Singleton1._privateConstructor();
}

/// Singleton by static field
class Singleton2 {
  Singleton2._privateConstructor();
  static final instance = Singleton2._privateConstructor();
}

/// Singleton by static getter
class Singleton3 {
  Singleton3._privateConstructor();
  static final _instance = Singleton3._privateConstructor();
  static Singleton3 get instance => _instance;
}

void main() {
  print(Singleton1() == Singleton1());
  print(Singleton2.instance == Singleton2.instance);
  print(Singleton3.instance == Singleton3.instance);
}
