import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_change/passwordChange.dart';

class accountDetails extends StatefulWidget {
  const accountDetails({super.key});

  @override
  State<accountDetails> createState() => _accountDetailsState();
}

class _accountDetailsState extends State<accountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          'Password and Account',
          style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: Container(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF90CAF9),
                ),
                child: const Text('Please check your sign in & security details. Click on it if you would like to update your details',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              ),
              const Text('Account access', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Main email', style: TextStyle(fontSize: 15),),
                  const SizedBox(width: 15),
                  Expanded(
                      child: TextFormField(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
        
              Row(
                children: [
                  const Text('Phone', style: TextStyle(fontSize: 15),),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
        
              Row(
                children: [
                  const Text('Change Password', style: TextStyle(fontSize: 15),),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(obscureText: true),
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const mainPage()));
                      },
                      icon: const Icon(Icons.chevron_right),
                  )
                ],
              ),
              
              Container(
                height: 60,
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),

        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.all(20),
          height: 90,
          child: FilledButton(
            onPressed: (){
              setState(() {});
            },
            style: FilledButton.styleFrom(
                backgroundColor: const Color(0xff000000),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
            child: const Text('Save', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        )
    );
  }
}
