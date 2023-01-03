import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism/textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

var register = SnackBar(content: Text("Account Registered Sucessfully"));
bool checkBox = true;
bool Tap = false;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController retypePasswordController = TextEditingController(); 
TextEditingController usernameController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text("Account Registertaion"), backgroundColor: Colors.transparent,
      ),
      body: 
      Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill)
          ),),
          Positioned(
            top: MediaQuery.of(context).size.height*0.15,
            left: MediaQuery.of(context).size.height*0.05,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: GestureDetector(
                  onTapUp: (_){setState(() {
                    Tap = false;
                  });},
                  onTapDown: (_){
                    setState(() {
                      Tap = true;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Tap ? Colors.white.withOpacity(0.8): Colors.white.withOpacity(0.7)),
                      color: Tap ? Colors.white.withOpacity(0.75) : Colors.white.withOpacity(0.65),
                    ),
                    child: Column(children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      buildTextField("Email", emailController, Icon(Icons.email_outlined, color: Colors.black,)),
                      buildTextField("Username", usernameController, Icon(Icons.account_circle)),
                      buildTextField("Password", passwordController, Icon(Icons.lock, color: Colors.black)),
                      buildTextField("ReType-Password", retypePasswordController, Icon(Icons.lock, color: Colors.black)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Row(children: [
                        InkWell(
                        onTap: (){setState(() {
                          checkBox = !checkBox;
                        });},  
                        child: checkBox ? Icon(Icons.check_box_outline_blank_outlined) : Icon(Icons.check_box)),
                        Text("Remember me"),
                        Spacer(),
                      ],),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    MaterialButton(
                      color: Colors.blue[900],
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(register);
                        // Navigator.pop(context);
                      },
                      child: Text("Create Account", style: TextStyle(color: Colors.white),),
                      ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.00625,),
                    ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}