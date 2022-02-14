// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iuniversities/controllers/home_controller.dart';
import 'package:iuniversities/models/post_model.dart';
import 'package:iuniversities/repositories/home_repository_imp.dart';

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  State<UniversitiesPage> createState() => _UniversitiesPage();
}

String countrie = "Argentina";

class _UniversitiesPage extends State<UniversitiesPage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    //passar a variavel
    _controller.fetch();
  }

  bool isDescending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iUniversities'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return Column(
            children: [
              TextButton.icon(
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.compare_arrows, size: 28),
                ),
                label: Text(
                  isDescending ? 'Descending' : 'Ascending',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () => setState(() {
                  isDescending
                      ? list.sort((a, b) => a.name.compareTo(b.name))
                      : list.sort((b, a) => a.name.compareTo(b.name));
                  isDescending = !isDescending;
                }
                    //

                    ),
              ), //  CHANGE NAME TO COUNTRY BY VALUE AND ITS DONE
              // SEARCHBAR IN ALL LIST AND ITS DONE BITCH
              //START SEARCHED REMEBEMBER
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, idx) => ListTile(
                    leading: Text(list[idx].name.toString()),

                    //title: Text(list[idx].name),
                    // trailing: const Icon(Icons.star),

                    onTap: () => Navigator.of(context).pushNamed(
                      '/details',
                      arguments: list[idx],
                    ),
                  ),
                  separatorBuilder: (
                    _,
                    __,
                  ) =>
                      const Divider(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
