extension NullCheck on bool {
  bool get isNullOrFalse => this == null || !this;
}

extension NullOrEmpty on String {
  bool get isNullOrEmpty => this == null || this.isEmpty;
}

extension TypeNullOrEmpty on Type {
  bool get isNullOrUndefined => this == null;
}

extension ObjectNull on Object {
  bool get isNullOrUndefined => this == null;
}

extension SafeString on String {
  String get safe => this ?? '';
}

extension SafeInt on int {
  int get safe => this ?? 0;
}

extension SafeDouble on double {
  double get safe => this ?? 0.0;
}

extension SafeGeneric on Object {
  Object safe<T>(T fallback) => this ?? fallback;
}
