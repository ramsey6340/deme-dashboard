import 'package:admin/screens/dashboard_home/components/line_chart_active_user.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../models/user_active_point.dart';
import '../../providers/globalValueProvider.dart';
import '../../widgets/header.dart';
import 'components/user_basic_info.dart';

class DashboardHomeScreen extends StatefulWidget {
  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
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

  Map<String, double> status = {
    "Deconnecté": 80,
    "Connecté": 20,
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];


  @override
  Widget build(BuildContext context) {
    final globalValueProvider = Provider.of<GlobalValueProvider>(context);

    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          UserBasicInfo(
                            isBorderSelected: globalValueProvider.dashboardTypeUser==DashboardTypeUser.organization,
                            nbUsers: 258,
                            title: 'Organisations',
                            radioValue: DashboardTypeUser.organization,
                            groupValue: globalValueProvider.dashboardTypeUser,
                            onChanged: (value) {
                              globalValueProvider.changeDashboardTypeUser(DashboardTypeUser.organization);
                            },
                          ),
                          UserBasicInfo(
                            isBorderSelected: globalValueProvider.dashboardTypeUser==DashboardTypeUser.user,
                            nbUsers: 1024,
                            title: 'Utilisateurs',
                            radioValue: DashboardTypeUser.user,
                            groupValue: globalValueProvider.dashboardTypeUser,
                            onChanged: (value) {
                              globalValueProvider.changeDashboardTypeUser(DashboardTypeUser.user);
                            },
                          ),
                          UserBasicInfo(
                            isBorderSelected: globalValueProvider.dashboardTypeUser==DashboardTypeUser.admin,
                            nbUsers: 7,
                            title: 'Administrateurs',
                            radioValue: DashboardTypeUser.admin,
                            groupValue: globalValueProvider.dashboardTypeUser,
                            onChanged: (value) {
                              globalValueProvider.changeDashboardTypeUser(DashboardTypeUser.admin);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: defaultPadding),

                      /*Chart(),*/
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        width: double.infinity,
                        child: LineChartActiveUser(userActivePoints: data,),
                      ),
                      SizedBox(height: defaultPadding),
                      Center(
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                                child: PieChart(
                                    dataMap: genres,
                                  legendOptions: LegendOptions(legendPosition: LegendPosition.bottom),

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
                            SizedBox(
                              width: 200,
                                child: PieChart(
                                    dataMap: methodPayments,
                                  legendOptions: LegendOptions(legendPosition: LegendPosition.bottom),

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
                            SizedBox(
                              width: 200,
                                child: PieChart(
                                    dataMap: status,
                                  legendOptions: LegendOptions(legendPosition: LegendPosition.bottom),
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
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
