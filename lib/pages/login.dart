import 'package:final_year_project_mobile_app/widgets/custom_auth_btn.dart';
import 'package:final_year_project_mobile_app/widgets/custom_link.dart';
import 'package:final_year_project_mobile_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: devSize.width * .09),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/Login-img.svg',
                height: devSize.height * .50,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Text('Login', style: Theme.of(context).textTheme.headline1),
              Text(
                'Enter your email and password to login',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                  keyType: TextInputType.emailAddress,
                  hintText: 'Email',
                  iconData: Icons.alternate_email),
              const SizedBox(
                height: 20,
              ),

              //TODO: Add correct icon for password
              const CustomTextField(
                  keyType: TextInputType.visiblePassword,
                  hintText: 'Password',
                  iconData: Icons.lock),
              const SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: CustomLink(text: 'Forgot Password', callback: () {})),
              const SizedBox(
                height: 10,
              ),
              const CustomAuthBtn(text: 'LOGIN'),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Need an account?'),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomLink(text: 'Sign Up', callback: () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
