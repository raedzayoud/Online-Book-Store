import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlinebook/controller/homebook_controller.dart';
import 'package:onlinebook/core/constant/imageassets.dart';

class Homebook extends StatelessWidget {
  const Homebook({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomebookController());

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.home)),
          SizedBox(width: 20,),
          IconButton(onPressed: (){}, icon: Icon(Icons.home)),
          SizedBox(width: 20,),
          IconButton(onPressed: (){}, icon: Icon(Icons.home)),
          SizedBox(width: 20,),
          IconButton(onPressed: (){}, icon: Icon(Icons.home))
        ],),
        
      ),
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Text(
                "Welcome Back, Bunny!",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                "What do you want to \nread today?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_voice),
                  ),
                  hintText: "Search",
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GetBuilder<HomebookController>(
                builder: (controller) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(controller.categoriesBook.length,
                          (index) {
                        bool isSelected = index == controller.selectedIndex;
                        return GestureDetector(
                          onTap: () {
                            controller.updateSelectedIndex(index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: isSelected
                                    ? Border(
                                        bottom: BorderSide(
                                            color: Colors.blue, width: 3))
                                    : null),
                            child: Text(
                              controller.categoriesBook[index],
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true, // Shrink the GridView to fit its content
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
                childAspectRatio: 0.75, // Ratio to control card size (width/height)
                children: [
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          child: Image.asset(AppImageassets.richdad),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "RICH DAD",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Robert Kiyosaki",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          child: Image.asset(AppImageassets.rye),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "RICH DAD",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Robert Kiyosaki",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
