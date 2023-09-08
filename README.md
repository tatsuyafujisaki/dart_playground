# Function
## Function with required and optional unnamed (aka positional) parameters (= parameters in square brackets)
```dart
// a ia a required unnamed parameter.
// b is an optional unnamed parameter whose default value is null.
// c is an optional unnamed parameter with a default value.
void f(String a, [String? b, String c = 'c']) {}

void main() {
  f('a');
  f('a', 'b');
  f('a', 'b', 'c');
}
```

## Function with required and optional named parameters (= parameters in curly braces)
```dart
// a ia a required unnamed parameter.
// b ia a required named parameter.
// c is a optional named parameter whose default value is null.
// d is a optional named parameter with a default value.
void f(String a, {required String b, String? c, String d = 'c'}) {}

void main() {
  f('a', b: 'b');
  f('a', b: 'b');
  f('a', b: 'b', c: 'c');
  f('a', b: 'b', c: 'd');
}
```

# flutter doctor
## What if `flutter doctor` fails for the Android toolchain?
Run the following.
```shell
ln -s "/Applications/Android Studio.app" ~/Applications
```

## What if `flutter doctor` fails for Android Studio?
Run the following.
```shell
cd /Applications/Android Studio.app/Contents
ln -s jbr jre
```

## Can a function have both optional positional and named parameters?
No.

> A function can’t have both optional positional and named parameters.

https://dart.dev/codelabs/dart-cheatsheet#named-parameters

# Cocoapods
## How to install the specific version of Cocoapods
```shell
sudo gem install cocoapods --version <verison>
```

## How to show the installed version of Cocoapods
```shell
sudo gem list cocoapods
```
