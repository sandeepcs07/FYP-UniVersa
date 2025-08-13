import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import '../../../widgets/common/homedetails/homedetails.dart';
import 'admin_viewmodel.dart';

class AdminView extends StackedView<AdminViewModel> {
  const AdminView({Key? key}) : super(key: key);

  static const _sectionSpacing = SizedBox(height: 24);


  @override
  Widget builder(
    BuildContext context,
    AdminViewModel viewModel,
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
                      data: "Admin Pannel",
                      size: fontSize18,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                    verticalSpaceTiny,
                    text_helper(
                      data: "Manage All things",
                      color: white,
                    ),
                  ],
                ),
              ),
              horizontalSpaceSmall,
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
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  title: "Events",
                  onTap: viewModel.allevent,
                  builder: () => _horizontalList(
                    future: ApiHelper.allevent(),
                    itemBuilder: (ctx, data) => _imageCard(data['img']),
                  ),
                ),
                _sectionSpacing,
                _buildSection(
                  title: "Time Table",
                  onTap: viewModel.alltimetable,
                  builder: () => _horizontalList(
                    future: ApiHelper.alltimetable(),
                    itemBuilder: (ctx, data) => _imageCard(data['img']),
                  ),
                ),
                _sectionSpacing,
                _buildSection(
                  title: "Jobs",
                  onTap: viewModel.alljobs,
                  builder: () => _horizontalList(
                    future: ApiHelper.alljob(),
                    itemBuilder: (ctx, data) => _imageCard(data['img']),
                  ),
                ),
              ],
            ),
          ),
        )));
  }

  Widget _buildSection({
    required String title,
    required VoidCallback onTap,
    required Widget Function() builder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title, onTap: onTap),
        verticalSpaceTiny,
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: builder(),
        ),
      ],
    );
  }


  Widget _horizontalList({
    required Future future,
    required Widget Function(BuildContext, Map<String, dynamic>) itemBuilder,
    double height = 150,
  }) {
    return SizedBox(
      height: height,
      child: FutureBuilder(
        future: future,
        builder: (ctx, AsyncSnapshot snapshot) {
          if (snapshot.hasError) return const Center(child: Icon(Icons.error));
          if (!snapshot.hasData) return displaysimpleprogress(ctx);
          final list = snapshot.data as List;
          if (list.isEmpty) return const Center(child: Text("No Data"));
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (ctx, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: itemBuilder(ctx, list[i] as Map<String, dynamic>),
            ),
          );
        },
      ),
    );
  }

  Widget _imageCard(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      width: 150,
      height: 150,
      fit: BoxFit.cover,
      placeholder: (c, u) => displaysimpleprogress(c),
      errorWidget: (c, u, e) => const Icon(Icons.error),
    );
  }


  Widget cat(BuildContext context, AdminViewModel viewModel, String img,
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
  AdminViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminViewModel();
}
