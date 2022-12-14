import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled15/Model/Home_Model.dart';
import 'package:untitled15/Provider/Home_Provider.dart';




class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _HomeScreenState();
}



HomeModel? homeModel;
class _HomeScreenState extends State<home> {

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false)
        .getAllData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeProvider>(
      builder: (context,HomeProv,child){
        return HomeProv.home==null?

        const Center(
          child: CircularProgressIndicator(color: Colors.blue),
        )
            : Column(
            children: [

              Expanded(
                child:
                GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 4.0,
                      childAspectRatio: .8),
                  itemCount:HomeProv.home!.data!.products?.length,
                  itemBuilder: (context, index) {
                    return HomeProv.home!.data!.products!.isEmpty?const CircularProgressIndicator():
                    Container(
                      margin:  const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,
                            color: Colors.red),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(

                                  width: MediaQuery.of(context).size.height,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:HomeProv.home?.data!.products![index].image == null
                                          ? const NetworkImage(
                                          "https://cutz.com.eg/uploads/product_images/default.png")
                                          : NetworkImage(
                                          HomeProv.home?.data!.products![index].image??"".toString()),
                                    ),
                                  )),
                              const Positioned(
                                  right: 10,
                                  top: 5,
                                  child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.blue
                                  )
                              ),
                              Positioned(
                                  left: 10,
                                  top: 0.0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    decoration: const BoxDecoration(

                                      color: Color(0xffBFE2FF),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(4.0),
                                          bottomLeft: Radius.circular(4.0)),
                                    ),
                                    child: Column(
                                      children: [
                                        const Icon(Icons.flash_on,
                                            color: Color(0xffdb1313), size: 20.0),
                                        Text(
                                          HomeProv.home?.data!.products![index].discount == null
                                              ? "0%"
                                              : "${HomeProv.home?.data!.products![index].discount.toString()}%",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          ListTile(
                            isThreeLine: false,
                            title: Text(
                              HomeProv.home?.data!.products![index].name??"",
                              maxLines: 1,
                            ),
                            subtitle: Text(
                              HomeProv.home?.data!.products![index].name??"",
                              maxLines: 1,
                            ),
                            minVerticalPadding: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    HomeProv.home?.data!.products![index].price==null
                                        ? const SizedBox()
                                        : Row(
                                      children: [
                                        const Text("EGP"),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text("${ HomeProv.home?.data!.products![index].price??"".toString()}"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("EGP"),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          HomeProv.home?.data!.products![index].oldPrice == null
                                              ? ""
                                              :  HomeProv.home!.data!.products![index].oldPrice.toString(),
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              color: Colors.grey[400]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffCA252B)),
                                  child: const Icon(Icons.shopping_cart_outlined,
                                      color: Colors.white, size: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ]);
      },
    );
  }
}
