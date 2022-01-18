import 'package:bloc_cubit_dio/data/repositories/post_repository.dart';
import 'package:bloc_cubit_dio/data/services/api_client.dart';
import 'package:bloc_cubit_dio/data/services/providers/post_providers.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(App(postRepository: PostRepository(PostProviders(ApiClient()))));
}
