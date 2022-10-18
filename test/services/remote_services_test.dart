import 'package:flutter_test/flutter_test.dart';
import 'package:api_test/services/remote_services.dart' ;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'mockdata.dart';

void main() {
  group('test api', () {
    // test('returns address when http response is successful',
    //         () async {
    //
    //       // Mock the API call to return a json response with http status 200 Ok //
    //       final mockHTTPClient = MockClient((request) async {
    //
    //         // Create sample response of the HTTP call //
    //         final response = mock_data;
    //         return Response(jsonEncode(response), 200);
    //       });
    //
    //       expect(await RemoteServices().getPosts(mockHTTPClient), mock_data);
    //     });

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