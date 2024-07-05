import 'package:flutter/material.dart';
import 'package:smart_save/constants/app_style.dart';
import 'package:smart_save/provider/favorite_provider.dart';
import '../../constants/app_colors.dart';
import '../products/helper/rating.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final  favoriteProduct=FavoriteProvider.of(context);
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Wishlist',
                style: appNameHead()
                    .copyWith(fontSize: 26, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favoriteProduct.favorites.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 88,
                            child: AspectRatio(
                              aspectRatio: 0.88,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: background,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.network(favoriteProduct.favorites[index].thumbnail!),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        favoriteProduct.favorites[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        style: subhead.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 8),
                                       Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ProductRating(rating: favoriteProduct.favorites[index].rating!,),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text.rich(
                                        TextSpan(
                                          text: "\$${favoriteProduct.favorites[index].price}",
                                          style: subhead.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  ),
                                   Positioned(
                                      right: -10,
                                      top: -20,
                                      child: CircleAvatar(backgroundColor: background,
                                        radius: 30,
                                        child: Icon(
                                          favoriteProduct.isExist((favoriteProduct.favorites[index])) ?Icons.favorite:Icons.favorite_border_outlined,
                                          color: Colors.red,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
