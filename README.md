# Function
## Function with optional parameters (= parameters in square brackets)
```kotlin
// b and c are optional parameters, where c has a default value.
void f(String a, [String? b, String? c = 'c']) {}

void main() {
  f('a');
  f('a', 'b');
  f('a', 'b', 'c');
}
```

## Function with named optional parameters (= parameters in curly braces)
```kotlin
// b and c are named optional parameters, where c has a default value.
void f(String a, {String? b, String? c = 'c'}) {}

void main() {
  f('a');
  f('a', b: 'b');
  f('a', b: 'b', c: 'c');
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

# Cocoapods
## How to install the specific version of Cocoapods
```shell
sudo gem install cocoapods --version <verison>
```

## How to show the installed version of Cocoapods
```shell
sudo gem list cocoapods
```
