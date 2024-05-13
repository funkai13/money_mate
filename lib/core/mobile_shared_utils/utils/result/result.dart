sealed class Result<T, E> {
  bool get isErr => switch (this) {
        Success<T, E>() => false,
        Err<T, E>() => true,
      };

  bool get isSuccess => switch (this) {
        Success<T, E>() => true,
        Err<T, E>() => false,
      };

  B fold<B>(
    B ok(T value),
    B err(E err),
  );
}

class Success<T, E> extends Result<T, E> {
  Success(this.value);

  final T value;

  @override
  B fold<B>(B Function(T value) ok, B Function(E err) err) {
    return ok(value);
  }
}

class Err<T, E> extends Result<T, E> {
  Err(this.value);

  final E value;

  @override
  B fold<B>(B Function(T value) ok, B Function(E err) err) {
    return err(value);
  }
}
