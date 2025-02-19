class _MyAsyncConstructorClass {
  _MyAsyncConstructorClass._(this.data);
  final String data;

  static Future<_MyAsyncConstructorClass> create() async {
    final data = await Future<String>.value('🍎');
    return _MyAsyncConstructorClass._(data);
  }
}

void main() async {
  final myClass = await _MyAsyncConstructorClass.create();
  print(myClass.data); // 🍎
}
