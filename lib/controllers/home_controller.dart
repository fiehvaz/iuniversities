import 'package:flutter/cupertino.dart';
import 'package:iuniversities/models/post_model.dart';
import 'package:iuniversities/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);
  fetch(String countrie) async {
    posts.value = await _homeRepository.getList(countrie);
    //passar como paremetro
    // criar classe dao
  }
}
