import 'dart:io';

import '../models/user_preferences.dart';

const String apiUrl = 'https://undercoverrg.azurewebsites.net/api/V1';
//'https://undercoverrg.azurewebsites.net/api/V1'; //'https://localhost:44320/api/V1';

const formUrlEncoded = 'application/x-www-form-urlencoded';
const applicationJson = 'application/json';
const binary = 'application/octet-stream';

Map<String, String> returnUndercoverHeaders({
  final String contentType = applicationJson,
}) {
  return {
    HttpHeaders.contentTypeHeader: contentType,
    HttpHeaders.authorizationHeader: 'Bearer ${UserPreferences().token}',
  };
}
