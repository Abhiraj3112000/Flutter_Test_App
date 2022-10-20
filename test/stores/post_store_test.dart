import 'package:api_test/stores/post_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:api_test/models/post.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'mockdata.dart';

void main() {
  group('test post store', () {
    test('updates store with posts when http response is successful',
            () async {

          // Mock the API call to return a json response with http status 200 Ok //
          final mockHTTPClient = MockClient((request) async {
            // Create sample response of the HTTP call //
            final response = jsonEncode(mock_data);
            return Response(response, 200);
          });

          final postStore = PostStore();
          final expectedPosts = postFromJson(jsonEncode(mock_data));

          await postStore.fetchPosts(mockHTTPClient);

          expect(postStore.posts, expectedPosts);
        });

    test('updates store with error post when http response is unsuccessful', () async {

      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        var response = jsonEncode(null);
        return Response(response, 404);
      });

      final postStore = PostStore();
      final expectedPosts = [Post(userId: -1, id: -1, title: 'error', body: 'error')];

      await postStore.fetchPosts(mockHTTPClient);

      expect(postStore.posts, expectedPosts);
    });
  });
}