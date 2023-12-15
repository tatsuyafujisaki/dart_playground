class _MyException implements Exception {}

void _f() {
  try {
    throw _MyException();
  } on _MyException {
    // Lets the caller catch _MyException.
    // Does not let "on Exception catch(e)" catch _MyException.
    rethrow;
  } on Exception catch (e) {
    print('Caught in _f(): $e');
  }
}

void main() {
  try {
    _f();
  } on Exception catch (e) {
    print('Caught in main(): $e');
  }
}
