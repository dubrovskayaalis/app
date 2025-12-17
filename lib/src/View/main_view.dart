import 'package:app/src/Model/product.dart';
import 'package:app/src/ViewModel/main_vm.dart';
import 'package:app/src/Widgets/choise_hor_slidebar.dart';
import 'package:app/src/Widgets/menu_card.dart';
import 'package:app/src/Widgets/nav_bar_icons_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String _selectedCategory = "Все";

  List<Product> _getFilteredMenu() {
    if (_selectedCategory == "Все") {
      return getMenu();
    }
    return getMenu(_selectedCategory);
  }

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
    });
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.sports_esports, color: const Color.fromARGB(255, 255, 0, 0)),
                SizedBox(width: 10),
                Text(
                  "Gamer's Breew",
                  style: TextStyle(color: const Color.fromARGB(255, 248, 245, 245)),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.account_circle_outlined),
              color: const Color.fromARGB(255, 248, 245, 245),
              onPressed: () {Navigator.pushNamed(context, "/profile");},
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                ),
                items: getCarouselImages().map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            image: i.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: 'Найти напиток или закуску',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  height: 50.0,
                  child: HorSliderBar(
                    items: ["Все", ...getCategoryList()],
                    onCategoryChanged: _onCategoryChanged,
                    ),
                ),
              ),
              Text(
                "Меню",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 245, 245),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),          
              LayoutBuilder(
              builder: (context, constraints) {
                final filteredMenu = _getFilteredMenu();
                final crossAxisCount = (constraints.maxWidth / 220).floor();
                
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount < 1 ? 1 : crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: filteredMenu.length,
                  itemBuilder: (context, index) {
                    return MenuCard(product: filteredMenu[index]);
                  },
                );
              },
            ),
            SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 17, 0),
                borderRadius: BorderRadius.circular(45),
                boxShadow: [BoxShadow(
                              color: const Color.fromARGB(174, 255, 3, 3),
                              blurRadius: 15,
                              offset: Offset(0, 0),
                            )]
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 50
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),                
                onPressed: () {Navigator.pushNamed(context, "/shopping_cart");},
              ),
            ),
        backgroundColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        onPressed: () {},
        ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Color.fromARGB(255, 25, 22, 25),
        child: NavBarIconsButton(
          iconsList: [
            ("Главная", Icons.home, () {}),
            ("Меню", Icons.restaurant_menu, () {}),
            ("Корзина", Icons.local_mall, () {Navigator.pushNamed(context, "/shopping_cart");}),
            ("Профиль", Icons.person, () {Navigator.pushNamed(context, "/profile");}),
          ],
        ),
      ),
    );
  }
}

