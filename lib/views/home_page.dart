// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iuniversities/dao/contact_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

final ContactDao _contactDao = ContactDao();

class _HomePage extends State<HomePage> {
  List<String> countries = [
    'Argentina',
    'Bolivia',
    'Brazil',
    'Chile',
    'Colombia',
    'Ecuador',
    'Guyana',
    'Paraguay',
    'Peru',
    'Suriname',
    'Uruguay',
    'Venezuela'
  ];
  List<String> countrimage = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/1200px-Flag_of_Argentina.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Flag_of_Bolivia_%28state%29.svg/1280px-Flag_of_Bolivia_%28state%29.svg.png',
    'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png',
    'https://bandeira.net/wp-content/uploads/2018/08/bandeira-do-chile.png',
    'https://bandeira.net/wp-content/uploads/2018/08/bandeira-da-colombia.png',
    'https://bandeira.net/wp-content/uploads/2018/08/bandeira-do-equador.png',
    'https://bandeira.net/wp-content/uploads/2018/08/bandeira-guiana-francesa.png',
    'https://bandeira.net/wp-content/uploads/2018/08/bandeira-do-paraguai.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Flag_of_Peru_%28state%29.svg/800px-Flag_of_Peru_%28state%29.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Flag_of_Suriname.svg/255px-Flag_of_Suriname.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Uruguay.svg/1200px-Flag_of_Uruguay.svg.png',
    'https://bandeira.net/wp-content/uploads/2018/08/bandeira-da-venezuela.png'
  ];
  final counts = List<dynamic>.filled(12, 0);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('iUniversities'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        ),
        body: buildList(),
      );

  Widget buildList() => FutureBuilder(
      future: getCount(countries),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              // getCount(countries[index], index);
              final countrie = countries[index];
              //var uni_count; //getCount(countrie);

              return ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(countrimage[index]),
                ),
                title: Text(countrie),
                subtitle: Text('universities: ${counts[index]}'),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/universitiesPage', arguments: countrie)
                      .then((value) => setState(() {}));
                },
              );
            },
          );
        }
      });

  getCount(countries) async {
    for (int i = 0; i < countries.length; i++) {
      var x = await _contactDao.getCount(countries[i]);
      counts[i] = x;
    }
    print('qtd');
    return 'ok';
  }
}
