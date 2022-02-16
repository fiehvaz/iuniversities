import 'package:flutter/cupertino.dart';
import 'package:iuniversities/dao/contact_dao.dart';
import 'package:iuniversities/models/post_model.dart';
import 'package:iuniversities/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;
  final ContactDao _contactDao = ContactDao();
  HomeController(this._homeRepository);

  List<PostModel> fpost = <PostModel>[];
  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  filteredUni(String onChanged) {
    posts.value = fpost
        .where((element) =>
            element.name!.toLowerCase().contains(onChanged.toLowerCase()))
        .toList();
  }

  fetch(String countrie) async {
    fpost = await _contactDao.getAll(countrie);

    if (fpost.isEmpty) {
      List<PostModel> x = await _homeRepository.getList(countrie);

      x.forEach((element) {
        element.webPagesF =
            element.webPages.toString().replaceAll("[", "").replaceAll("]", "");
      });
      await _contactDao.insert(x);
      fpost = await _contactDao.getAll(countrie);
    }
    posts.value = fpost;
  }
}
