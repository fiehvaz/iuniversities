import 'package:iuniversities/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
