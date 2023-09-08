import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/my_page.dart';

Widget mainDrawer(BuildContext context) => Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("elquineas"),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.gif"),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.gif"),
              ),
            ],
            accountName: Text("elquineas"),
            accountEmail: Text("elquineas@naver.com"),
          ),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            leading: const Icon(Icons.home),
            onTap: () {
              debugPrint("Home 메뉴 클릭");
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomePage(
                      name: "홍길동", email: "elquineas@naver.com")));
              // const HomePage();
            },
          ),
          const Divider(
            height: 0.2,
            color: Colors.blue,
          ),
          ListTile(
            title: const Text(
              "My page",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            leading: const Icon(
              Icons.accessibility_new,
              color: Colors.brown,
            ),
            onTap: () {
              debugPrint("My Page 메뉴 클릭");
              Navigator.of(context).pushNamed("/mypage");
            },
          ),
          const Divider(
            height: 0.2,
            color: Colors.blue,
          ),
          ListTile(
            title: const Text(
              "E-mail",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            leading: const Icon(
              Icons.mail_outline_rounded,
              color: Colors.brown,
            ),
            onTap: () => Navigator.of(context).pushNamed(
              "/email",
              arguments: {
                "email": "elquineas@naver.com",
                "password": "12345",
              },
            ),
          ),
          const Divider(
            height: 0.2,
            color: Colors.blue,
          ),
        ],
      ),
    );
