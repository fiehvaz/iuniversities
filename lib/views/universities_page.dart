// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iuniversities/controllers/home_controller.dart';
import 'package:iuniversities/dao/contact_dao.dart';
import 'package:iuniversities/models/post_model.dart';
import 'package:iuniversities/repositories/home_repository_imp.dart';

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  State<UniversitiesPage> createState() => _UniversitiesPage();
}

class _UniversitiesPage extends State<UniversitiesPage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());
  final ContactDao _contactDao = ContactDao();
  TextEditingController editingController = TextEditingController();
  bool isSorted = false;
  @override
  Widget build(BuildContext context) {
    String countrie = ModalRoute.of(context)!.settings.arguments as String;
    _controller.fetch(countrie);

    return Scaffold(
      appBar: AppBar(
        title: const Text('iUniversities'),
      ),
      body: Column(children: [
        TextField(
          controller: editingController,
          onChanged: (value) {
            _controller.filteredUni(value);
          },
          decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        ),
        TextButton.icon(
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.compare_arrows, size: 28),
            ),
            label: Text(
              isSorted ? 'Descending' : 'Ascending',
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () {
              setState(() {
                isSorted = !isSorted;
              });
            }),
        Expanded(
          child: ValueListenableBuilder<List<PostModel>>(
            valueListenable: _controller.posts,
            builder: (_, list, __) {
              return ListView.separated(
                reverse: isSorted,
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (_, idx) => ListTile(
                    title: Text(list[idx].name.toString()),
                    subtitle: Text((list[idx].stateProvince == null)
                        ? ""
                        : list[idx].stateProvince.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite,
                              color: (list[idx].fav == 1)
                                  ? Colors.red
                                  : Colors.grey),
                          onPressed: () {
                            setState(() {
                              if (list[idx].fav == 1) {
                                _contactDao.makefav(list[idx].id, 0);
                                list[idx].fav = 0;
                              } else {
                                _contactDao.makefav(list[idx].id, 1);
                                list[idx].fav = 1;
                              }

                              //atualizar o sql
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(
                            '/details',
                            arguments: list[idx],
                          )
                          .then((value) => setState(() {}));
                    }),
                separatorBuilder: (
                  _,
                  __,
                ) =>
                    const Divider(),
              );
            },
          ),
        )
      ]),
    );
  }
}
