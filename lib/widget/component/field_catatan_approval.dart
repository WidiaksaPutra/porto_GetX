import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/widget/component/card_catatan_approval.dart';
import 'package:mgp_mobile_app/widget/component/card_item_expansion_detail.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
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
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: (statusApproval.toString() != "APP")
                            ? Text("Pemeriksa ${index+1}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                            )
                            : const Text("Pengesah",
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget> [
                            const Text(
                              "VERIFIED",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SvgPicture.asset("assets/icons/verify_icon.svg",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : const Text(
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget> [
                            const Text(
                              "REVISI",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SvgPicture.asset("assets/icons/revise_icon.svg",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : const Text(
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget> [
                            const Text(
                              "REJECT",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SvgPicture.asset("assets/icons/reject_icon.svg",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : const Text(
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget> [
                            const Text(
                              "APPROVED",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SvgPicture.asset("assets/icons/verify_icon.svg",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          child: (tglApproval != null)
                          ? Text(
                            DateFormat(
                              'dd/MM/yyyy', 'id').format(
                                DateTime.parse(tglApproval.toString()
                              )
                            ).toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left,
                          )
                          : const Text(
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
            const SizedBox(height: 20),
            CardItemExpansionDetail(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: (catatanApproval != null)
                  ? Text(
                    catatanApproval.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  )
                  : const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CardCatatanApproval(
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: (namaKaryawan != null)
                      ? Text(
                        namaKaryawan.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14
                        ),
                      ) 
                      : const Text(
                        "-",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14
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