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
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: SafeArea(
        child: Container(
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
              SizedBox(height: 20,),
              Wrap(
                children: [
                  Container(
                      height: 160,
                      width: 160,
                      child: Image.asset(AppImageassets.richdad)),
                  Container(
                      height: 160,
                      width: 160,
                      child: Image.asset(
                        AppImageassets.rye,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
