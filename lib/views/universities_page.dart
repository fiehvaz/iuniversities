// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iuniversities/controllers/home_controller.dart';
import 'package:iuniversities/models/post_model.dart';
import 'package:iuniversities/repositories/home_repository_imp.dart';

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  //final String countrie;
  @override
  State<UniversitiesPage> createState() => _UniversitiesPage();
}

class _UniversitiesPage extends State<UniversitiesPage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  Widget build(BuildContext context) {
    String countrie = ModalRoute.of(context)!.settings.arguments as String;
    _controller.fetch(countrie);
    bool isDescending = false;
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
                  // isDescending
                  // ? list.sort((a, b) => a.name.compareTo(b.name))
                  //: list.sort((b, a) => a.name.compareTo(b.name));
                  // isDescending = !isDescending;
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
                    title: Text(list[idx].name.toString()),

                    //title: Text(list[idx].name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              print('aaa');
                              list[idx].name = 'aaaaa';
                            },
                            icon: Icon(Icons.favorite)),
                      ],
                    ),

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
