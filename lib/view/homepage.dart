import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone_abuubkar/utilities/constants.dart';
import 'package:twitter_clone_abuubkar/view/chat_page.dart';
import 'package:twitter_clone_abuubkar/view/notifictaions_page.dart';
import 'package:twitter_clone_abuubkar/view/search_page.dart';
import 'package:twitter_clone_abuubkar/view/tweets_homepage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _page = [
    TweetsHomePage(),
    NotificationsPage(),
    Searchpage(),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          size: 24.0,
          color: accentColor,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 1.0,
            backgroundImage: AssetImage('images/avatar.jpg'),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_border,
              color: accentColor,
            ),
          ),
        ],
      ),
      body: _page[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: accentColor,
        child: _currentIndex != 3
            ? FaIcon(FontAwesomeIcons.featherAlt)
            : Icon(Icons.mail_outline, size: 28.0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIconTheme: IconThemeData(size: 28.0),
        unselectedIconTheme: IconThemeData(size: 28.0),
        backgroundColor: backgroundColor,
        unselectedItemColor: Colors.black26,
        selectedItemColor: accentColor,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: SizedBox(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: SizedBox(),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex != 2
                ? Icon(Icons.notifications_none)
                : Icon(Icons.notifications),
            title: SizedBox(),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex != 3
                ? Icon(Icons.mail_outline)
                : Icon(Icons.mail),
            // icon: FaIcon(FontAwesomeIcons.envelope),
            title: SizedBox(),
          ),
        ],
      ),
    );
  }
}
