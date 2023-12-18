Iterable<T> _flatten<T>(Iterable<Iterable<T>> xs) => xs.expand((x) => x);
Iterable<T> _filterNotNull<T>(Iterable<T?> xs) => xs.whereType<T>();

void main() {
  final xs = [
    ['a'],
    ['b', 'c'],
    ['d'],
  ];

  print(_flatten(xs).toList()); // [a, b, c, d]

  final ys = <String?>['a', null, 'b'];

  print(_filterNotNull(ys).toList()); // [a, b]
}
