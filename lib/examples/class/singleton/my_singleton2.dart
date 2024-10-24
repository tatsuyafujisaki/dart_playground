/// https://stackoverflow.com/a/12649574/10867055
class MySingleton2 {
  factory MySingleton2() {
    if (!initialized) {
      initialized = true;
      Future.delayed(
        Duration.zero,
        () async {
          // Do something asynchronous.
        },
      );
    }
    return _singleton;
  }
  MySingleton2._();
  static final _singleton = MySingleton2._();
  static bool initialized = false;
  final initializedAt = DateTime.now();
}

void main() {
  print(MySingleton2() == MySingleton2()); // true
  print(MySingleton2().initializedAt);
  print(MySingleton2().initializedAt); // prints the same timestamp as above.
}
