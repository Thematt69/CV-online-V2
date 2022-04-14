extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull {
    if (isNotEmpty) return first;
    return null;
  }

  T? firstWhereOrNull(bool Function(T) test) {
    final result = where(test);
    if (result.isNotEmpty) return result.first;
    return null;
  }
}
