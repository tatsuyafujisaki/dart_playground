# Ensure that your packages depend on the freshest versions of packages when possible.
> Be proactive in managing your dependencies. Ensure that your packages depend on the freshest versions of packages when possible. If your package depends on a stale package, that stale package may depend on other stale packages in its dependency tree. Stale versions of packages can have a negative impact on the stability, performance, and quality of your app.

https://dart.dev/tools/pub/dependencies#best-practices

# Don't commit generated files.
- https://dart.dev/guides/libraries/private-files
  - > don’t include most of the files that your IDE or code editor, the pub tool, and other tools generate.
  - > In many source code repositories, the common practice is not to commit generated files, at all.

# Effective Dart
- https://dart.dev/effective-dart/design#prefer-putting-the-most-descriptive-noun-last
  - > PREFER putting the most descriptive noun last

# Use A rather than B for simplicity
A|B|Note
--|--|--
VoidCallback|void Function()|Use https://api.flutter.dev/flutter/dart-ui/VoidCallback.html in Flutter.<br>Use https://api.dart.dev/stable/dart-html/VoidCallback.html in Dart.
