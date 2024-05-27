import 'package:flutter/material.dart';
import 'package:image_app/models/images_model.dart';
import 'package:image_app/services/images_services.dart';

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome, to images"),
      ),
      body: FutureBuilder(
        future: ImagesServices.getProductData(),
        builder: (context, AsyncSnapshot<List<ImagesModel>> snapshot) {
          return snapshot.data != null
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            snapshot.data?[index].author,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Image.network(
                            snapshot.data?[index].downloadUrl,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              String imgUrl = snapshot.data?[index].url ?? '';
                              if (imgUrl.isNotEmpty) {
                                launchUrl(Uri.parse(imgUrl));
                              }
                            },
                            child: const Text('Download'),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  })
              : const SizedBox();
        },
      ),
    );
  }
}
