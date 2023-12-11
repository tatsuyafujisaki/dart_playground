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

void main() {
  print(_Singleton1() == _Singleton1()); // true
  print(_Singleton2.instance == _Singleton2.instance); // true
}
