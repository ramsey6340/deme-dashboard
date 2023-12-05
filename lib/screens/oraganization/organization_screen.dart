import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../providers/statisticalInfoProvider.dart';
import '../../responsive.dart';
import '../../widgets/header.dart';
import '../dashboard/components/recent_files.dart';
import '../dashboard/components/storage_details.dart';
import 'components/organization_statistical.dart';

class OrganizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final statisticalInfoProvider = Provider.of<StatisticalInfoProvider>(context);

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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding * 1.5,
                                vertical:
                                defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    title: const Text("Login"),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Form(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: "Name",
                                                icon: Icon(Icons.account_box),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: "Email",
                                                icon: Icon(Icons.email),
                                              ),
                                            ),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: "Message",
                                                icon: Icon(Icons.message),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text("submit"),
                                        onPressed: () {
                                          // your code
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.add, color: Colors.white,),
                            label: Text("Ajouter une organisation",
                              style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  if(statisticalInfoProvider.showSideInfo)
                    Expanded(
                      flex: 2,
                      child: OrganizationStatistical(),
                    ),
                if(!statisticalInfoProvider.showSideInfo)
                  Column(
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
                    ],
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
