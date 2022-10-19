import 'package:flutter_test/flutter_test.dart';
import 'package:api_test/services/remote_services.dart' ;
// import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'mockdata.dart';

void main() {

  group('test post api', () {
    test('returns proper json data when http response is successful',
            () async {

          // Mock the API call to return a json response with http status 200 Ok //
          final mockHTTPClient = MockClient((request) async {

            // Create sample response of the HTTP call //
            final response = jsonEncode(mock_data);
            return Response(response, 200);
          });

          expect(await RemoteServices().getPosts(mockHTTPClient), jsonEncode(mock_data));
        });

    test('return error message when http response is unsuccessful', () async {

      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        const response = null;
        return Response(jsonEncode(response), 404);
      });
      expect(await RemoteServices().getPosts(mockHTTPClient),
          null);
    });
  });
}