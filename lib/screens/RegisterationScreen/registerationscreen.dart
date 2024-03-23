

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loaclfilm_festivalhub_project/screens/LoginScreen/loginscreen.dart';
import 'package:loaclfilm_festivalhub_project/screens/LoginScreen/roundbutton.dart';
import 'package:http/http.dart'as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
final _formKey = GlobalKey<FormState>();
Future<void>registerLocalFilm(

String name,String email,String phone,String address,String age,String gender,String language,String password) async {
  const url = 'http://campus.sicsglobal.co.in/Project/Local_Film_Festival/api/user_registration.php?';

  Map<String, String> body = {
  'name':name,
  'email':email,
  'phone':phone,
  'address':address,
  'age':age,
  'gender':gender,
  'language':language,
  'password':password,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      
    );
       var jsonData=json.decode(response.body);

      if (response.statusCode == 200) {
      if(jsonData['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.white,
          content: const Text('Register Successful!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
      Navigator.push(context,MaterialPageRoute(builder:(context)=>const LoginPage()));
      print(body);
      print("Response body${response.body}");
    
      print('Registration successful');
      }
      else{
        jsonData['status']==false;
         // ignore: use_build_context_synchronously
         ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.white,
          content: const Text('User Already Exists !',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          duration: const Duration(seconds: 4),
        ),
      );
         print('Error: ${response.statusCode}');
      }
     
    } else {
       
     print('fffff');
    }
  } catch (error) {
    print('Error: $error');
  }
}



  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passswordcontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();
  TextEditingController agecontroller =TextEditingController();
  TextEditingController gendercontroller=TextEditingController();
  TextEditingController languagecontroller=TextEditingController();
   
  
  
  
    bool loading = false;
  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView
      (
        child: Container(
           decoration: const BoxDecoration(image: DecorationImage(image:AssetImage('assets/bacground.jpg'),fit: BoxFit.cover)),
          child: Padding(
                   padding: const EdgeInsets.all(30),
                   child: Form(
                     key: _formKey,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       SizedBox(height: size.height*0.03),
                         const Center(
                           child: Text(
                             'REGISTER',
                             style:
                                 TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white),
                           ),
                         ),
                         SizedBox(
                           height: size.height * 0.03,
                         ),
                          const Text(
                           'Name',
                           style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold,),
                         ),
                         SizedBox(height: size.height * 0.01),
                         TextFormField(
                           
                            controller: namecontroller,
                           keyboardType: TextInputType.text,
                           decoration:  InputDecoration(
                             
                             fillColor: Colors.white,
                             filled: true,
                             prefixIcon: const Icon(Icons.person_outline,color: Colors.black,),
                               // hintText: 'Enter Phone Number/Email ID/BN User Id',
                               hintText: 'Name',
                               hintStyle: const TextStyle(fontSize: 13),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               validator: (value) {
                                 if(value!.isEmpty){
                                   return 'Please enter your name';
                                 }
                               },
                         ),
                         SizedBox(height: size.height * 0.02),
                         const Text(
                           'Email',
                           style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: size.height * 0.01),
                         TextFormField(
                           controller: emailcontroller,
                           keyboardType: TextInputType.emailAddress,
                           decoration:  InputDecoration(
                              fillColor: Colors.white,
                             filled: true,
                               prefixIcon: const Icon(Icons.email_outlined,color:Colors.black),
                               hintText: 'Email',
                               hintStyle: const TextStyle(fontSize: 13),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               validator: (value) {
                                 if(value!.isEmpty){
                                   return 'Please enter your email';
                                 }
                               },
                         ),
                                    
                           SizedBox(height: size.height * 0.02),
                         const Text(
                           'Phone',
                           style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: size.height * 0.01),
                         TextFormField(
                            controller: phonecontroller,
                           keyboardType: TextInputType.phone,
                           decoration:  InputDecoration(
                              fillColor: Colors.white,
                             filled: true,
                               prefixIcon: const Icon(Icons.phone_android_outlined,color:Colors.black),
                               // hintText: 'Enter Phone Number/Email ID/BN User Id',
                               hintText: 'Phone',
                               hintStyle: const TextStyle(fontSize: 13),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               validator: (value) {
                                 if(value!.isEmpty){
                                   return 'Please enter your phone';
                                 }
                               },
                         ),
                            SizedBox(height: size.height * 0.02),
                         const Text(
                           'Address',
                           style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: size.height * 0.01),
                         TextFormField(
                            controller: addresscontroller,
                           keyboardType: TextInputType.text,
                           decoration:  InputDecoration(
                              fillColor: Colors.white,
                             filled: true,
                               prefixIcon: const Icon(Icons.location_history_outlined,color:Colors.black),
                               // hintText: 'Enter Phone Number/Email ID/BN User Id',
                               hintText: 'Address',
                               hintStyle: const TextStyle(fontSize: 13),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               validator: (value) {
                                 if(value!.isEmpty){
                                   return 'Please enter your address';
                                 }
                               },
                         ),
                         
                           SizedBox(height: size.height * 0.02),
                         const Text(
                           'Age',
                           style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: size.height * 0.01),
                         TextFormField(
                            controller: agecontroller,
                           keyboardType: TextInputType.text,
                           decoration:  InputDecoration(
                              fillColor: Colors.white,
                             filled: true,
                               prefixIcon: const Icon(Icons.phone_android_outlined,color:Colors.black),
                               // hintText: 'Enter Phone Number/Email ID/BN User Id',
                               hintText: 'Phone',
                               hintStyle: const TextStyle(fontSize: 13),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               validator: (value) {
                                 if(value!.isEmpty){
                                   return 'Please enter your phone';
                                 }
                               },
                         ),
                          SizedBox(height: size.height * 0.02),
                         const Text(
                           'Gender',
                           style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: size.height * 0.01),
                         TextFormField(
                          controller: gendercontroller,
                           keyboardType: TextInputType.text,
                           decoration:  InputDecoration(
                              fillColor: Colors.white,
                             filled: true,
                               prefixIcon: const Icon(Icons.person_outline_outlined,color:Colors.black),
                               // hintText: 'Enter Phone Number/Email ID/BN User Id',
                               hintText: 'Gender',
                               hintStyle: const TextStyle(fontSize: 13),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               validator: (value) {
                                 if(value!.isEmpty){
                                   return 'Please enter your gender';
                                 }
                               },
                         ),
                          SizedBox(height: size.height * 0.02),
                         const Text(
                           'Language',
                           style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: size.height * 0.01),
                         TextFormField(
                          controller: languagecontroller,
                           keyboardType: TextInputType.text,
                           decoration:  InputDecoration(
                              fillColor: Colors.white,
                             filled: true,
                               prefixIcon: const Icon(Icons.language_outlined,color:Colors.black),
                               // hintText: 'Enter Phone Number/Email ID/BN User Id',
                               hintText: 'Language',
                               hintStyle: const TextStyle(fontSize: 13),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               validator: (value) {
                                 if(value!.isEmpty){
                                   return 'Please enter your language';
                                 }
                               },
                         ),
                        
                        
                          SizedBox(height: size.height * 0.02),
                         const Text(
                           'Password',
                           style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height: size.height * 0.01),
                         TextFormField(
                          controller: passswordcontroller,
                           keyboardType: TextInputType.text,
                           decoration:  InputDecoration(
                              fillColor: Colors.white,
                             filled: true,
                               prefixIcon: const Icon(Icons.lock_outline,color:Colors.black),
                               // hintText: 'Enter Phone Number/Email ID/BN User Id',
                               hintText: 'Password',
                               hintStyle: const TextStyle(fontSize: 13),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none)),
                               validator: (value) {
                                 if(value!.isEmpty){
                                   return 'Please enter your password';
                                 }
                               },
                         ),
                        
                        
                        
                                     
                         SizedBox(
                           height: size.height * 0.06,
                         ),
                                     
                         RoundButton(
                             title: 'Register',
                             loading: loading,
                             onTap: (){
                                if (_formKey.currentState!.validate()) {
                                  registerLocalFilm(
                                    namecontroller.text.toString(),
                                    emailcontroller.text.toString(),
                                    phonecontroller.text.toString(),
                                    addresscontroller.text.toString(),
                                    agecontroller.text.toString(),
                                    gendercontroller.text.toString(),
                                    languagecontroller.text.toString(),
                                    passswordcontroller.text.toString()
                     
                
                 );


                
                  }
                          
                             }),
                        
                           
                       
                       ],
                     ),
                   ),
                 ),
        ),
      ),
    );
  }
}