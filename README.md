# Style
https://dart.dev/effective-dart/style

# `flutter doctor`
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
