
import 'package:flutter/material.dart';
import '../models/floatingnavbar_model.dart';
import '../screens/home_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/profile_screen.dart';
import '../services/navigation_service.dart';
import '../utils/service_locator.dart';
import '../widgets/floatingbar_widget.dart';
import 'messages_screen.dart';

class MainDeshboardScreen extends StatefulWidget {
  final int page;
   const MainDeshboardScreen({Key? key, this.page = 0}) : super(key: key);
  @override
  _MainDeshboardScreenState createState() => _MainDeshboardScreenState();
}

class _MainDeshboardScreenState extends State<MainDeshboardScreen> {
  var navigationService = locator<NavigationService>();
  var locale;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // drawer: MainDrawerWidget(),

      // appBar:
      //     _index == 0
      //         ? AppBar(
      //             elevation: 0,
      //             backgroundColor: Colors.transparent,
      //             leading: _index == 0
      //                 ? Builder(
      //                     builder: (context) => IconButton(
      //                         icon: Image.asset(
      //                           'assets/images/drawer_icon.png',
      //                           scale: 3.0,
      //                           color: Colors.white,
      //                         ),
      //                         onPressed: () =>
      //                             Scaffold.of(context).openDrawer()),
      //                   )
      //                 : null,
      //             centerTitle: true,
      //             title: Text(_index == 0 ? "Home" : ""),
      //             actions: <Widget>[
      //               // IconButton(onPressed: (){}, icon: Icon(Icons.search)),
      //               _index == 0
      //                   ? IconButton(
      //                       onPressed: () {
      //                         // navigationService
      //                         //     .navigateTo(NotificationScreenRoute);
      //                       },
      //                       icon: Icon(Icons.notifications_outlined))
      //                   : Text(""),
      //             ],
      //           )
      //         : null,

      //If you want to show body behind the navbar, it should be true
      extendBody: true,
      body: IndexedStack(
        index: _index,
        children:  <Widget>[
          HomeTabScreen(),
          const MessagesScreen(),
          NotificationScreen(),
           ProfileScreen()
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 20, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //       color:Platform.isIOS?
            //       Colors.grey.shade300.withOpacity(0.2):Colors.grey.shade300.withOpacity(0.5),
            //       spreadRadius: 1,
            //       blurRadius: 10,
            //       offset: Offset(2, -1))
            // ]
          ),
          child: FloatingNavbar(
            backgroundColor: const Color.fromRGBO(20, 20, 22, 1),
            onTap: (int val) => setState(() => _index = val),
            currentIndex: _index,
            items: [
              FloatingNavbarItem(
                customWidget: _index == 0
                    ? Image.asset(
                        "assets/images/Disable-Tab-bar-01.png",
                        scale: 4,
                        color: const Color.fromRGBO(255, 127, 8, 1),
                      )
                    : Image.asset(
                        "assets/images/Disable-Tab-bar-01.png",
                        scale: 4,
                      ),
                title: '',
              ),
              FloatingNavbarItem(
                  customWidget: _index == 1
                      ? Image.asset(
                          "assets/images/Disable-Tab-bar-02.png",
                          scale: 4,
                          color: const Color.fromRGBO(255, 127, 8, 1),
                        )
                      : Image.asset(
                          "assets/images/Disable-Tab-bar-02.png",
                          scale: 4,
                        ),
                  title: ''),
              FloatingNavbarItem(
                  customWidget: _index == 2
                      ? Image.asset(
                          "assets/images/Disable-Tab-bar-03.png",
                          scale: 4,
                          color: const Color.fromRGBO(255, 127, 8, 1),
                        )
                      : Image.asset(
                          "assets/images/Disable-Tab-bar-03.png",
                          scale: 4,
                        ),
                  title: ''),
              FloatingNavbarItem(
                  customWidget: _index == 3
                      ? Image.asset(
                          "assets/images/Disable-Tab-bar-04.png",
                          scale: 4,
                          color: const Color.fromRGBO(255, 127, 8, 1),
                        )
                      : Image.asset(
                          "assets/images/Disable-Tab-bar-04.png",
                          scale: 4,
                        ),
                  title: ''),
            ],
          ),
        ),
      ),
    );
  }
}
