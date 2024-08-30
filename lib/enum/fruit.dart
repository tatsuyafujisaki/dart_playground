enum Fruit {
  apple(emoji: '🍎'),
  orange(emoji: '🍊');

  const Fruit({
    required this.emoji,
  });

  factory Fruit.fromEmoji(String emoji) =>
      values.firstWhere((value) => value.emoji == emoji);

  final String emoji;
}

void main() {
  final apple = Fruit.fromEmoji('🍎');
  print(apple);
}
