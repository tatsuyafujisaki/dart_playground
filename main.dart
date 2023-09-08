// a ia a required named parameter.
// b is an optional named parameter whose default value is null.
// c is an optional named parameter with a default value.
class MyClass {
  String a;
  String? b;
  String c;

  MyClass(this.a, {this.b, this.c = 'c'});

  @override
  String toString() {
    return 'a = $a, b = $b, c = $c';
  }
}

void main() {
  final myClass1 = MyClass('a');
  final myClass2 = MyClass('a', b: 'b');
  final myClass3 = MyClass('a', b: 'b', c: 'c');

  print(myClass1);
  print(myClass2);
  print(myClass3);
}
