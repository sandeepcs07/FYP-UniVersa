import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import 'alltimetable_viewmodel.dart';

class AlltimetableView extends StackedView<AlltimetableViewModel> {
  const AlltimetableView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AlltimetableViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: text_helper(
          data: "All Time Table",
          fontWeight: FontWeight.bold,
          size: fontSize18,
        ),
      ),
      body: FutureBuilder(
        future: ApiHelper.alltimetable(),
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
    );
  }

  Widget listdata(AlltimetableViewModel viewModel, BuildContext context,
      AsyncSnapshot snapshot, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
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
        children: [
          // 1. Wrap your thumbnail in a GestureDetector + Hero:
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FullScreenImagePage(
                    imageUrl: snapshot.data[index]['img'],
                    heroTag: 'imageHero-$index', // unique tag per image
                  ),
                ),
              );
            },
            child: Hero(
              tag: 'imageHero-$index',
              child: CachedNetworkImage(
                imageUrl: snapshot.data[index]['img'],
                imageBuilder: (context, imageProvider) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => displaysimpleprogress(context),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),

          verticalSpaceMedium,
          viewModel.sharedpref.readString("email") !=
                  snapshot.data[index]['uid']
              ? const SizedBox.shrink()
              : Row(
                  children: [
                    button_helper(
                        onpress: () async {
                          displayprogress(context);
                          await ApiHelper.deletetimetable(
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
  AlltimetableViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AlltimetableViewModel();
}


// 2. Create your full-screen viewer page:
class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const FullScreenImagePage({
    Key? key,
    required this.imageUrl,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // a back button is provided automatically
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: InteractiveViewer(
            // pinch, zoom, pan:
            minScale: 0.5,
            maxScale: 4.0,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
