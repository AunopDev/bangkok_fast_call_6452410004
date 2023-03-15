// ignore_for_file: unused_import, unused_element, prefer_interpolation_to_compose_strings, prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:bangkok_fast_call_app/model/HospitalList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(
    double hosLatitude,
    double hosLongtitude,
  ) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$hosLatitude,$hosLongtitude";

    if (await canLaunchUrl(googleMapUrl as Uri)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could not open the map';
    }
  }
}

class DetailUI extends StatefulWidget {
  HospitalList? hospitalList;

  DetailUI({super.key, this.hospitalList});

  @override
  State<DetailUI> createState() => _DetailUIState();
}

class _DetailUIState extends State<DetailUI> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'สายด่วนรพ.กทม. (' + widget.hospitalList!.hosName + ')',
          style: GoogleFonts.itim(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/' + widget.hospitalList!.hosImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.hospital,
                    color: Colors.white,
                  ),
                  title: Text(
                    'ชื่อ : ' + widget.hospitalList!.hosName,
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  onTap: () {
                    _makePhoneCall(widget.hospitalList!.hosPhone);
                  },
                  leading: Icon(
                    FontAwesomeIcons.phone,
                    color: Colors.green,
                  ),
                  title: Text(
                    'เบอร์โทร : ' + widget.hospitalList!.hosPhone,
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse('https://www.facebook.com/' +
                        widget.hospitalList!.hosFacebook));
                  },
                  leading: Icon(
                    FontAwesomeIcons.facebook,
                    color: Color(0xff426783),
                  ),
                  title: Text(
                    'เฟสบุ๊ค : ' + widget.hospitalList!.hosFacebook,
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.hospitalList!.hosWeb));
                  },
                  leading: Icon(
                    FontAwesomeIcons.globe,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'เว็บไซต์ : ' + widget.hospitalList!.hosWeb,
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse(
                        "https://maps.google.com/maps/search/?api=&query=" +
                            widget.hospitalList!.hosLatitude +
                            ',' +
                            widget.hospitalList!.hosLongtitude));
                  },
                  leading: Icon(
                    FontAwesomeIcons.locationDot,
                    color: Colors.red,
                  ),
                  title: Text(
                    'ที่อยู่',
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
