import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insta_post/commons/CommonCircularIcon.dart';
import 'package:insta_post/commons/common_button.dart';
import 'package:insta_post/commons/common_chip.dart';
import 'package:insta_post/commons/common_spacing.dart';
import 'package:insta_post/commons/common_text.dart';
import 'package:insta_post/constants/colors.dart';
import 'package:insta_post/constants/image_paths.dart';
import 'package:insta_post/constants/text_styles.dart';
import 'package:lottie/lottie.dart';

Widget cameraIcon() => Padding(
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Color(0xff9ed5ad),
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
    );

Widget tabBar() => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CommonText(
            data: "Smart Post",
            style: styleGothicTeal,
          ),
          CommonText(
            data: "Library",
            style: styleGothicGrey,
          ),
          CommonText(
            data: "Communities",
            style: styleGothicGrey,
          ),
          CommonText(
            data: "Share&Win",
            style: styleGothicGrey,
          ),
        ],
      ),
    );

Widget circularImage() => Container(
      width: 50, // Adjust size as needed
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3), // White ring
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(dp),
        radius: 28, // Adjust to fit within the ring
      ),
    );

Widget shareBotton(Function onPressed) => CommonButton(
    icon: AssetImage(starts),
    borderRadius: 500,
    height: 30,
    fontSize: 12,
    verticalPadding: 3,
    horizontalPadding: 15,
    onPressed: () => onPressed(),
    gradient: gradientBG,
    text: CommonText(style: styleSatoshi, data: "Ready to share"));

Widget postTile(int i) => ListTile(
      leading: circularImage(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          shareBotton(() {}),
          CommonText(
            data: "High-converting in Oriflame Community",
            style: styleGothicWhite,
          )
        ],
      ),
      trailing: Column(
        children: [
          CommonChip(child: CommonText(data: "$i of 3", style: styleSatoshi)),
          Spacer()
        ],
      ),
    );

Widget title({required String data}) => CommonChip(
    radius: 5,
    iconSize: 20,
    width: double.infinity,
    verticalPadding: 10,
    horizontalPadding: 10,
    icon: Icons.music_note,
    child: CommonText(
      data: data,
      style: styleGothicWhite,
    ));

Widget caption({required String data}) => CommonChip(
    radius: 5,
    width: double.infinity,
    verticalPadding: 10,
    horizontalPadding: 10,
    child: CommonText(
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      data: data,
      style: styleGothicWhite,
    ));

Widget quickShareRow() => Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          w20,
          CommonText(data: "Quick share to:", style: styleGothicWhite),
          w4,
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CommonCircularIcon(icon: FlutterLogo()),
                  w20,
                  CommonCircularIcon(
                      icon: FlutterLogo(), ringColor: Color(0xffff64ee)),
                  w20,
                  CommonCircularIcon(icon: FlutterLogo()),
                  w20,
                  CommonCircularIcon(
                      icon: FlutterLogo(), ringColor: Color(0xff75a5ff)),
                  w20,
                  CommonCircularIcon(icon: FlutterLogo()),
                  w20,
                  CommonCircularIcon(icon: FlutterLogo()),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget loder() => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          logo,
          scale: 1.5,
        ),
        h12,
        CommonText(
          data: "Generating your sales link..",
          fontSize: 13,
          style: styleGothicGrey,
        ),
        h12,
        Lottie.asset("assets/lottie/loding_bar.json"),
      ],
    );
