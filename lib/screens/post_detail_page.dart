import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key, required this.postId}) : super(key: key);

  final int postId;

  static const String routeName = '/post-detail';

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostProvider>(context, listen: false)
          .getPostDetail(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          if (postProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (postProvider.postDetail != null) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset:
                    const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text('Post Detail',
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  Text('Post Id: ${widget.postId}',
                      style: Theme.of(context).textTheme.bodyText1),
                  Text('Post Title: ${postProvider.postDetail!.title}',
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            );
          } else {
            return Text('No Post Detail');
          }
        },
      ),
    );
  }
}
