import 'package:flutter/material.dart';
import '../../../constants.dart';

class UserBasicInfo extends StatefulWidget {
  const UserBasicInfo({
    Key? key,
    required this.nbUsers,
    required this.title,
    this.isBorderSelected = true,
    required this.radioValue,
    required this.groupValue,
    this.onChanged
  }) : super(key: key);

  final int nbUsers;
  final String title;
  final bool isBorderSelected;
  final String radioValue;
  final String groupValue;
  final void Function(String?)? onChanged;

  @override
  State<UserBasicInfo> createState() => _UserBasicInfoState();
}

class _UserBasicInfoState extends State<UserBasicInfo> {

  @override
  Widget build(BuildContext context) {
    final containerSize = MediaQuery.of(context).size.width / 6;
    return InkWell(
      enableFeedback: false,
      onTap: (){
        widget.onChanged?.call(widget.radioValue);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        constraints: BoxConstraints(
          minWidth: containerSize,
        ),
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          border: (widget.isBorderSelected)?Border.all(color: kPrimaryColor, width: 2):null,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: containerSize,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.nbUsers}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Radio(
                      activeColor:  kPrimaryColor,
                      fillColor: MaterialStateProperty.all(kPrimaryColor),
                      value: widget.radioValue,
                      groupValue: widget.groupValue,
                      onChanged: widget.onChanged
                  )
                ],
              ),
            ),
          Text(
            '${widget.title}',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ],
        ),
      ),
    );
  }
}

