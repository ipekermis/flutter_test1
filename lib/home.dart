import 'package:flutter/material.dart';

import 'detailed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,



      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: const [
                            Text(
                              'Explore',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Aspen, USA',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          textAlign: TextAlign.start,
                          'Aspen',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Find things to do',
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    controller: _tabController,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,

                    //isScrollable: true,
                    indicator: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelColor: Colors.blue[700],

                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    dividerHeight: 0,
                    dividerColor: Colors.transparent,
                    splashBorderRadius: BorderRadius.circular(20),
                    tabs: [
                      _buildTab("Location"),
                      _buildTab("Hotels"),
                      _buildTab("Food"),
                      _buildTab("Adventure"),
                      _buildTab("Activities"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 290,

                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      children: [
                        _popularCard(
                          'assets/images/Rectangle1.png',
                          'Alley Palace',
                          "4.1",
                        ),
                        const SizedBox(width: 15),
                        _popularCard(
                          'assets/images/Rectangle2.png',
                          'Coeurdes Alpes',
                          "4.5",
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      children: [
                        _recommendedCard(
                          "Explore Aspen",
                          "4N/5D",
                          "assets/images/rec1.png",
                        ),
                        const SizedBox(width: 20),
                        _recommendedCard(
                          "Luxurious Aspen",
                          "2N/3D",
                          "assets/images/rec2.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: Container(
          //     child: BottomNavigationBar(
          //       currentIndex: 0,
          //       type: BottomNavigationBarType.fixed,
          //       selectedItemColor: Colors.blue,
          //       items: const [
          //         BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          //         BottomNavigationBarItem(
          //           icon: Icon(Icons.airplane_ticket),
          //           label: '',
          //         ),
          //         BottomNavigationBarItem(
          //           icon: Icon(Icons.favorite_border),
          //           label: '',
          //         ),
          //         BottomNavigationBarItem(
          //           icon: Icon(Icons.person_outline),
          //           label: '',
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        height: 100,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4), // gölge rengi
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(
                0,
                -5,
              ), // yukarıya doğru gölge (üstten border gibi)
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/Home.png"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/Ticket.png"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/Heart.png"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/Profile.png"),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _popularCard(String imagePath, String title, String rating) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailedScreen(
                  imagePath: imagePath,
                  title: title,
                  rating: rating,
                ),
          ),
        );
      },
      child: SizedBox(
        width: 210,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 245,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              //Image.asset(imagePath, fit: BoxFit.cover),
              Positioned(
                left: 10,
                bottom: 82,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4D5652),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(title, style: TextStyle(color: Colors.white)),
                ),
              ),
              Positioned(
                left: 12,
                bottom: 60,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF4D5652),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text(rating, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const Positioned(
                right: 25,
                bottom: 55,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Icon(Icons.favorite, color: Colors.red, size: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String data) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:10),

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(data),
      ),
    );
  }

  Widget _recommendedCard(String title, String ratio, String imagePath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 170,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 50,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green[900],

                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white, // Beyaz çizgi rengi
                    width: 1.5, // Kalınlığı (dilersen 1.5 ya da 3 yapabilirsin)
                  ),
                ),
                child: Text(
                  ratio,
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ),

            Positioned(
              bottom: 37,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
