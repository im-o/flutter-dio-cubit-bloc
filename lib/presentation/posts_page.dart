import 'package:bloc_cubit_dio/cubit/posts_cubit.dart';
import 'package:bloc_cubit_dio/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostsCubit>(context).fetchPosts();
    return Scaffold(
      appBar: AppBar(title: Text("Dio with Cubit BLoC")),
      body: Center(child: _postList()),
    );
  }

  Widget _postList() {
    return BlocConsumer<PostsCubit, PostsState>(
      builder: (context, state) {
        if (!(state is PostsLoaded)) return CircularProgressIndicator();
        final posts = (state).posts;
        return SingleChildScrollView(
          child: Column(
            children: posts.map((post) => _post(post, context)).toList(),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _post(Post post, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${post.title}",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6.0),
          Text(post.body.toString()),
        ],
      ),
    );
  }
}
