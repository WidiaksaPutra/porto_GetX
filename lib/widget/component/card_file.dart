import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/constants.dart';

class CardFile extends StatelessWidget {
  final String label;
  final String contentData;
  final Function()? onPressed;
  const CardFile({Key? key, required this.label, required this.contentData, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6.0),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
          width: 0.4, color: Colors.grey
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget> [
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(label,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(":",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(contentData.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: 125,
                height: 35,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      kPrimaryColor,
                      kSecondaryColor,
                    ]
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                  ),
                  onPressed: onPressed,
                  child: const Text("Download",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}