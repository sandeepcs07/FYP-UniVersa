import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/apihelper/apihelper.dart';
import 'package:unievents/ui/common/app_colors.dart';

import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import '../../common/allchat/allchat_view.dart';
import 'teacher_viewmodel.dart';

class TeacherView extends StackedView<TeacherViewModel> {
  const TeacherView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TeacherViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: white),
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
                    color: white,
                    size: fontSize18,
                  ),
                  text_helper(
                    data: viewModel.sharedpref.readString("cat"),
                    size: fontSize12,
                    color: Colors.grey[200],
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

  Widget bodyContainer(TeacherViewModel viewModel, BuildContext context) {
    Widget screen = home(context, viewModel);
    switch (viewModel.currentIndex) {
      case 0:
        screen = home(context, viewModel);
        break;
      case 1:
        screen = const AllchatView();
        break;
    }
    return SizedBox(
      width: screenWidth(context),
      height: screenHeight(context),
      child: Center(child: screen),
    );
  }

  Widget home(BuildContext context, TeacherViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            text_helper(
              data: "Stay up to date with university events",
            ),
            Container(
              decoration: BoxDecoration(
                  color:
                      getColorWithOpacity(Theme.of(context).primaryColor, 0.1),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text_helper(
                          data: "Events",
                          fontWeight: FontWeight.bold,
                          size: fontSize20,
                        ),
                        const Icon(Iconsax.arrow_circle_right4)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => viewModel.allevent(),
                    child: SizedBox(
                      width: screenWidth(context),
                      height: 200,
                      child: FutureBuilder(
                        future: ApiHelper.allevent(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.toString() == '[]') {
                              return Center(
                                child: text_helper(data: "No Data"),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(2, 2),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              color: getColorWithOpacity(
                                                  black, 0.1))
                                        ]),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data[index]['img'],
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: screenWidthCustom(context, 0.4),
                                        height: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          displaysimpleprogress(context),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          } else if (snapshot.hasError) {
                            return const Icon(Icons.error);
                          } else {
                            return displaysimpleprogress(context);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceTiny,
            Container(
              decoration: BoxDecoration(
                  color:
                      getColorWithOpacity(Theme.of(context).primaryColor, 0.1),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text_helper(
                          data: "Time Table",
                          fontWeight: FontWeight.bold,
                          size: fontSize20,
                        ),
                        const Icon(Iconsax.arrow_circle_right4)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => viewModel.alltimetable(),
                    child: SizedBox(
                      width: screenWidth(context),
                      height: 200,
                      child: FutureBuilder(
                        future: ApiHelper.alltimetable(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.toString() == '[]') {
                              return Center(
                                child: text_helper(data: "No Data"),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(2, 2),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              color: getColorWithOpacity(
                                                  black, 0.1))
                                        ]),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data[index]['img'],
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: screenWidthCustom(context, 0.4),
                                        height: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          displaysimpleprogress(context),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          } else if (snapshot.hasError) {
                            return const Icon(Icons.error);
                          } else {
                            return displaysimpleprogress(context);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceTiny,
            Container(
              decoration: BoxDecoration(
                  color:
                      getColorWithOpacity(Theme.of(context).primaryColor, 0.1),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text_helper(
                          data: "Jobs",
                          fontWeight: FontWeight.bold,
                          size: fontSize20,
                        ),
                        const Icon(Iconsax.arrow_circle_right4)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(context),
                    height: 200,
                    child: FutureBuilder(
                      future: ApiHelper.alljob(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.toString() == '[]') {
                            return Center(
                              child: text_helper(data: "No Data"),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(2, 2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            color:
                                                getColorWithOpacity(black, 0.1))
                                      ]),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot.data[index]['img'],
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: screenWidthCustom(context, 0.4),
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        displaysimpleprogress(context),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        } else if (snapshot.hasError) {
                          return const Icon(Icons.error);
                        } else {
                          return displaysimpleprogress(context);
                        }
                      },
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

  Widget cat(BuildContext context, TeacherViewModel viewModel, String img,
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
  TeacherViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherViewModel();
}
