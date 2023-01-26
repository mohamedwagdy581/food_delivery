import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/default_button.dart';
import 'package:food_delivery/widgets/default_text_form_field.dart';
import 'package:get/get.dart';

import '../../base/show_custom_snackbar.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    var signUpImages = [
      'assets/images/g.webp',
      'assets/images/f.png',
      'assets/images/t.jpg',
    ];

    void _registraion(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your Name", title: "Name");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your Email address",
            title: "Email Address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid Email address",
            title: "Valid Email Address");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your Phone Number", title: "Phone Number");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your Password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        showCustomSnackBar("All went well", title: "Perfect", backgroundColor: Colors.green);
        SignUpBody signUpBody = SignUpBody(
          name: name,
          email: email,
          phone: phone,
          password: password,
        );
        authController.registration(signUpBody).then((status)
        {
          if(status.isSuccess)
          {
            print("Success Registration");
          }else
          {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController)
      {
        return !_authController.isLoading ? SingleChildScrollView(
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

                // Name Text Field
                DefaultTextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  label: 'Name',
                  prefix: Icons.person,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Name must not be Empty!';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: Dimensions.height15,
                ),

                // Email Text Field
                DefaultTextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                  prefix: Icons.email_outlined,
                  prefixColor: AppColors.mainColor,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email must not be Empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Dimensions.height15,
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
                  suffix: Icons.visibility_off,
                  secure: true,
                  suffixColor: AppColors.mainColor,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password must not be Empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),

                // Sign Up Button
                DefaultButton(
                  text: 'SignUp',
                  onPressed: () {
                    _registraion(_authController);
                    if (formKey.currentState!.validate()) {}
                  },
                  backgroundColor: AppColors.mainColor,
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),

                // Have an Account Text
                RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: "Have an account already?",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.05,
                ),

                // Sing with other methods Text
                RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                    text: "Sign Up using one of the following methods",
                    style: TextStyle(
                      fontSize: Dimensions.font16,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),

                // Different Method to sign in (Gmail, Facebook, Twitter)
                Wrap(
                  spacing: Dimensions.height45,
                  children: List.generate(
                    3,
                        (index) => CircleAvatar(
                      radius: Dimensions.radius30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        signUpImages[index],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
              ],
            ),
          ),
        ) : const CustomLoader();
      },),
    );
  }
}
