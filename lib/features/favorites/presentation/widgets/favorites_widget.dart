import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hookee/core/constants/colors.dart';
import 'package:hookee/features/home/data/models/user_model.dart';

class FavoritesWidget extends StatelessWidget {
  final User user;
  const FavoritesWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
         left: 4, right: 4
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
           
          ),
          child: ListTile(
            leading: Container(
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(user.imageUrl),
                  ),
                  border: Border.all(color: AppColors.accentColor)
              ),
              // child: CircleAvatar(
              //   radius: 40.0,
              //   backgroundColor: Colors.grey[300],
              //   child: ClipOval(
              //     child: CachedNetworkImage(
              //       imageUrl: user.imageUrl,
              //       placeholder: (context, url) => const CircularProgressIndicator(),
              //       errorWidget: (context, url, error) => const Icon(Icons.error),
              //       fit: BoxFit.cover,
              //       width: 60.0,
              //       height: 60.0,
              //     ),
              //   ),
              // ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name),
                Text(
                  user.profession,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
