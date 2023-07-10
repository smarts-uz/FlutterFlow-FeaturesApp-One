import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Users Group Code

class UsersGroup {
  static String baseUrl = 'https://reqres.in/api';
  static Map<String, String> headers = {};
  static GetUsersCall getUsersCall = GetUsersCall();
  static GetSingleUserCall getSingleUserCall = GetSingleUserCall();
  static AddNewUserCall addNewUserCall = AddNewUserCall();
}

class GetUsersCall {
  Future<ApiCallResponse> call({
    int? page,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUsers',
      apiUrl: '${UsersGroup.baseUrl}/users',
      callType: ApiCallType.GET,
      headers: {
        ...UsersGroup.headers,
      },
      params: {
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetSingleUserCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSingleUser',
      apiUrl: '${UsersGroup.baseUrl}/users/${userId}',
      callType: ApiCallType.GET,
      headers: {
        ...UsersGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic getSingleUser(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic getUserEmail(dynamic response) => getJsonField(
        response,
        r'''$.data.email''',
      );
  dynamic geUserName(dynamic response) => getJsonField(
        response,
        r'''$.data.first_name''',
      );
  dynamic getUserLastName(dynamic response) => getJsonField(
        response,
        r'''$.data.last_name''',
      );
  dynamic getUserAvatar(dynamic response) => getJsonField(
        response,
        r'''$.data.avatar''',
      );
}

class AddNewUserCall {
  Future<ApiCallResponse> call({
    String? userName = '',
    String? userJob = '',
  }) {
    final body = '''
{
  "name": "${userName}",
  "job": "${userJob}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addNewUser',
      apiUrl: '${UsersGroup.baseUrl}/users',
      callType: ApiCallType.POST,
      headers: {
        ...UsersGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Users Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
