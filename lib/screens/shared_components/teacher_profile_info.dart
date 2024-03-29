import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;

import '../../data/setting/settings.dart';

class TeacherProfileWidget extends StatelessWidget {
  final String teacherName, nationality, svgFlag;
  final SvgPicture? flag;
  final double? rating;
  final String avatar;
  final double dimension;
  final double maxWidth;
  const TeacherProfileWidget({
    super.key,
    required this.teacherName,
    required this.nationality,
    required this.svgFlag,
    this.dimension = 80,
    this.maxWidth = 150,
    this.flag,
    this.rating = 0,
    this.avatar = "assets/my_custom_icons/avatar.svg",
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox.square(
        dimension: dimension,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10000),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: avatar,
              errorWidget: (context, url, error) {
                dev.log(error.toString());
                return SvgPicture.asset("assets/my_custom_icons/avatar.svg");
              },
            )
            // child: Image.network(
            //   avatar,
            //   errorBuilder: (context, error, _) {
            //     dev.log(error.toString());
            //     return SvgPicture.asset("assets/my_custom_icons/avatar.svg");
            //   },
            // ),
            ),
      ),
      const SizedBox(width: 10),
      SizedBox(
        height: max(dimension, 70),
        width: maxWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                teacherName,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: context.theme.colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 15,
                  child: SvgPicture.asset(
                    svgFlag,
                    fit: BoxFit.contain,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    AppSetting.instance.countryHelper
                        .getCountryName(nationality),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            rating == null
                ? const Text('no review yet')
                : RatingBarIndicator(
                    rating: rating!,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                  ),
          ],
        ),
      )
    ]);
  }
}
