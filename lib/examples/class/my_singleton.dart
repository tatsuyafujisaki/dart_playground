/// https://stackoverflow.com/a/12649574/10867055
class MySingleton {
  factory MySingleton() {
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
  MySingleton._();
  static final _singleton = MySingleton._();
  static bool initialized = false;
  final initializedAt = DateTime.now();
}

void main() {
  print(MySingleton() == MySingleton()); // true
  print(MySingleton().initializedAt);
  print(MySingleton().initializedAt); // prints the same timestamp as above.
}
