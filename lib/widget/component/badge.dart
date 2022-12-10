import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'package:mgp_mobile_app/widget/component/text_menu_approval.dart';

class NotivBadges extends StatefulWidget {
  final String jumlahNotiv, labelNotiv;
  const NotivBadges({ Key? key, required this.jumlahNotiv, required this.labelNotiv}) : super(key: key);

  @override
  State<NotivBadges> createState() => _NotivBadgesState();
}

class _NotivBadgesState extends State<NotivBadges> {

  @override
  Widget build(BuildContext context) {
    return Badge(
      shape: BadgeShape.square,
      borderRadius: BorderRadius.circular(20),
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.scale,
      badgeContent: Text(widget.jumlahNotiv,
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      child: TextMenuApproval(
        label: widget.labelNotiv,
      ),
    );
  }
}