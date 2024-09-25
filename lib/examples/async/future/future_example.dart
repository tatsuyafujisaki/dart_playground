void main() async {
  print(
    await Future<String>(
      () => '🍎',
    ),
  );

  print(await Future.value('🍊'));
  print(await Future.error('💀'));
}
