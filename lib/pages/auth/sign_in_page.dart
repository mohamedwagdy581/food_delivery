import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/default_button.dart';
import 'package:food_delivery/widgets/default_text_form_field.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.25,
                child: const Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),

              // Hello and signIn text
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: Dimensions.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: Dimensions.font20*3+Dimensions.font20/2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sign into your account',
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),

              // Phone Text Field
              DefaultTextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                label: 'Phone',
                prefix: Icons.phone,
                prefixColor: AppColors.mainColor,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Phone must not be Empty!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Dimensions.height15,
              ),

              // Password Text Field
              DefaultTextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                label: 'Password',
                prefix: Icons.lock_outline,
                prefixColor: AppColors.mainColor,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password must not be Empty!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Dimensions.height10,
              ),

              // Sing with other methods Text
              Container(
                padding: EdgeInsets.only(right: Dimensions.width20),
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),

              // Sign Up Button
              DefaultButton(
                text: 'SignIn',
                onPressed: () {
                  if(formKey.currentState!.validate()) {}
                },
                backgroundColor: AppColors.mainColor,
              ),

              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),

              // Sing with other methods Text
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: "Don't have an account? ",
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                    color: Colors.grey[500],
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => Get.to(()=> const SignUpPage(), transition: Transition.fade),
                      text: "Create",
                      style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
