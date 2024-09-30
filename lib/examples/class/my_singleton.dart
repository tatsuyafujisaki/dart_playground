/// https://stackoverflow.com/a/12649574/10867055
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
