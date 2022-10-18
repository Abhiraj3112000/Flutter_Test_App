import 'package:api_test/models/post.dart';
import 'package:http/http.dart' as http;
class RemoteServices{
  Future<List<Post>?> getPosts(http.Client client) async {

     var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
     var response = await client.get(url);
     if(response.statusCode == 200){
       var json = response.body;
       return postFromJson(json);
     }
     return null;
  }
}