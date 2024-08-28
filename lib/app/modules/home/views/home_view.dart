import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                _buildBackgroundContainer(context),
                _buildTopContainer(context),
                _buildBottomContainer(context),
              ],
            ),
          );
        });
  }

  Widget _buildBackgroundContainer(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xff161D3A),
        ),
      ),
    );
  }

  Widget _buildTopContainer(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff161D3A),
          borderRadius: BorderRadius.only(
            bottomLeft:
                Radius.circular(MediaQuery.of(context).size.width * 0.2),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 34,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Yusup Supriyadi👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomContainer(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(MediaQuery.of(context).size.width * 0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List hazard report',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Agustus 2024',
              style: TextStyle(fontSize: 10, color: Colors.grey[800]),
            ),
            SizedBox(height: 4),
            _buildTimelineTile(
              date: DateTime(2024, 8, 1),
              description:
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of...',
              dangerCode: 4,
              isFirst: true,
              isLast: false,
            ),
            _buildTimelineTile(
              date: DateTime(2024, 8, 16),
              description:
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of...',
              dangerCode: 3,
              isFirst: false,
              isLast: false,
            ),
            _buildTimelineTile(
              date: DateTime(2024, 8, 24),
              description:
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of...',
              dangerCode: 2,
              isFirst: false,
              isLast: false,
            ),
            _buildTimelineTile(
              date: DateTime(2024, 8, 29),
              description:
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of...',
              dangerCode: 1,
              isFirst: false,
              isLast: true,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Lihat Selengkapnya',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineTile({
    required DateTime date,
    required String description,
    required int dangerCode,
    required bool isFirst,
    required bool isLast,
  }) {
    controller.getDangerData(dangerCode);
    return TimelineTile(
      axis: TimelineAxis.vertical,
      alignment: TimelineAlign.start,
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: Colors.grey[300]!,
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        height: 38,
        indicatorXY: 0.65,
        padding: EdgeInsets.only(right: 8, bottom: 6, top: 6),
        indicator: Stack(
          children: [
            Icon(
              FontAwesomeIcons.calendar,
              color: Colors.blue[800],
              size: 30,
            ),
            Center(
              child: Text(
                '${date.day}',
                style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      endChild: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: 10,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: controller.dangerSecondary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: controller.dangerColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                'BAHAYA: ${controller.dangerDescription}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
