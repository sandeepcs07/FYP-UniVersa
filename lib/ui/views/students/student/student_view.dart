import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/widgets/common/carpool/carpool.dart';
import 'package:unievents/ui/widgets/common/chats/chats.dart';
import 'package:unievents/ui/widgets/common/homedetails/homedetails.dart';
import 'package:unievents/ui/widgets/common/marketplace/marketplace.dart';

import '../../../common/app_colors.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import 'student_viewmodel.dart';

class StudentView extends StackedView<StudentViewModel> {
  const StudentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StudentViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: const IconThemeData(color: black),
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  text_helper(
                    data: viewModel.sharedpref.readString("name"),
                    fontWeight: FontWeight.bold,
                    color: black,
                    size: fontSize18,
                  ),
                  text_helper(
                    data: viewModel.sharedpref.readString("cat"),
                    size: fontSize12,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            horizontalSpaceSmall,
            CachedNetworkImage(
              imageUrl: viewModel.sharedpref.readString("img"),
              imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: screenWidthCustom(context, 0.1),
                  height: screenWidthCustom(context, 0.1),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              placeholder: (context, url) => displaysimpleprogress(context),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: text_helper(
                      data: "Settings & Activity",
                      size: fontSize24,
                      fontWeight: FontWeight.bold),
                ),
                verticalSpaceSmall,
                cat(context, viewModel, "assets/event.svg",
                    () => viewModel.addevent(), "Event",
                    i: "s"),
                cat(
                  context,
                  viewModel,
                  "assets/timetable.png",
                  () => viewModel.addtimetable(),
                  "TimeTable",
                ),
                cat(
                  context,
                  viewModel,
                  "assets/job.png",
                  () => viewModel.addjob(),
                  "Job",
                ),
                cat(
                  context,
                  viewModel,
                  "assets/notes.png",
                  () => viewModel.addnotes(),
                  "Notes",
                ),
                const Expanded(child: SizedBox()),
                cat(
                  context,
                  viewModel,
                  "assets/logout.png",
                  () => viewModel.logout(),
                  "Logout",
                ),
                verticalSpaceSmall,
              ]),
        ),
      ),
      body: SafeArea(child: bodyContainer(viewModel, context)),
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedColorOpacity: 1,
          currentIndex: viewModel.currentIndex,
          onTap: (i) => viewModel.updateindex(i),
          items: viewModel.bottomcontents),
    );
  }

  Widget bodyContainer(StudentViewModel viewModel, BuildContext context) {
    Widget screen = const Homedetails();
    switch (viewModel.currentIndex) {
      case 0:
        screen = const Homedetails();
        break;
      case 1:
        screen = const Chats();
        break;
      case 2:
        screen = const Carpool();
        break;
      case 3:
        screen = const Marketplace();
        break;
    }
    return SizedBox(
      width: screenWidth(context),
      height: screenHeight(context),
      child: Center(child: screen),
    );
  }

  Widget cat(BuildContext context, StudentViewModel viewModel, String img,
      Function funtion, String text,
      {String i = "i"}) {
    return InkWell(
      onTap: () => funtion(),
      child: Container(
        width: screenWidth(context),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).primaryColorLight, width: 1),
          color: getColorWithOpacity(Theme.of(context).primaryColorLight, 0.1),
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //       offset: const Offset(2, 2),
          //       blurRadius: 2,
          //       spreadRadius: 1,
          //       color: Theme.of(context).primaryColorLight)
          // ],
        ),
        child: Row(
          children: [
            i == "i"
                ? Image.asset(
                    img,
                    width: screenWidthCustom(context, 0.08),
                    height: screenWidthCustom(context, 0.08),
                  )
                : SvgPicture.asset(
                    img,
                    width: screenWidthCustom(context, 0.08),
                    height: screenWidthCustom(context, 0.08),
                  ),
            horizontalSpaceSmall,
            text_helper(
              data: text,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  @override
  StudentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentViewModel();
}
