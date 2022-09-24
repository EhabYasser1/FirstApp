import 'package:flutter/material.dart';
import 'package:untitled15/Home.dart';
import 'package:untitled15/HomeScreen.dart';
//import 'package:untitled14/Register.dart';
import 'package:untitled15/Register.dart';
class login extends StatelessWidget {
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var formkey = GlobalKey<FormState>();

  login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 100),


        child:Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Text('Login',style: TextStyle(fontSize: (50)),),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  validator: ((value) {
                    if(value!.isEmpty){
                      return "email address must not be empty";
                    }

                    return null;
                  }
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(

                      ),
                      prefixIcon: Icon(Icons.email),
                      labelText: 'EmailAddress',
                      labelStyle: TextStyle(color: Colors.grey)
                  ),
                ) ,
                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: passController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Password ot be empty ';
                    }
                    return null;
                  },
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder(

                    ),
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password ',
                    labelStyle: TextStyle(color: Colors.grey),

                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed:() {
                  if(formkey.currentState!.validate()){

                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen())
                     );}
                },
                    child: const Text('Login')
                ),Row(
                  children: [
                    const Text('I do not have an account'),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => Register(),));
                    }, child: const Text('Register'))

                  ],
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
