# jsonEncode
- https://api.flutter.dev/flutter/dart-convert/jsonEncode.html
  - > If toEncodable is omitted, it defaults to a function that returns the result of calling .toJson() on the unencodable object.

# Freezed
- https://pub.dev/packages/freezed#run-the-generator
  - > CONSIDER also importing `package:flutter/foundation.dart`. The reason being, importing `foundation.dart` also imports classes to make an object nicely readable in Flutter's devtool. If you import foundation.dart, Freezed will automatically do it for you.
- https://pub.dev/packages/freezed#creating-a-model-using-freezed
  - > Since we defined a `fromJson`, this class is de/serializable. Freezed will add a `toJson` method for us.
