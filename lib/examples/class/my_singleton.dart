// https://stackoverflow.com/a/55348216

class MySingleton {
  factory MySingleton() => _singleton;
  MySingleton._privateConstructor();
  static final _singleton = MySingleton._privateConstructor();
  final initializedAt = DateTime.now();
}

void main() {
  print(MySingleton() == MySingleton()); // true
  print(MySingleton().initializedAt);
  print(MySingleton().initializedAt);
}
