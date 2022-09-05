import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
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
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0).h),
        title: Column(
          children: <Widget> [
            Row(
              children: <Widget> [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
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
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15).w),
                            child: (statusApproval.toString() != "APP")
                            ? Text("Pemeriksa ${index+1}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold
                              ),
                            )
                            : Text("Pengesah",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
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
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "VERIFIED",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                              child: SvgPicture.asset("assets/icons/verify_icon.svg",
                                width: getProportionateScreenWidth(20).w,
                                height: getProportionateScreenHeight(20).h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5).h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                      ),
                    ],
                    if(statusApproval.toString() == "REV")...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "REVISI",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                              child: SvgPicture.asset("assets/icons/revise_icon.svg",
                                width: getProportionateScreenWidth(20).w,
                                height: getProportionateScreenHeight(20).h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5).h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                      ),
                    ],
                    if(statusApproval.toString() == "REJ")...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "REJECT",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                              child: SvgPicture.asset("assets/icons/reject_icon.svg",
                                width: getProportionateScreenWidth(20).w,
                                height: getProportionateScreenHeight(20).h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5).h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ),
                      ),
                    ],
                    if(statusApproval.toString() == "APP")...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                        child: Row(
                          children: <Widget> [
                            Text(
                              "APPROVED",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: getProportionateScreenWidth(5).w),
                              child: SvgPicture.asset("assets/icons/verify_icon.svg",
                                width: getProportionateScreenWidth(20).w,
                                height: getProportionateScreenHeight(20).h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(5).h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : Text(
                            "-",
                            style: TextStyle(
                              fontSize: 14.sp,
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
            SizedBox(height: getProportionateScreenHeight(20).h),
            CardItemExpansionDetail(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
                child: SizedBox(
                  width: double.infinity,
                  child: (catatanApproval != null)
                  ? Text(
                    catatanApproval.toString(),
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  )
                  : Text(
                    "-",
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20).h),
            CardCatatanApproval(
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10).w, vertical: getProportionateScreenHeight(10).h),
                      child: (namaKaryawan != null)
                      ? Text(
                        namaKaryawan.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
                        ),
                      ) 
                      : Text(
                        "-",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp
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