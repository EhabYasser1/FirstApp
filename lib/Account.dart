import 'package:flutter/material.dart';
class Account extends StatelessWidget {
 // const Account({Key? key}) : super(key: key);
var nameController =TextEditingController();
var passController = TextEditingController();
var phoneController = TextEditingController();

  Account({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
      children: [
        Stack(
         // alignment: Alignment.center,
          children: [


            Container(
              width: double.infinity,
              height: 260,

                decoration: const BoxDecoration(color: Colors.white),
            ),
            Container(
              width: double.infinity,
              height: 160,

              decoration: const BoxDecoration(color: Colors.blue),
            ),
            Positioned(
              left: 135,
              top:  100.0,
              child: Container(child:IconButton(icon:const Icon(Icons.camera_alt), onPressed: () {  },),
              width: 100,
              height: 100,

              decoration: const BoxDecoration(color: Colors.grey,shape: BoxShape.circle,),
            ),
            ),




          ],
        ),
        TextFormField(
          controller: nameController,
          validator: (value){
            if (value!.isEmpty){
              return "Name must not be empty";
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(

            ),
            prefixIcon: Icon(Icons.person),
            labelText: 'Name',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: passController,
          validator: (value){
            if (value!.isEmpty){
              return "Password must not be empty";
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(

            ),
            prefixIcon: Icon(Icons.lock),
            labelText: 'Password',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: phoneController,
          validator: (value){
            if (value!.isEmpty){
              return "phone must not be empty";
            }
            return null;
          },
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            border: OutlineInputBorder(

            ),
            prefixIcon: Icon(Icons.phone_android),
            labelText: 'Phone',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ],
      )

    );
  }
}
