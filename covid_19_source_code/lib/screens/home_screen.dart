import 'package:covid19sourcecode/constants.dart';
import 'package:covid19sourcecode/widgets/info_cart.dart';
import 'package:covid19sourcecode/widgets/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 40,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.03),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Wrap(
          runSpacing: 40,
          spacing: 20,
          children: <Widget>[
            InfoCard(
              title: "Confirmed Cases",
              effectedNum: 1024,
              iconColor: Color(0xFFFF8C00),
            ),
            InfoCard(
              title: "Confirmed Dead",
              effectedNum: 75,
              iconColor: Color(0xFFFF2D55),
            ),
            InfoCard(
              title: "Total Recovered",
              effectedNum: 689,
              iconColor: Color(0xFF50E3C2),
            ),
            InfoCard(
              title: "New Cases",
              effectedNum: 93,
              iconColor: Color(0xFF5856D6),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        )
      ],
    );
  }
}
