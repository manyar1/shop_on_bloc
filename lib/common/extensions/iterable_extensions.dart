extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    return where(test).firstOrNull;
  }

  void removeFirstWhere(bool Function(T element) test){
    
  }

}
