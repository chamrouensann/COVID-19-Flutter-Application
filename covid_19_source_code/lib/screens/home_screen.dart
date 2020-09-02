import 'package:covid19sourcecode/constants.dart';
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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
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

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  const InfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth / 2 - 10,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/running.svg",
                      height: 12,
                      width: 12,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: kTextColor),
                        children: [
                          TextSpan(
                            text: "$effectedNum \n",
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "People",
                            style: TextStyle(
                              fontSize: 12,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: LineReportChart(),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
