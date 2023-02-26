import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_clean_arch_setstate/core/utils/api_constance.dart';
import 'package:movies_app_clean_arch_setstate/core/utils/app_fonts.dart';
import 'package:movies_app_clean_arch_setstate/core/utils/dummy_moive_data.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/data/data_source/remote_movies_data_source.dart';
import 'package:movies_app_clean_arch_setstate/movies_module/presentation/controller/movies_controller.dart';

import 'package:shimmer/shimmer.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  // =================== UI BUSINESS LOGI =======================//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====================== FutureBuilder Now Playing ================================//
            FutureBuilder(
              future: MovieController.getNowPlayingDataFromServer(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {},
                      ),
                      items: snapshot.data!.map(
                        (item) {
                          return GestureDetector(
                            key: const Key('openMovieMinimalDetail'),
                            onTap: () {
                              /// TODO : NAVIGATE TO MOVIE DETAILS
                            },
                            child: Stack(
                              children: [
                                ShaderMask(
                                  shaderCallback: (rect) {
                                    return const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        // fromLTRB
                                        Colors.transparent,
                                        Colors.black,
                                        Colors.black,
                                        Colors.transparent,
                                      ],
                                      stops: [0, 0.3, 0.5, 1],
                                    ).createShader(
                                      Rect.fromLTRB(
                                          0, 0, rect.width, rect.height),
                                    );
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: CachedNetworkImage(
                                    height: 560.0,
                                    imageUrl: MovieApiConstance.imageUrl(
                                        item.backdropPath!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Colors.redAccent.shade700,
                                              size: 16.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              'Now Playing'.toUpperCase(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    AppFontFamily.fontFamily,
                                                fontWeight: AppFontWeight.light,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16.0),
                                        child: Text(
                                          item.title!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily:
                                                AppFontFamily.fontFamily,
                                            fontWeight: AppFontWeight.regular,
                                            fontSize: 24.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                      height: 300,
                    child:  Center(
                        
                        
                          child: CircularProgressIndicator(
                                            color: Color.fromARGB(255, 205, 13, 13),
                                          ),
                        ),
                  );
                }
                if (snapshot.hasError) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "NetWork Not connected",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFontFamily.fontFamily,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "No Data",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFontFamily.fontFamily,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          
            // ======================== FutureBuilder Top rated  ==============================//
            /////////////////
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFontFamily.fontFamily,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO POPULAR SCREEN
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFontFamily.fontFamily,
                              fontWeight: AppFontWeight.regular,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ====================== FutureBuilder Top rated ================================//
            FutureBuilder(
              future: MovieController.getPopularDataFromServer(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: 170.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: moviesList.length,
                        itemBuilder: (context, index) {
                          final movie = snapshot.data![index];
                          return Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                /// TODO : NAVIGATE TO  MOVIE DETAILS
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                  imageUrl: MovieApiConstance.imageUrl(
                                      movie.backdropPath!),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                      height: 200,
                    child:  Center(
                        
                        
                          child: CircularProgressIndicator(
                                            color: Color.fromARGB(255, 205, 13, 13),
                                          ),
                        ),
                  );
                }
                if (snapshot.hasError) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "NetWork Not connected",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFontFamily.fontFamily,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "No Data",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFontFamily.fontFamily,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
         
            // ======================== FutureBuilder Top rated  ==============================//
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Rated",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFontFamily.fontFamily,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),

                  /// TODO : NAVIGATION TO Top Rated Movies Screen
                  InkWell(
                    onTap: () async {
                      BaseRemoteMoviesDataSource baseRemoteMoviesDataSource =
                          RemoteMoviesDataSource();
                      await baseRemoteMoviesDataSource.getNowPlayingMovies();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFontFamily.fontFamily,
                              fontWeight: AppFontWeight.regular,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
           
            // ====================== FutureBuilder Top rated ================================//
            FutureBuilder(
              future: MovieController.getTopRatedDataFromServer(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: 170.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final movie = snapshot.data![index];
                          // print(movie.backdropPath);
                          return Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                /// TODO : NAVIGATE TO  MOVIE DETAILS
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                  imageUrl: MovieApiConstance.imageUrl(
                                      movie.backdropPath!),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                   return const SizedBox(
                      height: 200,
                    child:  Center(
                        
                        
                          child: CircularProgressIndicator(
                                            color: Color.fromARGB(255, 205, 13, 13),
                                          ),
                        ),
                  );
                }
                if (snapshot.hasError) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "NetWork Not connected",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFontFamily.fontFamily,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "No Data",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFontFamily.fontFamily,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            
            // ======================== FutureBuilder Top rated  ==============================//
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
