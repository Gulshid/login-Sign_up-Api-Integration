import 'package:api_integration/Resources/Componenet/round_buttons.dart';
import 'package:api_integration/Routes/Routes_name.dart';
import 'package:api_integration/utills/utills.dart';
import 'package:api_integration/view-model/Api_Integ_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();

  FocusNode emailfocusnode = FocusNode();
  FocusNode passwordfocusnode = FocusNode();

  ValueNotifier<bool> obsecured = ValueNotifier<bool>(false);
  @override
  void dispose() {
    _email_controller.dispose();
    _password_controller.dispose();

    emailfocusnode.dispose();
    passwordfocusnode.dispose();

    obsecured.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<ApiIntegViewmodel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sign up Screen View', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              //1st Textfield for email
              TextFormField(
                onFieldSubmitted: (value) {
                  Utills.fieldfocusNode(
                    context,
                    emailfocusnode,
                    passwordfocusnode,
                  );
                },
                canRequestFocus: true,
                focusNode: emailfocusnode,
                style: TextStyle(color: Colors.black),
                controller: _email_controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  // labelStyle: TextStyle(color: Colors.teal),
                  prefixIcon: Icon(Icons.alternate_email, color: Colors.blue),
                  hintStyle: TextStyle(color: Colors.indigo),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              ValueListenableBuilder(
                valueListenable: obsecured,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passwordfocusnode,
                    style: TextStyle(color: Colors.black),
                    obscureText: obsecured.value,
                    obscuringCharacter: '*',
                    controller: _password_controller,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      labelText: 'Password',
                      // labelStyle: TextStyle(color: const Color.fromARGB(255, 11, 185, 168)),
                      suffixIcon: InkWell(
                        onTap: () {
                          obsecured.value = !obsecured.value;
                        },
                        child: Icon(
                          obsecured.value
                              ? Icons.visibility_off
                              : Icons.visibility_sharp,
                          color: Colors.blue,
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock_open, color: Colors.blue),
                      hintStyle: TextStyle(color: Colors.indigo),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 50.h),
              RoundButton(
                title: 'Sign up',
                loading: authviewModel.SignUp_loading,
                onpressed: () {
                  if (_email_controller.text.isEmpty) {
                    Utills.flushBarErrorMessages(
                      'Please! Enter in Email',
                      context,
                    );
                  } else if (_email_controller.text.isEmpty) {
                    Utills.flushBarErrorMessages(
                      'Please! Enter in Password',
                      context,
                    );
                  } else if (_password_controller.text.length < 6) {
                    Utills.flushBarErrorMessages(
                      'Please! Enter 6 digit Password',
                      context,
                    );
                  } else {
                    Map data = {
                      "email": _email_controller.text.toString(),
                      "password": _password_controller.text.toString(),
                    };
                    authviewModel.SignUp_api(data, context);
                    'api hit';
                  }
                },
              ),

              SizedBox(height: 20.sp),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text(
                  "Already have an account? login Now",
                  style: TextStyle(color: Colors.blue, fontSize: 15.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}