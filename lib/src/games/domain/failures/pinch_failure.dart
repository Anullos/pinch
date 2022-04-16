abstract class PinchFailure {
  const PinchFailure();
  factory PinchFailure.serverError() = PinchFailureServerError;

  void when({
    required void Function(PinchFailureServerError) serverError,
  }) {
    if (this is PinchFailureServerError) {
      serverError.call(this as PinchFailureServerError);
    }

    serverError.call(this as PinchFailureServerError);
  }

  R map<R>({
    required R Function(PinchFailureServerError) serverError,
  }) {
    if (this is PinchFailureServerError) {
      return serverError.call(this as PinchFailureServerError);
    }

    return serverError.call(this as PinchFailureServerError);
  }

  void maybeWhen({
    void Function(PinchFailureServerError)? serverError,
    required void Function() orElse,
  }) {
    if (this is PinchFailureServerError && serverError != null) {
      serverError.call(this as PinchFailureServerError);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(PinchFailureServerError)? serverError,
    required R Function() orElse,
  }) {
    if (this is PinchFailureServerError && serverError != null) {
      return serverError.call(this as PinchFailureServerError);
    }

    return orElse.call();
  }

  factory PinchFailure.fromString(String value) {
    if (value == 'serverError') {
      return PinchFailure.serverError();
    }

    return PinchFailure.serverError();
  }

  @override
  String toString() {
    if (this is PinchFailureServerError) {
      return 'serverError';
    }

    return 'serverError';
  }
}

class PinchFailureServerError extends PinchFailure {}
