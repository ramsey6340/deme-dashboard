import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../providers/statisticalInfoProvider.dart';

class OrganizationStatistical extends StatefulWidget {
  const OrganizationStatistical({
    Key? key,
  }) : super(key: key);

  @override
  State<OrganizationStatistical> createState() => _OrganizationStatisticalState();
}

class _OrganizationStatisticalState extends State<OrganizationStatistical> {

  Map<String, double> genres = {
    "Homme": 62.50,
    "Femme": 37.50,
  };

  Map<String, double> methodPayments = {
    "Orange Money": 50,
    "Sama Money": 20,
    "Moov Money": 17,
    "Wari": 13,
  };


  @override
  Widget build(BuildContext context) {
    final statisticalInfoProvider = Provider.of<StatisticalInfoProvider>(context);

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: (){
                  statisticalInfoProvider.changeShowSideInfo();
                },
                icon: (statisticalInfoProvider.showSideInfo)?Icon(Icons.navigate_next, size: showStatisticalInfoIconSize,):
                Icon(Icons.navigate_before, size: showStatisticalInfoIconSize,)),
          ),
          Text(
            "Statistique général",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          SizedBox(
              width: 200,
              child: PieChart(
                dataMap: genres,
                legendOptions: LegendOptions(legendPosition: LegendPosition.bottom),
                chartLegendSpacing: 0,
                animationDuration: Duration(seconds: 2),
                chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 2,
                    chartValueStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                ),
              )),
          SizedBox(height: defaultPadding),
          SizedBox(
              width: 200,
              child: PieChart(
                dataMap: methodPayments,
                legendOptions: LegendOptions(legendPosition: LegendPosition.bottom),
                chartLegendSpacing: 0,
                animationDuration: Duration(seconds: 2),
                chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 2,
                    chartValueStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                ),
              )),
        ],
      ),
    );
  }
}
