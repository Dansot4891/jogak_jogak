extension ToEntityListExtension<T> on List<T> {
  List<R> mapToEntityList<R>(R? Function(T) mapper) {
    return map(mapper).whereType<R>().toList();
  }
}
