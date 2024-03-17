import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/drawer.dart';
import 'package:pile_up/features/matching_screen/presentation/controller/get_dogs_bloc.dart';
import 'package:pile_up/features/matching_screen/presentation/controller/get_dogs_event.dart';
import 'package:pile_up/features/matching_screen/presentation/controller/get_dogs_state.dart';
import 'package:pile_up/features/matching_screen/presentation/widgets/pet_card.dart';

class MatchingScreen extends StatefulWidget {
  const MatchingScreen({Key? key}) : super(key: key);

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  void initState() {
    BlocProvider.of<GetDogsBloc>(context).add(GetDogsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: homeAppBar(
        context,
        actionIcon: Icons.settings,
        centerWidget: const Text(
          StringManager.appName,
          style: TextStyle(color: AppColors.primaryColor),
        ),
        leadingKey: _scaffoldKey,
      ),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: BlocBuilder<GetDogsBloc, GetDogsState>(
          builder: (context, state) {
            if (state is GetDogsSuccessMessageState) {
              return Column(
                children: [
                  SizedBox(height: 8.h),
                  index < state.dogs.length
                      ? Draggable(
                          feedback: PetCard(dog: state.dogs[index]),
                          // the shown card behind the card you swipe
                          childWhenDragging: index < state.dogs.length
                              ? PetCard(dog: state.dogs[index])
                              : PetCard(dog: state.dogs[index]),
                          onDragCompleted: () {
                            if (index < state.dogs.length) {
                              // index++;
                            }
                          },
                          child: PetCard(dog: state.dogs[index]),
                        )
                      : SizedBox(),
                ],
              );
            } else if (state is GetDogsErrorMessageState) {
              return ErrorWidget(state.errorMessage);
            } else if (state is GetDogsLoadingState) {
              return const Text('Loading');
            } else {
              print(state);
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
