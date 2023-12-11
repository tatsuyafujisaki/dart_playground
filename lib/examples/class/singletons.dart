// https://stackoverflow.com/a/55348216

/// Singleton by factory constructor
class _Singleton1 {
  factory _Singleton1() => _instance;
  _Singleton1._privateConstructor();
  static final _instance = _Singleton1._privateConstructor();
}

/// Singleton by static field
class _Singleton2 {
  _Singleton2._privateConstructor();
  static final instance = _Singleton2._privateConstructor();
}

/// Singleton by static getter
class Singleton3 {
  Singleton3._privateConstructor();
  static final _instance = Singleton3._privateConstructor();
  static Singleton3 get instance => _instance;
}

void main() {
  print(_Singleton1() == _Singleton1());
  print(_Singleton2.instance == _Singleton2.instance);
  print(Singleton3.instance == Singleton3.instance);
}
