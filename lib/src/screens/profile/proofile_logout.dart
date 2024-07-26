import 'package:flutter/material.dart';
import 'package:kargo_app/src/design/app_colors.dart';

import '../auth/login/login_screen.dart';
import '../auth/register/register_screen.dart';

class ProfileLogOut extends StatefulWidget {
  const ProfileLogOut({Key? key}) : super(key: key);

  @override
  State<ProfileLogOut> createState() => _ProfileLogOutState();
}

class _ProfileLogOutState extends State<ProfileLogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 70,
            elevation: 0,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: const Center(
              child: Text(
                'Profil',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          const Center(
            child: Text(
              'Şahsy otag',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text(
              'Goşundynyň mümkinçiliklerini doly ulanmak üçin ulgama giriň ýa-da akkaunt dörediň',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.profilColor,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(15)),
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
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    color: AppColors.authRegisterColor,
                    borderRadius: BorderRadius.circular(15)),
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
      )),
    );
  }
}
