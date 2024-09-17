void main() async {
  final myFuture = Future<String>(
    () => '🍎',
  );

  print(await myFuture);
}
