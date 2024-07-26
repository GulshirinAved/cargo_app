import 'package:flutter/material.dart';
import 'package:kargo_app/src/design/constants.dart';
import 'package:kargo_app/src/screens/clientHome/components/location_card.dart';

class LocationSlider extends StatelessWidget {
  const LocationSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: velayat.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) =>
            LocationCard(locationName: velayat[index]),
      ),
    );
  }
}
