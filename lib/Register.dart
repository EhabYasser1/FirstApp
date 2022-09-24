import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled15/Home.dart';
import 'package:untitled15/HomeScreen.dart';

import 'package:untitled15/Login.dart';
import 'package:untitled15/Provider/Register_Provider.dart';

class Register extends StatelessWidget {
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var phoneController=TextEditingController();
  var formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {




    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('REGISETR',
                      style: TextStyle(color: Colors.black, fontSize: (50))),
                  const Text(
                    "REGISTER now to see our products",
                    style: TextStyle(color: Colors.grey, fontSize: (20)),
                  ),
                  const SizedBox(
                    height: 15,
                    width: 20,
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
                    width: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value){
                      if (value!.isEmpty){
                        return "email address must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(

                      ),
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey,
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
                        return "password must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(

                      ),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<RegisterProvider>(
                   builder: (context,registerprovider,child) {
                     return ElevatedButton(

                       child : const Text('Register'),
                       onPressed: () {
                         print(nameController.text);
                         print(emailController.text);
                         print(passController.text);
                         print(phoneController.text);
                         if (registerprovider.registerModel?.status == false) {
                           ScaffoldMessenger.of(context)
                               .showSnackBar(SnackBar(
                             content: Text(
                                 registerprovider.registerModel!.message
                                     .toString()),
                             duration: Duration(seconds: 1),
                             backgroundColor: Colors.blue,
                           ));
                         } else {
                           Navigator.pushReplacement(context,
                               MaterialPageRoute(builder: (context) => HomeScreen()));
                         };
                       }
                       );
       }
                  ),



                   SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('you have an account?'),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
                      }, child: const Text('Sign in'))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
