import 'package:flutter/material.dart';
import 'package:kargo_app/src/core/l10n.dart';

import '../../application/settings_singleton.dart';
import '../../design/app_colors.dart';
import '../welcome/welcome_page.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 340,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: Text(
                        'app_title'.trs,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 30),
                    child: InkWell(
                      onTap: () async {
                        await SettingsSingleton().changeLocale('tk');
                      },
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value! as int;
                              });
                            },
                          ),
                          Image.asset('assets/images/turkman.png'),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Türkmen',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: InkWell(
                      onTap: () async {
                        await SettingsSingleton().changeLocale('ru');
                      },
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value! as int;
                              });
                            },
                          ),
                          Image.asset('assets/images/russian.png'),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Русский',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => WelcomePage(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 38,
                        right: 20,
                        left: 20,
                        bottom: 30,
                      ),
                      child: Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Dowam et',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                            ),
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
      ),
    );
  }
}
