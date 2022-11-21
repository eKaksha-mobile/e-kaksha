import 'package:ekaksha/home/profile/screen/leaderboard_screen.dart';
import 'package:ekaksha/home/profile/screen/profile_screen.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TabScreen extends StatefulWidget {
  static const route = '/tab_screen';
  static const List<String> _pages = ['Profile', 'Leaderboard'];

  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _page = 0;
  late PageController _pageController;

  @override
  void initState() async {
    super.initState();

    if (GlobalData.allStudentModelList.isEmpty) {
      GlobalData.allStudentModelList =
          await GetIt.I.get<FirebaseService>().getAllStudentModelList();
    }
    _pageController = PageController(initialPage: _page);
  }

  void _onTap(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TabScreen._pages.elementAt(_page)),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [const ProfileScreen(), LeaderboardScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: _page,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_rounded), label: 'Leaderboard'),
        ],
      ),
    );
  }
}
