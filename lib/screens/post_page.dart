import 'package:flutter/material.dart';
import 'package:flutter_state_mangement/screens/post_detail_page.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  static const String routeName = '/post';

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostProvider>(context, listen: false).getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Page'),
      ),
      body: Container(
        child: Consumer(
          builder: (context, PostProvider postProvider, child) {
            if (postProvider.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (postProvider.errorMessage.isNotEmpty) {
              return Center(
                child: Text(postProvider.errorMessage),
              );
            } else {
              return ListView.builder(
                itemCount: postProvider.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(postProvider.posts[index].id.toString()),
                    title: Text(postProvider.posts[index].title),
                    subtitle: Text(postProvider.posts[index].body),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PostDetailPage.routeName,
                        arguments: postProvider.posts[index].id,
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
