import 'package:culinary_marketplace/items.dart';
import 'package:culinary_marketplace/models.dart';
import 'package:culinary_marketplace/nabar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final double ContainerHeight = 30; // Adjust as needed
  final double ContainerWidth = 300; // Adjust as needed

  late Future<void> _categoriesFuture;
  late Future<void> _mealsFuture;

  List<Item> categories = [];
  List<Model> meals = [];

  int myindex = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    _categoriesFuture = _getcategories();
    _mealsFuture = _getmeals();
    await Future.wait([_categoriesFuture, _mealsFuture]);
    setState(() {
      // Update state variables once the futures are completed
    });
  }

  Future<void> _getcategories() async {
    categories = await Item.getitem();
  }

  Future<void> _getmeals() async {
    meals = await Model.getmodel();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(
          255,
          182,
          81,
          19,
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: NavBar(),
      backgroundColor: Colors.white,
      body: FutureBuilder<void>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              "lib/assets/image_5.png",
                              height: 300,
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.topCenter,
                            ),
                            Positioned(
                              left: (MediaQuery.of(context).size.width -
                                      ContainerWidth) /
                                  2.0,
                              child: Container(
                                width: ContainerWidth,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    border: InputBorder.none,
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            'Look what you love....',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                ...categories.map((category) => Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Container(
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: category.boxcolor
                                              .withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            category.name,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(width: 20),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Newly added',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 200,
                          color: const Color.fromARGB(255, 169, 194, 238),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                ...meals.map((meal) => Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Container(
                                        width: 210,
                                        decoration: BoxDecoration(
                                          color: meal.boxColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                            // Add your content here, such as an Image or Text
                                            ),
                                      ),
                                    )),
                                SizedBox(width: 20),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: const Color.fromARGB(255, 90, 61, 50),
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/recipes');
              break;
            case 2:
              Navigator.pushNamed(context, '/cart');
              break;
          }
        },
        currentIndex: myindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.orangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recipes',
            backgroundColor: Colors.orangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.orangeAccent,
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 21, 88, 143),
      ),
    );
  }
}
