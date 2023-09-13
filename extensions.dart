extension NullNorEmpty on String? {
  bool get isNullOrEmpty => this?.isNotEmpty ?? true;
}

extension NeitherNullNorEmpty on String? {
  bool get isNeitherNullNorEmpty => this?.isNotEmpty ?? false;
}
