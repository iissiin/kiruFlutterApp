import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiru/home/data/feed_data_repository.dart';
import 'package:kiru/home/bloc/home_feed_bloc.dart';
import 'package:kiru/kiruAssets/colors.dart';
import 'package:kiru/models/feed_tab.dart';
import 'package:kiru/widgets/posts_grid.dart';
import 'package:kiru/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeFeedBloc(FeedDataRepository())
            ..add(HomeFeedFetchDataEvent(FeedTab.recommendations)),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 16),

            // ВЕРХНЯЯ ПАНЕЛЬ
            Padding(
              padding: const EdgeInsets.only(bottom: 18, right: 18, left: 18),
              child: TopBar(
                onTabChanged: (tab) {
                  context.read<HomeFeedBloc>().add(HomeFeedChangeTabEvent(tab));
                },
              ),
            ),

            // GRID ФОТОК
            Expanded(
              child: BlocBuilder<HomeFeedBloc, HomeFeedState>(
                builder: (context, state) {
                  if (state is HomeFeedLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeFeedLoadedState) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: PostsGrid(images: state.images),
                    );
                  } else if (state is HomeFeedErrorState) {
                    return Center(child: Text('Ошибка: ${state.message}'));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
