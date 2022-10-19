import 'package:mobx/mobx.dart';
import 'package:api_test/models/post.dart';
import 'package:api_test/services/remote_services.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

part 'post_store.g.dart';



class PostStore  = Posts with _$PostStore;

abstract class Posts with Store {
  @observable
  List<Post>? posts = [Post(userId: -1, id: -1, title: 'error', body: 'error')];

  @action
  Future fetchPosts(http.Client client) async{
    var tempPosts = await RemoteServices().getPosts(client);

    if(tempPosts != null)
      {
        posts = postFromJson(tempPosts);
      }
  }

}