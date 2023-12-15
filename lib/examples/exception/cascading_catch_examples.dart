class _MyException implements Exception {}

void f() {
  try {
    throw _MyException();
  } on _MyException {
    rethrow;
  } on Exception catch (e) {
    print('Caught in f(): $e');
  }
}

void main() {
  try {
    f();
  } on Exception catch (e) {
    print('Caught in main(): $e');
  }
}
