import 'package:admin/screens/oraganization/organization_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../providers/sideMenuProvider.dart';
import '../../../providers/statisticalInfoProvider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    if(sideMenuProvider.showAllSideMenuInfo){
      return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  DrawerListTile(
                    title: "Dashboard",
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    press: () {
                      sideMenuProvider.changeSelectedIndex(0);
                    },
                  ),
                  DrawerListTile(
                    title: "Organisations",
                    svgSrc: "assets/icons/menu_tran.svg",
                    press: () {
                      sideMenuProvider.changeSelectedIndex(1);
                    },
                  ),
                  DrawerListTile(
                    title: "Utilisateurs",
                    svgSrc: "assets/icons/menu_task.svg",
                    press: () {
                      sideMenuProvider.changeSelectedIndex(2);
                    },
                  ),
                  DrawerListTile(
                    title: "Administrateurs",
                    svgSrc: "assets/icons/menu_doc.svg",
                    press: () {
                      sideMenuProvider.changeSelectedIndex(3);
                    },
                  ),
                  /*DrawerListTile(
                    title: "Store",
                    svgSrc: "assets/icons/menu_store.svg",
                    press: () {},
                  ),*/
                  /*DrawerListTile(
                    title: "Notification",
                    svgSrc: "assets/icons/menu_notification.svg",
                    press: () {},
                  ),*/
                  DrawerListTile(
                    title: "Profile",
                    svgSrc: "assets/icons/menu_profile.svg",
                    press: () {},
                  ),
                  /*DrawerListTile(
                    title: "Settings",
                    svgSrc: "assets/icons/menu_setting.svg",
                    press: () {},
                  ),*/
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: (){
                    sideMenuProvider.changeShowAllSideMenuInfo();
                  },
                  icon: (sideMenuProvider.showAllSideMenuInfo)?Icon(Icons.navigate_next, size: showSideMenuIconSize,):
                  Icon(Icons.navigate_before, size: showSideMenuIconSize,)),
            ),
          ],
        ),
      );
    }
    else{
      return Drawer(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  DrawerIcon(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    press: () {
                      sideMenuProvider.changeSelectedIndex(0);
                    },
                  ),
                  DrawerIcon(
                    svgSrc: "assets/icons/menu_tran.svg",
                    press: () {
                      sideMenuProvider.changeSelectedIndex(1);
                    },
                  ),
                  DrawerIcon(
                    svgSrc: "assets/icons/menu_task.svg",
                    press: () {
                      sideMenuProvider.changeSelectedIndex(2);
                    },
                  ),
                  DrawerIcon(
                    svgSrc: "assets/icons/menu_doc.svg",
                    press: () {
                      sideMenuProvider.changeSelectedIndex(3);
                    },
                  ),
                  /*DrawerIcon(
                    svgSrc: "assets/icons/menu_store.svg",
                    press: () {},
                  ),*/
                  /*DrawerIcon(
                    svgSrc: "assets/icons/menu_notification.svg",
                    press: () {},
                  ),*/
                  DrawerIcon(
                    svgSrc: "assets/icons/menu_profile.svg",
                    press: () {},
                  ),
                  /*DrawerIcon(
                    svgSrc: "assets/icons/menu_setting.svg",
                    press: () {},
                  ),*/
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: (){
                    sideMenuProvider.changeShowAllSideMenuInfo();
                  },
                  icon: (sideMenuProvider.showAllSideMenuInfo)?Icon(Icons.navigate_next, size: showSideMenuIconSize,):
                  Icon(Icons.navigate_before, size: showSideMenuIconSize,)),
            ),
          ],
        ),
      );
    }
  }

}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.press,
    required this.svgSrc,
    this.title,
  }) : super(key: key);

  final String? title;
  final String svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: (title!=null)?Text(
        title!,
        style: TextStyle(color: Colors.white54),
      ):SizedBox(),
    );
  }
}
class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.press,
    required this.svgSrc,
  }) : super(key: key);

  final String svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: SvgPicture.asset(
          svgSrc,
          colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
          height: 20,
        ),
      ),
    );
  }
}
