import 'package:flutter/material.dart';
import 'package:kargo_app/src/screens/explore/components/all_products.dart';

import '../../design/app_colors.dart';
import '../../design/custom_icon.dart';
import '../initial/pages/search_screen.dart';
import 'components/market_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

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
                'Marketler',
                style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Roboto', fontStyle: FontStyle.normal, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: CustomIcon(title: 'assets/icons/searchnormal1.svg', height: 24, width: 24, color: AppColors.profilColor),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Text(
                          'Gözleg',
                          style: TextStyle(color: AppColors.profilColor, fontSize: 16, fontFamily: 'ALSHauss', fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
              child: SizedBox(
                height: 210,
                width: MediaQuery.of(context).size.width - 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/delivery.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kategoriýalar',
                    style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'ALSHauss', fontStyle: FontStyle.normal, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AllProducts()));
                    },
                    child: const Text(
                      'hemmesi',
                      style: TextStyle(color: AppColors.mainColor, fontSize: 14, fontFamily: 'ALSHauss', fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 230,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ItemMarket()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 180,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset('assets/images/ayakgap.png')),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Aýakgap',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'Montserrat', fontStyle: FontStyle.normal, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
