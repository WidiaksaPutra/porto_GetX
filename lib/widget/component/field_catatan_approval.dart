import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/component/card_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class FieldCatatanApproval extends StatelessWidget {
  final int index;
  final String? statusApproval;
  final String? namaKaryawan;
  final String? catatanApproval;
  final DateTime? tglApproval;
  const FieldCatatanApproval({
    Key? key,
    required this.index,
    required this.statusApproval,
    required this.namaKaryawan,
    required this.catatanApproval,
    required this.tglApproval
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0)),
        title: Column(
          children: <Widget> [
            Row(
              children: <Widget> [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          colors: <Color> [
                            kPrimaryColor,
                            kSecondaryColor,
                          ]
                        ),
                      ),
                      child: FittedBox(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                            child: (statusApproval.toString() != "APP")
                            ? Text("Pemeriksa ${index+1}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                            )
                            : Text("Pengesah",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: <Widget> [
                    if(statusApproval.toString() == "VER")...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "VERIFIED",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                              child: SvgPicture.asset("assets/icons/verify_icon.svg",
                                width: getProportionateScreenWidth(20),
                                height: getProportionateScreenHeight(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                      ),
                    ],
                    if(statusApproval.toString() == "REV")...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "REVISI",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                              child: SvgPicture.asset("assets/icons/revise_icon.svg",
                                width: getProportionateScreenWidth(20),
                                height: getProportionateScreenHeight(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                      ),
                    ],
                    if(statusApproval.toString() == "REJ")...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "REJECT",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                              child: SvgPicture.asset("assets/icons/reject_icon.svg",
                                width: getProportionateScreenWidth(20),
                                height: getProportionateScreenHeight(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                      ),
                    ],
                    if(statusApproval.toString() == "APP")...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "APPROVED",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                              child: SvgPicture.asset("assets/icons/verify_icon.svg",
                                width: getProportionateScreenWidth(20),
                                height: getProportionateScreenHeight(20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            CardItemExpansionDetail(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                child: SizedBox(
                  width: double.infinity,
                  child: (catatanApproval != null)
                  ? Text(
                    catatanApproval.toString(),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                  : Text(
                    "-",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            CardCatatanApproval(
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10), vertical: getProportionateScreenHeight(10)),
                      child: (namaKaryawan != null)
                      ? Text(
                        namaKaryawan.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ) 
                      : Text(
                        "-",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}