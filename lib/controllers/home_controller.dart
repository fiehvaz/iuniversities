import 'package:flutter/cupertino.dart';
import 'package:iuniversities/dao/contact_dao.dart';
import 'package:iuniversities/models/post_model.dart';
import 'package:iuniversities/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;
  final ContactDao _contactDao = ContactDao();
  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);
  fetch(String countrie) async {
    posts.value = await _contactDao.getAll(countrie);

    if (posts.value.isEmpty) {
      List<PostModel> x = await _homeRepository.getList(countrie);

      x.forEach((element) {
        element.webPagesF =
            element.webPages.toString().replaceAll("[", "").replaceAll("]", "");
      });
      await _contactDao.insert(x);
      posts.value = await _contactDao.getAll(countrie);
    }
  }
}
