import 'package:admin/screens/dashboard_home/components/user_basic_info.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyUsers extends StatelessWidget {
  const MyUsers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
          itemBuilder: (context, index) {
        return UserBasicInfo(nbUsers: 254, title: 'Organisations', radioValue: '', groupValue: '',);
      }),
    );
  }
}

