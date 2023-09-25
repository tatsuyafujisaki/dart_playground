Iterable<T> flatten<T>(Iterable<Iterable<T>> xs) => xs.expand((x) => x);
