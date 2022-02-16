import 'package:iuniversities/models/post_model.dart';

import 'package:dio/dio.dart';
import 'home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  @override
  Future<List<PostModel>> getList(String countrie) async {
    try {
      var response = await Dio()
          .get('http://universities.hipolabs.com/search?country=$countrie');
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      // print(e);
    }

    return [];
  }
}
