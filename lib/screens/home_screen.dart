import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_dukantek/screens/swipeCardWidgets/cards.dart';
import 'package:test_app_dukantek/screens/swipeCardWidgets/controller.dart';

import '../providers/auth_provider.dart';
import '../services/navigation_service.dart';
import '../utils/service_locator.dart';
import 'package:relative_scale/relative_scale.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final TCardController _controller = TCardController();
  var navigationService = locator<NavigationService>();
  var isLoadingProgress = false;
  var influencerData;
  List<Widget> cards = [];
  List images = [
    {"image": "assets/images/6.jpg"},
    {"image": "assets/images/5.jpg"},
    {"image": "assets/images/4.jpg"},
    {"image": "assets/images/dummy1.jpg"},
    {"image": "assets/images/1.jpg"},
    {"image": "assets/images/6.jpg"},
  ];
  List icon = [
    {
      "icon": "assets/images/icon1.png",
    },
    {
      "icon": "assets/images/icon2.png",
    },
    {
      "icon": "assets/images/icon3.png",
    },
    {
      "icon": "assets/images/icon5.png",
    },
    {
      "icon": "assets/images/icon4.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              height: sy(90),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment(1.2, 1.5),
                  colors: <Color>[
                    Color.fromRGBO(255, 102, 0, 1),
                    Color.fromRGBO(255, 76, 1, 1),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(sy(14)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discover",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sy(15),
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                        onTap: () async {
                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .logoutFirebase();
                        },
                        child: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: sy(10)),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TCard(
                  cards: List.generate(
                    images.length,
                    (int index) {
                      return RelativeBuilder(
                          builder: (context, height, width, sy, sx) {
                        return Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(14, 14, 16, 1),
                              borderRadius: BorderRadius.circular(sy(10)),
                              // boxShadow: [
                              //   BoxShadow(
                              //     offset: Offset(0, 17),
                              //     blurRadius: 23.0,
                              //     spreadRadius: -13.0,
                              //     color: Colors.grey,
                              //   )
                              // ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(sy(8)),
                                      color:
                                          const Color.fromRGBO(14, 14, 16, 1),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.topRight,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(sy(10)),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    // 'assets/images/dummy6.jpg'
                                                    images[index]['image']),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Positioned(
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        sy(10)),
                                              ),
                                              child: ClipRect(
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 10.0,
                                                      sigmaY: 10.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          offset:
                                                              Offset(10, 17),
                                                          blurRadius: 23.0,
                                                          spreadRadius: 13.0,
                                                          color: Colors.black26,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              sy(10)),
                                                      color: Colors
                                                          .grey.shade600
                                                          .withOpacity(0.3),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        left: sx(20),
                                                        right: sx(20)),
                                                    width: double.infinity,
                                                    height: sy(60),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Merry A .Gassett',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      sy(14),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: sy(1),
                                                            ),
                                                            Text(
                                                              '5 Miles Away',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: sy(8),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              // navigationService
                                                              //     .navigateTo(
                                                              //         ProfileDetailScreenRoute);
                                                            },
                                                            icon: Icon(
                                                              Icons.more_vert,
                                                              color:
                                                                  Colors.white,
                                                              size: sy(20),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(14, 14, 16, 1),
                                    borderRadius: BorderRadius.circular(sy(8)),
                                  ),
                                  width: double.infinity,
                                  child: Center(
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: icon.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle),
                                                width: icon[i]["icon"] ==
                                                        "assets/images/icon3.png"
                                                    ? sx(90)
                                                    : sx(70),
                                                height: sy(10),
                                                child: Image.asset(
                                                  icon[i]["icon"],
                                                  scale: icon[i]["icon"] ==
                                                          "assets/images/icon3.png"
                                                      ? 5
                                                      : 5,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ));
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ));
                      });
                    },
                  ),
                  size: Size(sx(550), sy(390)),
                  controller: _controller,
                  onForward: (index, info) {
                    print(index);
                  },
                  onBack: (index, info) {
                    print(index);
                  },
                  onEnd: () {
                    print('end');
                  },
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: _buildBottomBar(),
      );
    });
  }

//   Widget _buildBottomBar() {
//     return BottomAppBar(
//         color: Colors.transparent,
//         elevation: 0.0,
//         child: new Padding(
//           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
//           child: new Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Image.asset('assets/images/ARROW_02.png', scale: 3),
//               Container(
//                 height: 70,
//                 width: 70,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(color: const Color(0x11000000), blurRadius: 10.0)
//                   ],
//                   color: Colors.white,
//                 ),
//                 child: Center(
//                   child: IconButton(
//                     icon: Image.asset('assets/images/cross.png', scale: 4),
//                     // color: Colors.lightBlueAccent[300],
//                     onPressed: () {
//                       _controller.back();
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 70,
//                 width: 70,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(color: const Color(0x11000000), blurRadius: 10.0)
//                   ],
//                   color: Colors.white,
//                 ),
//                 child: Center(
//                   child: IconButton(
//                     icon: Image.asset(
//                       'assets/images/Likee.png',
//                       scale: 4,
//                     ),
//                     // color: Colors.lightBlueAccent[300],
//                     onPressed: () {
//                       _controller.forward();
//                     },
//                   ),
//                 ),
//               ),
//               Image.asset('assets/images/ARROW_01.png', scale: 3)
//             ],
//           ),
//         ));
//   }
}
