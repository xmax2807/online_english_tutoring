import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/screens/shared_components/teacher_profile_info.dart';
import 'package:online_english/screens/tutor/tutor_book_screen.dart';
import 'package:readmore/readmore.dart';

import '../../data/model/tutor_model/dto/detail_teacher_profile.dart';
import '../../gen/assets.gen.dart';
import '../../services/tutor_info_service.dart';
import '../../utils/theme/my_theme.dart';
import 'components/button_group.dart';

class TutorDetailScreen extends StatelessWidget {
  final String tutorId;
  const TutorDetailScreen({super.key, required this.tutorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, _) {
        ref.read(tutorDetailServiceProvider).getTutorDetail(tutorId);
        if (ref.watch(tutorDetailServiceProvider).detailInfo == null) {
          return const Placeholder();
        }
        final TeacherDetailDTO data =
            ref.watch(tutorDetailServiceProvider).detailInfo!;
        return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: [
              TeacherProfileWidget(
                teacherName: data.user.name ?? 'Unknown',
                nationality: data.user.country ?? '',
                svgFlag: Assets.flags.fr,
                dimension: 100,
                rating: data.avgRating,
              ),
              const TutorButtonGroup(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: MyTheme.outlineButtonStyle,
                    child: const Text("Message me"),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TutorBookingScreen()),
                        );
                      },
                      style: MyTheme.flatButtonStyle,
                      child: const Text("Start learning with me")),
                ],
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(8),
                title: Text(
                  "About me",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: ReadMoreText(
                  data.bio,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.colors.secondaryColor),
                  lessStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.colors.secondaryColor),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(8),
                minVerticalPadding: 8,
                title: Text(
                  "Teaching Experience",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle:
                    data.experience == null ? null : Text(data.experience!),
              ),
              const Placeholder(),
              ListTile(
                contentPadding: const EdgeInsets.all(8),
                minVerticalPadding: 8,
                title: Text(
                  "Languages",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: data.languages == null
                    ? null
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (String lang in data.languages!.split(','))
                            TextButton(
                              onPressed: () {},
                              style: MyTheme.tagButtonStyle,
                              child: Text(lang),
                            ),
                        ],
                      ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(8),
                minVerticalPadding: 8,
                title: Text(
                  "Specialties",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: data.specialties == null
                    ? null
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (String skill in data.specialties!.split(','))
                            TextButton(
                              onPressed: () {},
                              style: MyTheme.tagButtonStyle,
                              child: Text(skill),
                            ),
                        ],
                      ),
              ),
            ]);
      }),
    );
  }
}
