import 'package:rick_and_morty_app/core/networking/api_error_handler.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';

class ApiResult<T> {
  ApiResult._();
  factory ApiResult.success(T data) = ApiSuccess<T>;
  factory ApiResult.failure(Object error) = ApiFailure<T>;

  when({
    required Function(T data) onSuccess,
    required Function(ApiErrorModel error) onFailure,
  }) {
    if (this is ApiSuccess<T>) {
      return onSuccess((this as ApiSuccess<T>).data);
    } else if (this is ApiFailure<T>) {
      return onFailure(ApiErrorHandler.handle((this as ApiFailure<T>).error));
    }
  }
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  ApiSuccess(this.data) : super._();
}

class ApiFailure<T> extends ApiResult<T> {
  final Object error;
  ApiFailure(this.error) : super._();
}
