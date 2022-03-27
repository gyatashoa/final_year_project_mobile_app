import 'package:final_year_project_mobile_app/widgets/custom_auth_btn.dart';
import 'package:final_year_project_mobile_app/widgets/custom_link.dart';
import 'package:final_year_project_mobile_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: devSize.width * .09),
          child: SingleChildScrollView(
            child: Container(
              height: devSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Sign Up', style: Theme.of(context).textTheme.headline1),
                  Text(
                    'Enter your details to start using our services',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  //TODO: add person icon
                  const CustomTextField(
                      keyType: TextInputType.text,
                      hintText: 'First Name',
                      iconData: Icons.person_outline_rounded),
                  const CustomTextField(
                      keyType: TextInputType.text,
                      hintText: 'Last Name',
                      iconData: Icons.person_outline_rounded),
                  const CustomTextField(
                      keyType: TextInputType.text,
                      hintText: 'Other Name(s)',
                      iconData: Icons.person_outline_rounded),

                  const CustomTextField(
                      keyType: TextInputType.emailAddress,
                      hintText: 'Email',
                      iconData: Icons.alternate_email),
                  Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('GENDER')),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              // selected: true,
                              title: const Text('MALE'),
                              value: 'MALE',
                              groupValue: 'MALE',
                              onChanged: (val) {
                                print(val);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: const Text('FEMALE'),
                                value: 'MALE',
                                groupValue: 'GENDER',
                                onChanged: (val) {}),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CustomTextField(
                      enabled: false,
                      keyType: TextInputType.datetime,
                      hintText: 'Date of Birth',
                      iconData: Icons.calendar_month),
                  const CustomTextField(
                      keyType: TextInputType.visiblePassword,
                      hintText: 'Password',
                      iconData: Icons.lock),

                  //TODO: Add correct icon for password
                  // const CustomTextField(
                  //     keyType: TextInputType.visiblePassword,
                  //     hintText: 'Confirm Password',
                  //     iconData: Icons.lock),

                  const CustomAuthBtn(text: 'SIGN UP'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomLink(text: 'Login', callback: () {})
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
