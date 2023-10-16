final _myTopPrivateLevelVariable = '_myTopPrivateLevelVariable';
final myTopLevelPublicVariable = 'myTopLevelPublicVariable';

class MyClass {
  final _myPrivateInstanceVariable = '_myPrivateInstanceVariable';
  final myPublicInstanceVariable = 'myPublicInstanceVariable';
}

void main() {
  // Top-level private variables are only accessible from within the same file.
  print(_myTopPrivateLevelVariable);
  print(myTopLevelPublicVariable);

  final myClass = MyClass();
  // Private instance variables can only be accessed from the same file.
  print(myClass._myPrivateInstanceVariable);
  print(myClass.myPublicInstanceVariable);
}
