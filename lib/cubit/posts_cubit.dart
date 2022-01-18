import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_dio/data/repositories/post_repository.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostRepository postRepository;

  PostsCubit({required this.postRepository}) : super(PostsInitial());

  void fetchPosts() {
    postRepository.fetchPosts().then((posts) {
      emit(PostsLoaded(posts: posts));
    });
  }
}
