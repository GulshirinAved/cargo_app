import 'package:flutter/material.dart';
import 'package:kargo_app/src/screens/auth/login/login_screen.dart';

import '../../design/app_colors.dart';
import 'register/register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          )),
          child: Center(
              child: Image.asset(
            'assets/images/logo.png',
            height: MediaQuery.of(context).size.height / 2 - 90,
            width: MediaQuery.of(context).size.width / 2,
          )
              // CustomIcon(
              //     title: 'assets/icons/logo106.svg',
              //     height: MediaQuery.of(context).size.height / 3 - 90,
              //     width: MediaQuery.of(context).size.width / 3 - 90,
              //     color: Colors.transparent),
              ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
          child: Container(
            height: 365,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Hoş geldiňiz!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text(
                    'Her ädimde iberilen harytlaryňyzy hakyky wagtda görmek',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.authTextColor,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 20, left: 20),
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          'Ulgama gir',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          color: AppColors.authRegisterColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          'Akkaunt döret',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
