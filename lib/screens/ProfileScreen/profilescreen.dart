import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State variables for user information
  String _name = "";
  String _email = "";
  String _mobileNumber = "";
  DateTime _dateOfBirth = DateTime.now();
  String _sex = ""; // Possible values: male, female, other

  // Function to handle saving profile changes
  void _saveProfile() {
    // Implement your saving logic here, e.g., store data in a database or local storage
    print("Profile saved: $_name, $_email, $_mobileNumber, $_dateOfBirth, $_sex");

    // Show a success message or handle errors
  }

  // Function to handle date picker selection
  void _onDateOfBirthSelected(DateTime newDate) {
    setState(() {
      _dateOfBirth = newDate;
    });
  }

  // Function to handle sex radio button selection
  void _onSexSelected(String value) {
    setState(() {
      _sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Profile',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),),
              const SizedBox(height: 20.0),

             Stack(
  children: [
    const CircleAvatar(
      backgroundColor: Color(0xff00A3FF),
      backgroundImage: AssetImage("assets/profile.jpg"),
      radius: 70.0,
    ),
    Positioned(
      right: 5,
      bottom: 0,
      child: Container(
        child: const Icon(Icons.camera_alt_outlined,color: Colors.black,size: 20,),
        padding: const EdgeInsets.all(7.5),
        decoration: BoxDecoration(
          border: Border.all(
          width: 1,
          color: Colors.white
        ),
        borderRadius: BorderRadius.circular(90.0),
        color: Colors.grey[200]
        )
      )
    )
  ]
),
            // Profile picture section
         //   profilePicture(), // Replace with your implementation

            // User information section
            const SizedBox(height: 20.0),
            TextField(
              decoration: const InputDecoration(
                labelText: "Name",
              ),
              onChanged: (value) => _name = value,
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => _email = value,
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: "Mobile Number",
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) => _mobileNumber = value,
            ),
            const SizedBox(height: 10.0),
          
             TextField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_month),
            labelText: "Date of Birth",
                          ),
                          keyboardType: TextInputType.phone,
                          onChanged: (value) => _mobileNumber = value,
                        ),
            const SizedBox(height: 10.0),
             TextField(
              decoration: const InputDecoration(
                labelText: "Address",
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) => _mobileNumber = value,
            ),

            // Row(
            //   children: [
            //     Text("Sex:"),
            //     SizedBox(width: 10.0),
            //     Row(
            //       children: [
            //         Radio<String>(
            //           value: "male",
            //           groupValue: _sex,
            //           onChanged: (value) => _onSexSelected(value!),
            //         ),
            //         Text("Male"),
            //         SizedBox(width: 10.0),
            //         Radio<String>(
            //           value: "female",
            //           groupValue: _sex,
            //           onChanged: (value) => _onSexSelected(value!),
            //         ),
            //         Text("Female"),
            //         SizedBox(width: 10.0),
            //         Radio<String>(
            //           value: "other",
            //           groupValue: _sex,
            //           onChanged: (value) => _onSexSelected(value!),
            //         ),
            //         Text("Other"),
            //       ],
            //     ),
            //   ],
            // ),
            const SizedBox(height: 25.0),

            // Action buttons section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: _saveProfile,
                  child: const Text("Save Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: _saveProfile,
                  child: const Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget profilePicture() {
  //   // Replace with your desired profile picture implementation
  //   // (e.g., placeholder
  // }
}