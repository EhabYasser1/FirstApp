



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled15/Provider/Category_Provider.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _FavoriteState();
}

class _FavoriteState extends State<Category> {
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .getAllCategory();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<CategoryProvider>(
      builder:(context, category, child) {
        return category.category==null?

        const Center(
          child: CircularProgressIndicator(color: Colors.blue),
        ):
          ListView.builder(
            itemCount: category.category?.data!.data!.length,
              itemBuilder: ((context, index) {
                return Container(
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue
                  ),
                  child: Column(
                    children: [
                      Image.network(category.category?.data!.data![index].image??""),




                      Text("${category.category?.data!.data![index].name!}")
                    ],
                  ),
                );
              })





          );
      },
    );
  }
}

