import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:api_test/services/remote_services.dart';
import 'package:api_test/stores/stores.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final PostStore _postStore = PostStore();

  getData() async {
    var posts = await RemoteServices().getPosts(http.Client());
    if (kDebugMode) {
      print(posts);
    }
  }

  @override
  void initState() {
    _postStore.fetchPosts(http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Posts'),
          ),
          body: ListView.builder(
              itemCount: _postStore.posts!.length,
              itemBuilder: (context,index){
                 return Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(_postStore.posts![index].title,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: const TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     const SizedBox(height: 10),
                     Text(_postStore.posts![index].body ?? '',
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                     ),
                     const SizedBox(height: 20),
                   ]
                 );
          })
        );
      },
    );
  }
}
