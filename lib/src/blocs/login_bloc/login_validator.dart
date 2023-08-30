import 'dart:async';

// mixin : class 상속과 상관없이 필요한 곳에서 사용할 수 있는 속성 또는 method 정의
mixin LoginValidator {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.contains('@')) {
        sink.add(data);
      } else {
        sink.addError('Enter a valid email.');
      }
    },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length > 3) {
        sink.add(data);
      }
    },
    handleError: (error, stackTrace, sink) {
      sink.addError('Password must be at least 4 characters.');
    },
  );
}
