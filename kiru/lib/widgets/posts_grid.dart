import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiru/kiruAssets/appImages.dart';
import 'package:kiru/models/app_image.dart';

class PostsGrid extends StatelessWidget {
  final List<AppImageModel> images;

  const PostsGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          mainAxisExtent: 290,
        ),
        itemBuilder: (_, index) {
          return PostItem(imageModel: images[index], index: index);
        },
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final AppImageModel imageModel;
  final int index;

  const PostItem({super.key, required this.imageModel, required this.index});

  @override
  Widget build(BuildContext context) {
    final isLiked = index.isEven; // Четные индексы - лайкнуты

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            imageModel.url, // Используем URL из модели
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            // Показываем placeholder пока загружается
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            // Показываем placeholder если ошибка загрузки
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),

        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                isLiked ? AppImages.heartPNG : AppImages.unfilledHeartPNG,
                width: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
