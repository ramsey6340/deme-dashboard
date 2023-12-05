import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/providers/sideMenuProvider.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/admin/admin_screen.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/oraganization/organization_screen.dart';
import 'package:admin/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard_home/dashboard_home_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              if(sideMenuProvider.showAllSideMenuInfo)
                Expanded(
                  child: SideMenu(),
                ),
            if(!sideMenuProvider.showAllSideMenuInfo)
              SizedBox(
                width: 50,
                child: SideMenu(),
              ),

            // Page d'accueil
            if(sideMenuProvider.selectedIndex == 0)
            Expanded(
              flex: 5,
              child: DashboardHomeScreen(),
            ),

            // Page des organisations
            if(sideMenuProvider.selectedIndex == 1)
              Expanded(
                flex: 5,
                child: OrganizationScreen(),
              ),

            // Page des utilisateurs
            if(sideMenuProvider.selectedIndex == 2)
              Expanded(
                flex: 5,
                child: UserScreen(),
              ),

            // Page des administrateurs
            if(sideMenuProvider.selectedIndex == 3)
              Expanded(
                flex: 5,
                child: AdminScreen(),
              ),

          ],
        ),
      ),
    );
  }
}
