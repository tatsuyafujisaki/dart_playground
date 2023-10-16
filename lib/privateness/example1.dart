final _myTopPrivateLevelVariable = '_myTopPrivateLevelVariable';
final myTopLevelPublicVariable = 'myTopLevelPublicVariable';

class MyClass {
  final _myPrivateVariable = '_myPrivateVariable';
  final myPublicVariable = 'myPublicVariable';

  void _myPrivateMethod() {
    print('_myPrivateMethod');
  }

  void myPublicMethod() {
    print('myPublicMethod');
  }
}

void main() {
  // Top-level private variables are only accessible from within the same file.
  print(_myTopPrivateLevelVariable);
  print(myTopLevelPublicVariable);

  final myClass = MyClass();
  // Private  variables can only be accessed from the same file.
  print(myClass._myPrivateVariable);
  print(myClass.myPublicVariable);
  myClass
    .._myPrivateMethod()
    ..myPublicMethod();
}
