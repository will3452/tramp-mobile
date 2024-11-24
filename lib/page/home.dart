import 'package:flutter/material.dart';
import 'package:tramp_flutter/page/form-request.dart';
import 'package:tramp_flutter/page/login.dart';
import 'package:tramp_flutter/page/maps.dart';
import 'package:tramp_flutter/page/messages.dart';
import 'package:tramp_flutter/page/schedule.dart';
import 'package:tramp_flutter/page/trip-history.dart';
import 'package:tramp_flutter/page/trips.dart';
import 'package:tramp_flutter/storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String userName = box.read('userName');
  final String userEmail = box.read('userEmail');
  final String userType = box.read('userType');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(76, 175, 80, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/images/user-account.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$userName ($userType)",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "$userEmail",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // ListTile(
            //   title: const Text("Message"),
            //   leading: Icon(Icons.chat),
            // ),
            ListTile(
              title: const Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: () {
                box.erase();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: box.read('userType') == 'Driver'
          ? SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage("assets/images/header.png"),
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 140,
                                ),
                                HomeMenu(
                                  assetImage: 'assets/images/calendar-page.png',
                                  page: SchedulePage(),
                                  label: "Schedule",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 140,
                                ),
                                HomeMenu(
                                  assetImage: 'assets/images/map.png',
                                  page: MapPage(),
                                  label: "Map",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 140,
                                ),
                                HomeMenu(
                                  assetImage: 'assets/images/mail.png',
                                  page: ChatPage(),
                                  label: "Messages",
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 16,
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Column(
                              children: [
                                HomeMenu(
                                  assetImage: 'assets/images/packing-list.png',
                                  page: TripHistory(),
                                  label: "Trip History",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage("assets/images/header.png"),
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 140,
                                ),
                                HomeMenu(
                                  assetImage: 'assets/images/car-rental.png',
                                  page: FormRequest(),
                                  label: "Vehicle Request",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 140,
                                ),
                                HomeMenu(
                                  assetImage: 'assets/images/calendar-page.png',
                                  page: SchedulePage(),
                                  label: "Schedule",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 140,
                                ),
                                HomeMenu(
                                  assetImage: 'assets/images/bus-ticket.png',
                                  page: TripPage(),
                                  label: "Trips",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                HomeMenu(
                                  assetImage: 'assets/images/map.png',
                                  page: MapPage(),
                                  label: "Map",
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            Column(
                              children: [
                                HomeMenu(
                                  assetImage: 'assets/images/mail.png',
                                  page: ChatPage(),
                                  label: "Messages",
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width: 32,
                            // ),
                            // Column(
                            //   children: [
                            //     HomeMenu(
                            //       assetImage: 'assets/images/profile.png',
                            //       page: FormRequest(),
                            //       label: "Profile",
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
      // bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: 0,
      //     onTap: (value) => {
      //           if (value == 1)
      //             {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => TripPage()),
      //               )
      //             }
      //         },
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.file_present),
      //         label: "Trips",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.map),
      //         label: "Map",
      //       ),
      //       // BottomNavigationBarItem(
      //       //   icon: Icon(Icons.abc),
      //       //   label: "Message",
      //       // ),
      //       // BottomNavigationBarItem(
      //       //   icon: Icon(Icons.verified_user),
      //       //   label: "Profile",
      //       // ),
      //     ]),
    );
  }
}

class HomeMenu extends StatelessWidget {
  final String assetImage;
  final dynamic page;
  final String label;
  const HomeMenu({
    super.key,
    required this.assetImage,
    required this.page,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Column(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 215, 215, 215),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Image.asset(
                assetImage,
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
            ),
            Text("$label"),
          ],
        ));
  }
}
