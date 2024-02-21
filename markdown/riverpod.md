# General info
- https://docs-v2.riverpod.dev/docs/essentials/first_request
  - > The network request will not be executed until the UI reads the provider at least once.
  - > Subsequent reads will not re-execute the network request, but instead return the previously fetched activity.

# ProviderContainer versus ProviderScope
- [ProviderContainer](https://pub.dev/documentation/riverpod/latest/riverpod/ProviderContainer-class.html) is for a non-Flutter application and is equivalent to [ProviderScope](https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/ProviderScope-class.html) in a Flutter application.
  - https://youtu.be/BJtQ0dfI-RA?t=973

# Which type of provider to choose?
- is the wrong question. `@riverpod` will chooses the right type of provider for you.
  - https://youtu.be/BJtQ0dfI-RA?t=1172

# What is the difference between `Ref.invalidate` and `Ref.refresh`?
https://pub.dev/documentation/riverpod/latest/riverpod/Ref/refresh.html

# Best practices
## ProviderContainer
- https://docs-v2.riverpod.dev/docs/concepts/scopes
  - > DANGER: Do not use multiple ProviderContainers, without an understanding of how they work.
  - > Only create a ProviderContainer without a ProviderScope for testing and dart-only usage.
## .autoDispose / .family / riverpod_lint
- https://docs-v2.riverpod.dev/docs/essentials/passing_args
  - > CAUTION: When passing arguments to providers, it is highly encouraged to enable "autoDispose" on the provider. Failing to do so may result in memory leaks.
  - > To help spot this mistake, it is recommended to use the riverpod_lint and enable the provider_parameters lint rule. Then, the previous snippet would show a warning.
## ref.watch / ref.read / ref.listen
- https://docs-v2.riverpod.dev/docs/concepts/reading
  - > NOTE: Whenever possible, prefer using `ref.watch` over `ref.read` or `ref.listen` to implement a feature.
  - > WARNING: The `watch` method should not be called asynchronously, like inside an onPressed of an ElevatedButton. The watch method should not be called asynchronously, like inside an onPressed of an ElevatedButton. Nor should it be used inside `initState` and other State life-cycles. In those cases, consider using `ref.read` instead.
  - > Using `ref.read` should be avoided as much as possible because it is not reactive.
  - > DON'T use `ref.read` inside the build method.

## FutureProvider
### How to extract `T` from `Future<T>` in a FutureProvider
```dart
final futureProvider = FutureProvider.autoDispose<String>((_) => Future.value('Hello'));
final s = await ProviderContainer().read(futureProvider.future);
print(s); // Hello
```

### How to derive a FutureProvider from another FutureProvider
```dart
final futureProvider1 = FutureProvider.autoDispose<String>(
  (ref) => Future.value('hello'),
);

final futureProvider2 = FutureProvider.autoDispose<String>(
  (ref) => ref.watch(futureProvider1).value?.toUpperCase() ?? '',
);
```

## Hooks
- https://docs-v2.riverpod.dev/docs/essentials/first_request
  - > CAUTION: If you are new to Riverpod, using "hooks" is discouraged.
