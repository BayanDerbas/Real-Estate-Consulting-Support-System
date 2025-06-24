// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _AuthService implements AuthService {
  _AuthService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'http://195.88.87.77:8000/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<RegisterModel>> userRegister(
    String firstName,
    String lastName,
    String email,
    String password,
    String phone,
    String role,
    String? latitude,
    String? longitude,
    String? location,
    File? commercialRegisterImage,
    File? idCardImage,
    File? degreeCertificateImage,
    String? profession,
    String? experience,
    String? bio,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Content-Type': 'multipart/form-data'};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry('firstName', firstName));
    _data.fields.add(MapEntry('lastName', lastName));
    _data.fields.add(MapEntry('email', email));
    _data.fields.add(MapEntry('password', password));
    _data.fields.add(MapEntry('phone', phone));
    _data.fields.add(MapEntry('role', role));
    if (latitude != null) {
      _data.fields.add(MapEntry('latitude', latitude));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry('longitude', longitude));
    }
    if (location != null) {
      _data.fields.add(MapEntry('location', location));
    }
    if (commercialRegisterImage != null) {
      _data.files.add(
        MapEntry(
          'commercialRegisterImage',
          MultipartFile.fromFileSync(
            commercialRegisterImage.path,
            filename:
                commercialRegisterImage.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    if (idCardImage != null) {
      _data.files.add(
        MapEntry(
          'idCardImage',
          MultipartFile.fromFileSync(
            idCardImage.path,
            filename: idCardImage.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    if (degreeCertificateImage != null) {
      _data.files.add(
        MapEntry(
          'degreeCertificateImage',
          MultipartFile.fromFileSync(
            degreeCertificateImage.path,
            filename:
                degreeCertificateImage.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    if (profession != null) {
      _data.fields.add(MapEntry('profession', profession));
    }
    if (experience != null) {
      _data.fields.add(MapEntry('experience', experience));
    }
    if (bio != null) {
      _data.fields.add(MapEntry('bio', bio));
    }
    final _options = _setStreamType<HttpResponse<RegisterModel>>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            'http://195.88.87.77:8000/api/v1/auth/register',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RegisterModel _value;
    try {
      _value = RegisterModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<LoginResponseModel>> login(
    LoginRequestModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<LoginResponseModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'http://195.88.87.77:8000/api/v1/auth/login',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LoginResponseModel _value;
    try {
      _value = LoginResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<VerificationCodeModel>> verificationCode(
    VerificationCodeModel request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<HttpResponse<VerificationCodeModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'http://195.88.87.77:8000/api/v1/auth/verification',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VerificationCodeModel _value;
    try {
      _value = VerificationCodeModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> changePassword(
    String email,
    String password,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'email': email,
      r'password': password,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<dynamic>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'http://195.88.87.77:8000/api/v1/auth/change-password',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch(_options);
    final _value = _result.data;
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
