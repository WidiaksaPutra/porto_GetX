import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

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
    return badges.Badge(
      badgeContent: Text(widget.jumlahNotiv,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
      child: TextMenuApproval(
        label: widget.labelNotiv,
      ),
    );
  }
}