import 'package:beautonomi/blocs/crud/baber/baber_bloc.dart';
import 'package:beautonomi/blocs/crud/baber/baber_state.dart';
import 'package:beautonomi/model/ui_model/hair_cutting_model.dart';
import 'package:beautonomi/model/ui_model/home_screen_model.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/utilites/location/finding_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../blocs/branches/branch_bloc.dart';
import '../../blocs/branches/branch_state.dart';
import '../../data/repositories/crud_repository.dart';
import '../../model/baber.dart';
import '../../model/category.dart';
import '../../widget/category_widget.dart';
import '../../widget/custom_text.dart';
import '../../widget/haid_cutting_service_widget.dart';
import '../../widget/main_branch_widget.dart';
import '../../widget/main_work_widget.dart';
import '../../widget/top_special_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BranchBloc _branchBloc;
  PageController controller = PageController();
  ScrollController hideScrollCtr = ScrollController();
  int _selectedCategoryIndex=-1;
  String _filter = '';

  void _updateFilter(String category){
    setState(() {
      _filter = category;
    });
  }

  void _handleCategoryClicked(int index){
    setState(() {
      if(_selectedCategoryIndex == index){
        _selectedCategoryIndex = -1;
      }else{_selectedCategoryIndex = index;}
    });
  }


  @override
  void initState() {
    super.initState();
    _branchBloc = BranchBloc();
  }

  @override
  void dispose() {
    _branchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BranchBloc>(
      create: (context) => BranchBloc(),
      child: BlocConsumer<BranchBloc, BranchState>(
          listener: (context, state) {},
          builder: (context, branchState) {
            if (branchState is BranchInitialState) {
              // Handle initial state if needed
            } else if (branchState is BranchUpdatedState) {
              // Access the state properties to build your UI
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/marker.png",
                          height: 23.43.h,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Image.asset(
                          "assets/angle-bottom.png",
                          height: 5.43.h,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: FutureBuilder<String>(
                              future: myLocation(branchState.currentLocation),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // While waiting for the future to complete, you can show a loading indicator
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  // If an error occurs while fetching the location, you can handle it here
                                  return Text("Error: ${snapshot.error}");
                                } else {
                                  // If the future has completed successfully, you can use the data in the UI
                                  final location =
                                      snapshot.data ?? "Unknown Location";
                                  return CustomText(
                                    title: location,
                                    color: kMainColor,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w500,
                                    maxLines: 1,
                                  );
                                }
                              },
                            )),
                      ],
                    ),
                  ),
                  elevation: 2,
                  backgroundColor: kSecondaryColor,
                  toolbarHeight: 80.h,
                  bottom: PreferredSize(
                    preferredSize: Size(0, 90.h),
                    child: Container(
                      color: kMainColor,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        // mainAxisAlignment: MainAxisAlignment.s,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/logo (1).png",
                                  height: 35.h,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/search.png",
                                        height: 22.h,
                                        color: kSecondaryColor,
                                      ),
                                      const Icon(
                                        Icons.favorite,
                                        size: 24,
                                        color: kSecondaryColor,
                                      ),
                                      const Icon(
                                        Icons.message,
                                        size: 24,
                                        color: kSecondaryColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                body: ListView(
                  padding: EdgeInsets.zero,
                  controller: hideScrollCtr,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: const [
                        MainBranchWidget(
                          title: "Main Branch",
                          image: "assets/branch.png",
                        ),
                        MainBranchWidget(
                          image: "assets/shop.png",
                          title: "Work Germany",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 190.h,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            // shrinkWrap: true,
                            // padding: EdgeInsets.symmetric(horizontal: 6),
                            itemCount: homeList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: MainWorkWidget(
                                    homeScreenModel: homeList[index],
                                  ));
                            },
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: SmoothPageIndicator(
                                    controller: controller, // PageController
                                    count: homeList.length,
                                    effect: const WormEffect(
                                        dotHeight: 12,
                                        dotWidth: 12,
                                        dotColor: kGreyColor,
                                        activeDotColor:
                                            kSecondaryColor), // your preferred effect
                                    // onDotClicked: (index){
                                    //
                                    // }
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomText(
                        title: "Category",
                        // "Main Branch",
                        color: kBlackColor,
                        fontSize: 17.h,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FutureBuilder(future: getCategoriesFromFirestore(),
                    builder: ((context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return const Center(child: CircularProgressIndicator(),);
                      } else if(snapshot.hasError){
                        return const Text('error');
                      } else if(snapshot.hasData){
                        List<CateGory> categoryList = snapshot.data!;
                        return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: InkWell(
                                onTap:(){
                                  _handleCategoryClicked(index);
                                  if(_selectedCategoryIndex == index){
                                    _updateFilter(categoryList[index].title);
                                  }
                                },
                                child: CategoryWidget(
                                  cateGoryModel: categoryList[index], index: index, isSelected: _selectedCategoryIndex==index,
                                ),
                              ));
                        },
                      );
                      } else {
                        return const Text('No data');
                      }
                    })),
                    
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomText(
                        title: "Top Specialist",
                        // "Main Branch",
                        color: kBlackColor,
                        fontSize: 17.h,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 380.h,
                      child: BlocBuilder<BaberBloc, BaberState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return const Center(
                              child: LinearProgressIndicator(),
                            );
                          } else if (state is ErrorState) {
                            return Center(child: Text(state.message));
                          } else if (state is BaberLoadedState) {
                            if(_filter != ''){
                              List<Baber> filteredList = state.babers.where((baber) => baber.services.keys.toList().contains(_filter)).toList();
                              ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              itemCount: state.babers.length,
                              itemBuilder: (context, index) {
                                Baber baber = filteredList[index];
                                //getting the price list
                                List<double> prices =
                                    baber.services.values.toList();
                                //finding the minimum value in the list
                                double minPrice = prices.reduce(
                                    (value, element) =>
                                        value < element ? value : element);
                                return Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TopSpecialistWidget(
                                      profileImage: baber.name,
                                      biography: baber.bio,
                                      rating:
                                          baber.totalRating / baber.reviewCount,
                                      totalRating: baber.totalRating,
                                      saloonImage: baber.saloon,
                                      name: baber.name,
                                      minCost: minPrice,
                                      distance: getDistanceBetweenCoordinates(
                                          branchState.currentLocation,
                                          branchState.destination),
                                    ),
                                  ),
                                );
                              },
                            );
                          
                            } 
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              itemCount: state.babers.length,
                              itemBuilder: (context, index) {
                                Baber baber = state.babers[index];
                                //getting the price list
                                List<double> prices =
                                    baber.services.values.toList();
                                //finding the minimum value in the list
                                double minPrice = prices.reduce(
                                    (value, element) =>
                                        value < element ? value : element);
                                return Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TopSpecialistWidget(
                                      profileImage: baber.name,
                                      biography: baber.bio,
                                      rating:
                                          baber.totalRating / baber.reviewCount,
                                      totalRating: baber.totalRating,
                                      saloonImage: baber.saloon,
                                      name: baber.name,
                                      minCost: minPrice,
                                      distance: getDistanceBetweenCoordinates(
                                          branchState.currentLocation,
                                          branchState.destination),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: Text('No babers'),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomText(
                        title: "Hair Cutting Services",
                        // "Main Branch",
                        color: kBlackColor,
                        fontSize: 17.h,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 220.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        itemCount: hairCuttingList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: HairCuttingServiceWidget(
                              hairCuttingModel: hairCutting[index],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
