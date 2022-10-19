import 'package:mobx/mobx.dart';
import 'package:api_test/models/post.dart';
import 'package:api_test/services/remote_services.dart';
import 'package:http/http.dart' as http;
part 'post_store.g.dart';


class PostStore = Posts with _$PostStore;

abstract class Posts with Store {
  @observable
  List<Post>? posts = [Post(userId: -1, id: -1, title: 'error', body: 'error')];

  @action
  Future<List<Post>?> fetchPosts(http.Client client) async{
    var tempPosts = await RemoteServices().getPosts(http.Client());
    if(tempPosts != null)
      {
        posts = postFromJson(tempPosts);
      }

    return tempPosts;
  }

}