// ignore_for_file: must_be_immutable

import 'package:cryuptoapp/model/model.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final CryuptoModel data;
  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://avatars.mds.yandex.net/i?id=0de8409403f4cd6ff777e66d89cfb319549fd6b2-9106782-images-thumbs&n=13"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data.code.toString()),
              Text(data.cbPrice.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
