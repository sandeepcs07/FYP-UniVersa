import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import 'alljob_viewmodel.dart';

class AlljobView extends StackedView<AlljobViewModel> {
  const AlljobView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AlljobViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: text_helper(
          data: "All Jobs",
          fontWeight: FontWeight.bold,
          size: fontSize18,
        ),
      ),
      body: Column(
        children: [
          verticalSpaceSmall,
          Expanded(
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
                      itemBuilder: (BuildContext context, int index) {
                        return listdata(viewModel, context, snapshot, index);
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
    );
  }

  Widget listdata(AlljobViewModel viewModel, BuildContext context,
      AsyncSnapshot snapshot, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 2),
                spreadRadius: 1,
                blurRadius: 1,
                color: getColorWithOpacity(black, 0.1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: snapshot.data[index]['img'],
            imageBuilder: (context, imageProvider) => Container(
              width: screenWidth(context),
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => displaysimpleprogress(context),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
          ),
          verticalSpaceSmall,
          text_helper(
            data: snapshot.data[index]['title'],
            fontWeight: FontWeight.bold,
          ),
          text_helper(
            data: snapshot.data[index]['des'],
            textAlign: TextAlign.start,
          ),
          verticalSpaceMedium,
          viewModel.sharedpref.readString("email") !=
                      snapshot.data[index]['uid'] &&
                  viewModel.sharedpref.readString("email") != "admin@admin.com"
              ? const SizedBox.shrink()
              : Row(
                  children: [
                    button_helper(
                        onpress: () async {
                          displayprogress(context);
                          await ApiHelper.deletejob(
                              snapshot.data[index]['_id'], context);
                          hideprogress(context);
                          viewModel.notifyListeners();
                        },
                        child: text_helper(data: "Delete")),
                    button_helper(
                        onpress: () => viewModel.event(snapshot.data[index]),
                        child: text_helper(data: "update")),
                  ],
                )
        ],
      ),
    );
  }

  @override
  AlljobViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AlljobViewModel();
}
