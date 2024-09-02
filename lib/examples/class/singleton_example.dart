// https://stackoverflow.com/a/55348216

class _MySingleton1 {
  factory _MySingleton1() => _instance;
  _MySingleton1._privateConstructor();
  static final _instance = _MySingleton1._privateConstructor();
}

class _MySingleton2 {
  _MySingleton2._privateConstructor();
  static final instance = _MySingleton2._privateConstructor();
}

void main() {
  print(_MySingleton1() == _MySingleton1()); // true
  print(_MySingleton2.instance == _MySingleton2.instance); // true
}
