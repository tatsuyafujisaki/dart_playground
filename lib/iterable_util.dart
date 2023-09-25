// The functions in this file are redundant and not intended for production use.

Iterable<T> flatten<T>(Iterable<Iterable<T>> xs) => xs.expand((x) => x);
Iterable<T> filterNotNull<T>(Iterable<T?> xs) => xs.whereType<T>();
