import 'package:bloc_cubit_dio/cubit/posts_cubit.dart';
import 'package:bloc_cubit_dio/data/repositories/post_repository.dart';
import 'package:bloc_cubit_dio/presentation/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final PostRepository postRepository;

  const App({Key? key, required this.postRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => PostsCubit(postRepository: postRepository),
        child: PostsPage(),
      ),
    );
  }
}
