import 'package:flutter/material.dart';
import 'package:iuniversities/models/post_model.dart';

import 'package:url_launcher/url_launcher.dart';

//const String _url = 'https://flutter.dev';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name!),
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
            const SizedBox(height: 24),
            const SizedBox(height: 24),
            Text(
              'Cidade: ${args.stateProvince}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  //CHANGE NAME TO WEBPAGES
                  //String _url1 = args.webPagesF.toString().replaceAll("]", "");
                  //String _url = _url1.replaceAll("[", "");
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
