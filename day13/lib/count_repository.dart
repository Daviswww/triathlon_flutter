abstract class CountRepositoryImp {
  /// Count model
  ///
  /// Increment one
  Future<int> add(int count);

  /// Count model
  ///
  /// Decrement one
  Future<int> dec(int count);
}

class CountRepository implements CountRepositoryImp {
  @override
  Future<int> add(count) async {
    return ++count;
  }

  @override
  Future<int> dec(int count) async {
    return --count;
  }
}
