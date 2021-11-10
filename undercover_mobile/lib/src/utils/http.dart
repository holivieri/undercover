import 'dart:io';

const String apiUrl = 'https://localhost:44320/api/V1';

const formUrlEncoded = 'application/x-www-form-urlencoded';
const applicationJson = 'application/json';
const binary = 'application/octet-stream';

Map<String, String> returnUndercoverHeaders({
  final String contentType = applicationJson,
}) {
  return {
    HttpHeaders.contentTypeHeader: contentType,
    //HttpHeaders.authorizationHeader: 'Bearer ${_userPreferences.authToken}',
  };
}
