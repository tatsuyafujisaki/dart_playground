# ProviderContainer versus ProviderScope
- [ProviderContainer](https://pub.dev/documentation/riverpod/latest/riverpod/ProviderContainer-class.html) is for a non-Flutter application and is equivalent to [ProviderScope](https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/ProviderScope-class.html) in a Flutter application.
  - https://youtu.be/BJtQ0dfI-RA?t=973

# Which type of provider to choose?
- is the wrong question. `@riverpod` will chooses the right type of provider for you.
  - https://youtu.be/BJtQ0dfI-RA?t=1172

# What is the difference between `Ref.invalidate` and `Ref.refresh`?
https://pub.dev/documentation/riverpod/latest/riverpod/Ref/refresh.html

# Riverpod best practices
- https://docs-v2.riverpod.dev/docs/concepts/reading
  - > NOTE: Whenever possible, prefer using ref.watch over ref.read or ref.listen to implement a feature.
  - > WARNING: The watch method should not be called asynchronously, like inside an onPressed of an ElevatedButton.
- https://docs-v2.riverpod.dev/docs/concepts/scopes
  - > DANGER: Do not use multiple ProviderContainers, without an understanding of how they work.
