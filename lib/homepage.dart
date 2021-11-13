import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tabs.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 40.0,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFFC6E7FE),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('images/avatar.png'),
                        fit: BoxFit.contain,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: const Offset(0.0, 3.0),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'ARE YOU HUNGRY?',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 50.0,
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: const EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Search Food',
                  hintStyle: const TextStyle(
                    fontSize: 15.0,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Recommended For You',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildListItem('Burger', 'images/burger.png', '100',
                      const Color(0xFFe76f51).withOpacity(0.7), Colors.white),
                  _buildListItem('Pizza', 'images/pizza.png', '200',
                      const Color(0xFF335c67).withOpacity(0.7), Colors.white),
                  _buildListItem('Soft Drinks', 'images/softdrinks.png', '50',
                      const Color(0xFF3d5a80).withOpacity(0.7), Colors.white),
                  _buildListItem('Combo', 'images/combo.png', '300',
                      const Color(0xFF9e2a2b).withOpacity(0.7), Colors.white),
                ],
              )),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black.withOpacity(0.5),
              labelStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(child: Text('OFFER')),
                Tab(child: Text('FAVOURITE')),
                Tab(child: Text('RECOMMENDED')),
                Tab(child: Text('FEATURED')),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: tabController,
              children: const [
                Tabs(),
                Tabs(),
                Tabs(),
                Tabs(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


_buildListItem(String foodName, String imgPath, String price, Color bgColor,
    Color textColor) {


  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: InkWell(
      onTap: () {
        // TODO : Food Page Navigator
      },
      child: Container(
        height: 175.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: foodName,
              child: Container(
                height: 75.0,
                width: 75.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    imgPath,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              foodName,
              style: TextStyle(
                fontSize: 17.0,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'INR ' + price,
              style: TextStyle(
                fontSize: 17.0,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
