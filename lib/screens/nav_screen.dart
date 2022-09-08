import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/app_bar/app_bar_cubit.dart';
import '../screens/screens.dart';
import '../widgets/movie_card.dart';
import '../widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(
      key: PageStorageKey('homeScreen'),
    ),
    const Scaffold(
      body: Center(
        child: MovieCardList(),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ];

  // final Map<String, IconData> _icons = const {
  //   'Home': Icons.home,
  //   'Search': Icons.search,
  //   'Coming Soon': Icons.queue_play_next,
  //   'Downloads': Icons.file_download,
  //   'More': Icons.menu,
  // };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: const Color(0xff1f271b),
              // animationCurve: ,
              buttonBackgroundColor: const Color.fromARGB(255, 146, 124, 42),
              index: _currentIndex,
              items: const <Widget>[
                Icon(Icons.home_rounded, size: 30),
                Icon(Icons.search_rounded, size: 30),
                Icon(Icons.queue_play_next_rounded, size: 30),
                Icon(Icons.file_download_rounded, size: 30),
                Icon(Icons.menu_rounded, size: 30),
              ],
              onTap: (index) => setState(() => _currentIndex = index),
            )
          // BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     backgroundColor: Colors.black,
          //     items: _icons
          //         .map((title, icon) => MapEntry(
          //             title,
          //             BottomNavigationBarItem(
          //               icon: Icon(
          //                 icon,
          //                 size: 30.0,
          //               ),
          //               label: title,
          //             )))
          //         .values
          //         .toList(),
          //     currentIndex: _currentIndex,
          //     selectedFontSize: 11.0,
          //     selectedItemColor: Colors.white,
          //     unselectedFontSize: 11.0,
          //     unselectedItemColor: Colors.grey,
          //     onTap: (index) => setState(() => _currentIndex = index),
          //   )
          : null,
    );
  }
}
