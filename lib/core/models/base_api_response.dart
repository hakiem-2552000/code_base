class BaseAPIResponse<T> {
  late final int code;
  late final String message;
  late final T data;
  late final bool success;

  BaseAPIResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() =>
      {'code': code, 'message': message, 'data': data, 'success': success};
}
