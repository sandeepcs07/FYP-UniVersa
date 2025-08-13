import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marquee/marquee.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import 'homedetails_model.dart';

class Homedetails extends StackedView<HomedetailsModel> {
  const Homedetails({super.key});

  static const _padding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const _sectionSpacing = SizedBox(height: 24);

  @override
  Widget builder(
      BuildContext context, HomedetailsModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: _padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderImage(context),
              verticalSpaceMedium,
              _buildMarquee(),
              _sectionSpacing,
              _buildCategoriesRow(context, viewModel),
              _sectionSpacing,
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
              _sectionSpacing,
              _buildSection(
                title: "Notes",
                onTap: () => viewModel.allnotes(),
                builder: () => _horizontalList(
                  height: 100,
                  future: ApiHelper.allnotes(
                      viewModel.sharedpref.readString("email")),
                  itemBuilder: (ctx, data) => _noteCard(data),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.chatbot,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Iconsax.message1, color: Colors.white),
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        "assets/uni.jpg",
        width: screenWidth(context),
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMarquee() {
    return SizedBox(
      height: 20,
      child: Marquee(
        text: 'Best University in the world with best teachers.',
        style: const TextStyle(fontWeight: FontWeight.w600),
        velocity: 80,
        blankSpace: 40,
      ),
    );
  }

  Widget _buildCategoriesRow(BuildContext context, HomedetailsModel vm) {
    final cats = [
      ['assets/event.svg', vm.allevent],
      ['assets/timetable.png', vm.alltimetable],
      ['assets/job.png', vm.alljobs],
      ['assets/notes.png', () => vm.allnotes()],
      ['assets/lost.png', () => vm.lostandfound()],
      ['assets/resource.png', () => vm.resource()],
      ['assets/todolist.png', () => vm.todolist()],
    ];
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (ctx, i) {
          final icon = cats[i][0] as String;
          final fn = cats[i][1] as VoidCallback;
          return InkWell(
            onTap: fn,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: icon.endsWith('.svg')
                      ? SvgPicture.asset(icon, width: 28, height: 28)
                      : Image.asset(icon, width: 28, height: 28),
                ),
                verticalSpaceTiny,
                text_helper(
                  data: icon
                      .split('/')
                      .last
                      .split('.')
                      .first
                      .capitalize(), // extension method to capitalize
                  size: fontSize10,
                ),
              ],
            ),
          );
        },
      ),
    );
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

  Widget _noteCard(Map data) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text_helper(
            data: data['title'],
            fontWeight: FontWeight.bold,
          ),
          verticalSpaceTiny,
          text_helper(
            data: data['des'],
            size: fontSize10,
          ),
        ],
      ),
    );
  }

  @override
  HomedetailsModel viewModelBuilder(BuildContext context) => HomedetailsModel();
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionHeader({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text_helper(
              data: title,
              fontWeight: FontWeight.bold,
              size: fontSize14,
            ),
            Row(
              children: [
                text_helper(data: "View more", size: fontSize10),
                const SizedBox(width: 4),
                const Icon(Iconsax.arrow_circle_right4, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension StringCapitalize on String {
  String capitalize() =>
      isEmpty ? this : this[0].toUpperCase() + substring(1).toLowerCase();
}
