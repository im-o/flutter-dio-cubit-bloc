import 'package:bloc_cubit_dio/data/models/post.dart';
import 'package:bloc_cubit_dio/data/services/providers/post_providers.dart';

class PostRepository {
  final PostProviders providers;

  PostRepository(this.providers);

  Future<List<dynamic>> fetchPosts() async {
    final posts = await providers.fetchPosts();
    return posts.map((post) => Post.fromJson(post)).toList();
  }
}
