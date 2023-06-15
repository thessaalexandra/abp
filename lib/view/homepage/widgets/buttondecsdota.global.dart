import 'package:abp/main.dart';
import 'package:abp/utils/global.colors.dart';
import 'package:abp/view/decs/apexdecs.view.dart';
import 'package:abp/view/decs/csgodecs.view.dart';
import 'package:abp/view/homepage/homepage.view.dart';
import 'package:abp/view/login/login.view.dart';
import 'package:flutter/material.dart';

import '../../decs/dota2decs.view.dart';

class buttondecsdota extends StatelessWidget {
  const buttondecsdota({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Login');
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: GlobalColors.mainColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 0, 0, 0),
              ), // Ganti warna latar belakang tombol dengan warna biru
              minimumSize: MaterialStateProperty.all<Size>(Size(30, 40)),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return dotadecs();
              }));
            },
            child: const Text(
              'Deskripsi',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )),
      ),
    );
  }
}
