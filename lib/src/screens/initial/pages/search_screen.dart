import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
          child: Container(
            height: 50,
            decoration: BoxDecoration(color: AppColors.searchColor, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: CustomIcon(title: 'assets/icons/searchnormal1.svg', height: 20, width: 20, color: AppColors.profilColor),
                ),
                // SizedBox(
                //     height: 50,
                //     width: MediaQuery.of(context).size.width - 120,
                //     child: TextFormField()),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 130,
                      child: TextFormField(
                        maxLines: 1,
                        decoration: const InputDecoration(
                          hintText: 'Gözleg',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      )),
                  // Text(
                  //   'Искать товары',
                  //   style: TextStyle(
                  //       color: AppColors.disableColor,
                  //       fontSize: 14,
                  //       fontFamily: 'ALSHauss',
                  //       fontStyle: FontStyle.normal,
                  //       fontWeight: FontWeight.w400),
                  // ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
