enum Fruit {
  apple(color: 'red'),
  orange(color: 'orange');

  const Fruit({
    required this.color,
  });

  factory Fruit.fromColor(String color) =>
      values.firstWhere((value) => value.color == color);

  final String color;
}

void main() {
  final apple = Fruit.fromColor('red');
  print(apple);
}
