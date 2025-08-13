import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:unievents/ui/common/customwidget/text_helper.dart';
import 'package:unievents/ui/common/ui_helpers.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import 'resource_viewmodel.dart';

class ResourceView extends StackedView<ResourceViewModel> {
  const ResourceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ResourceViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: text_helper(data: "Resource", fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: ApiHelper.allresource(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Icon(Icons.error, size: 48));
          }
          if (!snapshot.hasData) {
            return displaysimpleprogress(context);
          }
          final items = snapshot.data as List;
          if (items.isEmpty) {
            return Center(
              child: text_helper(data: "No Items Found"),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final data = items[index] as Map<String, dynamic>;
                final isOwner =
                    data['uid'] == viewModel.sharedpref.readString("email");
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      if (!isOwner) {
                        viewModel.chat(data['uid'], context);
                      }
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            data['type'] == "img"
                                ? Expanded(
                                    flex: 7,
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.grey[200],
                                      child: Image.network(
                                        data['img'],
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                            const Icon(Icons.broken_image),
                                        loadingBuilder: (ctx, child, loading) {
                                          if (loading == null) return child;
                                          return Center(
                                              child:
                                                  displaysimpleprogress(ctx));
                                        },
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PDfView(
                                                    url: data['img'],
                                                  )));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.grey[200],
                                      child: const Icon(Icons.picture_as_pdf),
                                    ),
                                  )),
                          ],
                        ),
                        if (isOwner)
                          Positioned(
                            top: 6,
                            right: 6,
                            child: InkWell(
                              onTap: () =>
                                  viewModel.deletelost(data['_id'], context),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.delete,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: 200,
                              height: 80,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.black,
                                    Colors.transparent
                                  ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            )),
                        Positioned(
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: text_helper(
                                data: data['des'],
                                color: Colors.white,
                                size: fontSize12,
                                textAlign: TextAlign.start,
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      )),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => viewModel.file(context),
            child: const Icon(Icons.picture_as_pdf),
          ),
          verticalSpaceMedium,
          FloatingActionButton(
            onPressed: () => viewModel.pic(context),
            child: const Icon(Icons.image),
          ),
        ],
      ),
    );
  }

  @override
  ResourceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResourceViewModel();
}

class PDfView extends StatelessWidget {
  PDfView({super.key, required this.url});
  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SfPdfViewer.network(url),
    );
  }
}
