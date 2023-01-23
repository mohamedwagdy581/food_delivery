import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/default_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05,),
            SizedBox(
              height: Dimensions.screenHeight*0.25,
              child: const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),

            // Email Text Field
            DefaultTextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
                prefix: Icons.email_outlined,
                prefixColor: AppColors.yellowColor,
                validator: (value){},
            ),
            SizedBox(height: Dimensions.height15,),

            // Name Text Field
            DefaultTextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              label: 'Name',
              prefix: Icons.person,
              validator: (value){},
            ),
            SizedBox(height: Dimensions.height15,),


            // Phone Text Field
            DefaultTextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              label: 'Phone',
              prefix: Icons.phone,
              validator: (value){},
            ),
            SizedBox(height: Dimensions.height15,),


            // Password Text Field
            DefaultTextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              label: 'Password',
              prefix: Icons.lock_outline,
              validator: (value){},
            ),
            SizedBox(height: Dimensions.height15,),

          ],
        ),
      ),
    );
  }
}
