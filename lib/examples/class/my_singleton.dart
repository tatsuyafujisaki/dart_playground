/// https://stackoverflow.com/a/12649574/10867055
class MySingleton {
  factory MySingleton() {
    Future.delayed(Duration.zero, () => print('Future.delayed is called.'));
    print('The constructor of MySingleton is called.');
    return _singleton;
  }
  MySingleton._privateConstructor();
  static final _singleton = MySingleton._privateConstructor();
  final initializedAt = DateTime.now();
}

void main() {
  print(MySingleton() == MySingleton()); // true
  print(MySingleton().initializedAt);
  print(MySingleton().initializedAt); // prints the same timestamp as above.
}
