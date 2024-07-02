import 'package:flutter/material.dart';
import '../../../components/appbar/non_logo_appbar_model.dart';
import '../../../constant/constant.dart';
import '../../../ext/text_style.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final List<bool> _isOpen = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.grey300,
      appBar: NonLogoAppBarModel(
        getTitle: () {
          return "Help";
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: Column(
            children: [
              helpPageTitle(),
              const SizedBox(height: 30),
              help(),
            ],
          ),
        ),
      ),
    );
  }

  Widget helpPageTitle()  {
    return Text(
      "Please choose the correct area to need your help",
      style: ExtPageText.TxtStyle(FontWeight.w500, 15, Constant.black),
    );
  }

  Widget help() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isOpen[index] = isExpanded;
        });
      },
      children: [
        //Map Problems
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Image.asset(
                "assets/icons/question.png",
                width: 35,
                color: Constant.appbarRed,
              ),
              title: Text(
                "Map Problems",
                style: ExtPageText.TxtStyle(
                    FontWeight.w700, 21, Constant.black),
                textAlign: TextAlign.start,
              ),
            );
          },
          body: Column(
            children: [
              ListTile(
                title: Text(
                  "Map Problems 1",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Map Problems 2",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Map Problems 3",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
            ],
          ),
          isExpanded: _isOpen[0],
        ),
        //Contact List Problems
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Image.asset(
                "assets/icons/question.png",
                width: 35,
                color: Constant.appbarRed,
              ),
              title: Text(
                "Contact List Problems",
                style: ExtPageText.TxtStyle(
                    FontWeight.w700, 20, Constant.black),
                textAlign: TextAlign.start,
              ),
            );
          },
          body: Column(
            children: [
              ListTile(
                title: Text(
                  "Contact List Problems 1",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Contact List Problems 2",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Contact List Problems 3",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
            ],
          ),
          isExpanded: _isOpen[1],
        ),
        //Application Problems
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Image.asset(
                "assets/icons/question.png",
                width: 35,
                color: Constant.appbarRed,
              ),
              title: Text(
                "Application Problems",
                style: ExtPageText.TxtStyle(
                    FontWeight.w700, 21, Constant.black),
                textAlign: TextAlign.start,
              ),
            );
          },
          body: Column(
            children: [
              ListTile(
                title: Text(
                  "Application Problems 1",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Application Problems 2",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Application Problems 3",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
            ],
          ),
          isExpanded: _isOpen[2],
        ),
        //Connection Problems
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Image.asset(
                "assets/icons/question.png",
                width: 35,
                color: Constant.appbarRed,
              ),
              title: Text(
                "Connection Problems",
                style: ExtPageText.TxtStyle(
                    FontWeight.w700, 21, Constant.black),
                textAlign: TextAlign.start,
              ),
            );
          },
          body: Column(
            children: [
              ListTile(
                title: Text(
                  "Connection Problems 1",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Connection Problems 2",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Connection Problems 3",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
            ],
          ),
          isExpanded: _isOpen[3],
        ),
        //Other Problems
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Image.asset(
                "assets/icons/question.png",
                width: 35,
                color: Constant.appbarRed,
              ),
              title: Text(
                "Other Problems",
                style: ExtPageText.TxtStyle(
                    FontWeight.w700, 21, Constant.black),
                textAlign: TextAlign.start,
              ),
            );
          },
          body: Column(
            children: [
              ListTile(
                title: Text(
                  "Other Problems 1",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Other Problems 2",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
              ListTile(
                title: Text(
                  "Other Problems 3",
                  style: ExtPageText.TxtStyle(
                      FontWeight.w400, 16, Constant.grey700),
                ),
              ),
            ],
          ),
          isExpanded: _isOpen[4],
        ),
      ],
    );
  }
}

