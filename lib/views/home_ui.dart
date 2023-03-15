// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:bangkok_fast_call_app/views/detail_ui.dart';
import 'package:flutter/material.dart';
import 'package:bangkok_fast_call_app/model/HospitalList.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  List<HospitalList> hospitalList = [
    HospitalList(
      hosName: 'โรงพยาบาลกรุงเทพคริสเตียน',
      hosWeb: 'http://www.bch.in.th/',
      hosFacebook: 'BangkokChristianHospital',
      hosPhone: '02-625-9000',
      hosLatitude: '13.7757387',
      hosLongtitude: '100.158336',
      hosImage: 'h1.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลกรุงเทพ',
      hosWeb: 'https://www.bangkokhospital.com/',
      hosFacebook: 'BangkokHospital ',
      hosPhone: '02-310-3000',
      hosLatitude: '13.7756595',
      hosLongtitude: '100.1583354',
      hosImage: 'h2.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลบางโพ',
      hosWeb: 'https://bangpo-hospital.com/',
      hosFacebook: 'BangpoHospital',
      hosPhone: '02-587-0144',
      hosLatitude: '13.8070111',
      hosLongtitude: '100.5210986',
      hosImage: 'h3.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลนครธน',
      hosWeb: 'https://www.nakornthon.com/home',
      hosFacebook: 'Nakornthon Hospital',
      hosPhone: '02-416-5454',
      hosLatitude: '13.6606775',
      hosLongtitude: '100.4320174',
      hosImage: 'h4.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลเกษมราษฎร์ บางแค',
      hosWeb: 'https://www.kasemrad.co.th/Bangkae/th/site/home',
      hosFacebook: 'KasemradBK',
      hosPhone: '02-804-8959',
      hosLatitude: '13.710611',
      hosLongtitude: '100.3964439',
      hosImage: 'h5.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลรามคำแหง',
      hosWeb: 'https://ram-hosp.co.th/',
      hosFacebook: 'ramhospital',
      hosPhone: '02-743-9999',
      hosLatitude: '13.758102',
      hosLongtitude: '100.6344867',
      hosImage: 'h6.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลสุขุมวิท',
      hosWeb: 'https://www.sukumvithospital.com/home.php',
      hosFacebook: 'sukumvithospital',
      hosPhone: '02-391-0011',
      hosLatitude: '13.7189319',
      hosLongtitude: '100.5849937',
      hosImage: 'h7.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลยันฮี',
      hosWeb: 'https://th.yanhee.net/',
      hosFacebook: 'YanheeHospital.YH',
      hosPhone: '02-879-0300',
      hosLatitude: '13.7994935',
      hosLongtitude: '100.5093831',
      hosImage: 'h8.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลไทยนครินทร์',
      hosWeb: 'https://thainakarin.co.th/',
      hosFacebook: 'ThainakarinHospital',
      hosPhone: '02-340-6499',
      hosLatitude: '13.6681477',
      hosLongtitude: '100.6363752',
      hosImage: 'h9.png',
    ),
    HospitalList(
      hosName: 'โรงพยาบาลเจ้าพระยา',
      hosWeb: 'https://www.chaophya.com/',
      hosFacebook: 'hospitalchaophya ',
      hosPhone: '02-884-7000',
      hosLatitude: '13.7804403',
      hosLongtitude: '100.4684164',
      hosImage: 'h10.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'สายด่วนรพ.กทม.',
          style: GoogleFonts.itim(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.28,
            child: Image.asset(
              'assets/images/bk1.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: hospitalList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailUI(hospitalList: hospitalList[index]),
                      ),
                    );
                  },
                  leading: ClipOval(
                    child: Image.asset(
                      'assets/images/${hospitalList[index].hosImage}',
                    ),
                  ),
                  title: Text(
                    hospitalList[index].hosName,
                  ),
                  subtitle: Text(
                    'โทร. ' + hospitalList[index].hosPhone,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
