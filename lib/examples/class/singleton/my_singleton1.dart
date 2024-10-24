/// https://stackoverflow.com/a/12649574/10867055
class MySingleton1 {
  factory MySingleton1() => _singleton;
  MySingleton1._();
  static final _singleton = MySingleton1._();
  final initializedAt = DateTime.now();
}

void main() {
  print(MySingleton1() == MySingleton1()); // true
  print(MySingleton1().initializedAt);
  print(MySingleton1().initializedAt); // prints the same timestamp as above.
}
