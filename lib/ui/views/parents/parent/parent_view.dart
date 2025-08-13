import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquee/marquee.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/customwidget/text_helper.dart';
import 'package:unievents/ui/common/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../common/app_colors.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import 'parent_viewmodel.dart';

class ParentView extends StackedView<ParentViewModel> {
  const ParentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ParentViewModel viewModel,
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
                      color: black,
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
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              verticalSpaceMedium,
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/uni.jpg",
                    fit: BoxFit.cover,
                    width: screenWidth(context),
                  )),
              verticalSpaceMedium,
              SizedBox(
                width: screenWidth(context),
                height: 15,
                child: Marquee(
                  text: 'Best University in the world with best teachers.',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 100.0,
                  pauseAfterRound: const Duration(seconds: 2),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 2),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 1000),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
              verticalSpaceLarge,
              Wrap(
                children: [
                  cat(context, viewModel, "assets/event.svg",
                      () => viewModel.allevent(), "All Events",
                      i: "s"),
                  cat(
                    context,
                    viewModel,
                    "assets/timetable.png",
                    () => viewModel.alltimetable(),
                    "Time Table",
                  ),
                  cat(
                    context,
                    viewModel,
                    "assets/logout.png",
                    () => viewModel.logout(),
                    "Logout",
                  ),
                ],
              ),
            ],
          ),
        )));
  }

  Widget cat(BuildContext context, ParentViewModel viewModel, String img,
      Function funtion, String txt,
      {String i = "i"}) {
    return InkWell(
      onTap: () => funtion(),
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Theme.of(context).primaryColorLight)
              ],
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
            children: [
              i == "i"
                  ? Image.asset(
                      img,
                      width: screenWidthCustom(context, 0.1),
                      height: screenWidthCustom(context, 0.1),
                    )
                  : SvgPicture.asset(
                      img,
                      width: screenWidthCustom(context, 0.1),
                      height: screenWidthCustom(context, 0.1),
                    ),
              verticalSpaceSmall,
              text_helper(
                data: txt,
                fontWeight: FontWeight.bold,
                size: fontSize12,
              ),
            ],
          )),
    );
  }

  @override
  ParentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ParentViewModel();
}
