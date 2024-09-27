import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController retypePassword = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  bool isValid=false;
  String errorMessage='';
  String val='';

  bool validatePassword(String newPassword){
    errorMessage='';
    
    if(newPassword.length<8)
      errorMessage +='Create a new password that has at least 8 characters \n';

    if(!newPassword.contains(RegExp(r'[A-Z]')))
      errorMessage +='Create a new password that has at least uppercase character \n';
    
    if(!newPassword.contains(RegExp(r'[a-z]')))
      errorMessage +='Create a new password that has at least one lowercase character \n';
    
    if(!newPassword.contains(RegExp(r'[0-9]')))
      errorMessage +='Create a new password that has at least one digit \n';

    if (!newPassword.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]')))
      errorMessage += 'Create a new password that has at least least one special character \n';

    return errorMessage.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text('Change password', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        leading: Container(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back, color: Colors.black,)
          ),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isValid?
                  const Text('Valid Password', style: TextStyle(color: Colors.green),) :
                  Text('Invalid Password.  $errorMessage', style: TextStyle(color: Colors.black),),

              // form.currentState!.validate()?
              //     const Text('Password Matched', style: TextStyle(color: Colors.green),) :
              //     Text('Password not marched, re-enter password', style: TextStyle(color: Colors.red),),

              const SizedBox(height: 20,),
              const Text('New Password', style: TextStyle(fontWeight: FontWeight.w500),),
              const SizedBox(height: 10,),
              TextField(
                controller: currentPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                 filled: true,
                  fillColor: const Color(0xFFE3F2FD),
                  hintText:'Current Password',
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: newPassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFE3F2FD),
                  hintText: 'New Password',
                  suffixIcon: IconButton(
                      onPressed: (){},
                      icon: const Text('Show', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                  )
                ),
                validator: (val){
                  if(val?.isEmpty?? true){
                    return 'Password field is empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: retypePassword,
                obscureText: true,
                validator: (val){
                  if(val?.isEmpty?? true)
                    return 'Password is empty';
                  else if(val!=newPassword.text){
                    return 'Password does not match';
                  }
                  return null;
                },

                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFE3F2FD),
                  hintText: 'Retype Password',
                    suffixIcon: IconButton(
                        onPressed: (){},
                        icon: const Text('Show', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                    )
                ),
              ),
              const SizedBox(height: 15,),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(20),
        height: 90,
        child: FilledButton(
            onPressed: (){
              setState(() {
                isValid=validatePassword(newPassword.text);
              });
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
