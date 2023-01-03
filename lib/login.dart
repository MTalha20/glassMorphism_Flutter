import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism/singup.dart';
import 'package:glassmorphism/textfield.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

bool Tap = false;
var logging = SnackBar(content: Text("Logged In"));
bool checkBox = true;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text("Glassmorphism Flutter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),),
      body: Stack(
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
                filter:ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: GestureDetector(
                  onTapUp: (_){
                    setState(() {
                      Tap = false;           
                    });
                  },
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
                      border: Border.all(color: Tap ? Colors.white.withOpacity(0.8) : Colors.white.withOpacity(0.7)),
                      color: Tap ? Colors.white.withOpacity(0.75) : Colors.white.withOpacity(0.65),
                    ),
                    child: Column(children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      buildTextField("Username or email", emailController, Icon(Icons.account_circle_sharp, color: Colors.black,)),
                      buildTextField("Password", passwordController, Icon(Icons.lock, color: Colors.black)),
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
                        Text("Forget Password?", style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 13, 71, 161)))
                      ],),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    MaterialButton(
                      color: Colors.blue[900],
                      onPressed: (){ScaffoldMessenger.of(context).showSnackBar(logging);},
                      child: Text("Login", style: TextStyle(color: Colors.white),),
                      ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.00625,),
                    Text("or"),
                    SizedBox(height: MediaQuery.of(context).size.height*0.00625,),
                    Text("Sign in With"),
                    SizedBox(height: MediaQuery.of(context).size.height*0.00625,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image.asset("assets/fb-logo.png", width: 60, height: 60,),
                      Image.asset("assets/google-logo.png", width: 20, height: 20,),
                    ],),
                    InkWell(
                      onTap: (() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup()))),
                      child: RichText(text: TextSpan(text: "if you do not have an account ", style: TextStyle(color: Colors.black), children: [
                        TextSpan(text: "Sign Up", style: TextStyle(color: Color.fromARGB(255, 13, 71, 161), fontWeight: FontWeight.bold))
                      ]),
                      
                      ),
                    )
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