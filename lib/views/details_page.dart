import 'package:flutter/material.dart';
import 'package:iuniversities/dao/contact_dao.dart';
import 'package:iuniversities/models/post_model.dart';

import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;
    final ContactDao _contactDao = ContactDao();
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name!),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, true),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              args.name!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 24,
              child: IconButton(
                icon: Icon(Icons.favorite,
                    color: (args.fav == 1) ? Colors.red : Colors.grey),
                onPressed: () {
                  setState(() {
                    if (args.fav == 1) {
                      _contactDao.makefav(args.id, 0);
                      args.fav = 0;
                    } else {
                      _contactDao.makefav(args.id, 1);
                      args.fav = 1;
                    }
                  });
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Cidade: ${args.stateProvince}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _launchURL(args.webPagesF!);
                },
                child: Text(' ${args.webPagesF}'))
          ],
        ),
      ),
    );
  }
}

void _launchURL(String _url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
