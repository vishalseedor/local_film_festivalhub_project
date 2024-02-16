
import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/screens/LoginScreen/BottomNavigationScreen/bottomnavigationscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/RegisterationScreen/registerationscreen.dart';
import 'roundbutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  bool rememberMe = true;
  bool loading = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  final _formKey = GlobalKey<FormState>();

 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SafeArea(
        child: Scaffold(
          backgroundColor:Colors.black,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
              
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/login.png',
                          height: 280,
                          width: 3500,
                        ),
                      ),
                      const Center(
                        child: Text(
                          'LOGIN',
                          style:
                              TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                       const Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormField(
                        
                          controller: emailcontroller,
                        keyboardType: TextInputType.phone,
                        decoration:  InputDecoration(
                          
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.email_outlined,color: Colors.black,),
                            // hintText: 'Enter Phone Number/Email ID/BN User Id',
                            hintText: 'Email',
                            hintStyle: const TextStyle(fontSize: 13),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                      ),
                      SizedBox(height: size.height * 0.03),
                      const Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormField(
                        //  controller: emailController,
                        keyboardType: TextInputType.phone,
                        decoration:  InputDecoration(
                           fillColor: Colors.white,
                          filled: true,
                            prefixIcon: Icon(Icons.lock_outline,color:Colors.black),
                            // hintText: 'Enter Phone Number/Email ID/BN User Id',
                            hintText: 'Password',
                            hintStyle: TextStyle(fontSize: 13),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    rememberMe = !rememberMe;
                                    setState(() {});
                                  },
                                  child: Container(
                                    //margin: const EdgeInsets.only(left: 7),
                                    width: size.width * 0.05,
                                    height: size.height * 0.025,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(
                                            color: rememberMe
                                                ? Colors.blue
                                                : Colors.black)),
                                    child: Center(
                                        child: rememberMe
                                            ? const Icon(
                                                Icons.done,
                                                size: 15,
                                                color: Colors.black,
                                              )
                                            : Container()),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text('Remember me',style: TextStyle(color: Colors.white),)
                              ],
                            ),
                        
                            
                            InkWell(
                              onTap: () {
                                
                              },
                              child: const Text(
                                '',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                                
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                                
                      RoundButton(
                          title: 'Login',
                          loading: loading,
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder:(context)=>const BottomNavigationScreen()));
                        
                          }),
                              SizedBox(
                        height: size.height * 0.01,
                      ),
                                
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account ?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              TextButton(onPressed: (){
                           Navigator.push(context,MaterialPageRoute(builder: (context)=>const RegisterScreen()));
                  
                              }, child:const Text('Register',style: TextStyle(color:Colors.blueAccent,fontWeight: FontWeight.bold),))
                            ],
                          )
                    
                    ],
                  ),
                ),
              ),
            )),
      );
    
  }
}
