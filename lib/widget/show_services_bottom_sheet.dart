import 'package:beautonomi/blocs/booking/booking_state.dart';
import 'package:beautonomi/utilites/booking/booking.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/widget/custom_button.dart';
import 'package:beautonomi/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/booking/booking_bloc.dart';
import '../blocs/booking/booking_event.dart';
import '../model/baber.dart';
import '../model/client.dart';

class ShowServiceBottomSheetsWidget extends StatefulWidget {
  final Baber baber;
  final Client user;
  const ShowServiceBottomSheetsWidget({super.key, required this.baber, required this.user});

  @override
  State<ShowServiceBottomSheetsWidget> createState() => _ShowServiceBottomSheetsWidgetState();
}

class _ShowServiceBottomSheetsWidgetState extends State<ShowServiceBottomSheetsWidget> {
  double _totalCost = 0;
  Map<String, double> _selectedServices = {};
  bool _checked = false;

  @override
  void dispose() {
    _totalCost;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingBloc>(
      create: (create) => BookingBloc(),
      child: BlocConsumer(
          builder: (context, state) {
            if (state is ServicesNotSelected) {
              return ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  ListTile(
                    leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back)),
                    title: Center(
                      child: Container(
                        margin: const EdgeInsets.only(right: 40),
                        child: CustomText(
                          title: "Select Services\t Total Cost: $_totalCost",
                          color: kBlackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: widget.baber.services.length,
                          itemBuilder: (context, index) {
                            String service =
                                widget.baber.services.keys.elementAt(index);
                            double price =
                                widget.baber.services.values.elementAt(index);
                            return Row(
                              children: [
                                Checkbox(
                                    value: _checked,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value!) {
                                          _totalCost -= price;
                                          _selectedServices.remove(service);
                                        } else {
                                          _totalCost += price;
                                          _selectedServices.addEntries(
                                              {service: price}.entries);
                                        }
                                        _checked = !_checked;
                                      });
                                    }),
                                Text(service),
                                Text(
                                  price.toString(),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            );
                          },
                        ),
                        CustomButton(
                          btnHeight: 45.h,
                          btnColor: kSecondaryColor,
                          title: "Book Now",
                          onPressed: () {
                            BlocProvider.of<BookingBloc>(context).add(
                                AddServices(_selectedServices, widget.baber));
                          },
                          textColor: kMainColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          btnRadius: 10,
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else if (state is VerficationServicesError) {
              return AlertDialog(
                title: const Text('Failed to book Services'),
                content: Text(state.errorMessage),
                actions: [
                  CustomButton(
                    btnHeight: 45.h,
                    btnColor: kGreenColor,
                    title: "OK",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: kMainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    btnRadius: 10,
                  ),
                ],
              );
            } else if (state is VerifiedSelectedServices) {
              int numberOfServices = _selectedServices.length;
              return AlertDialog(
                title: numberOfServices != 1
                    ? Text(
                        'You have succesfully selected $numberOfServices services')
                    : Text(
                        'You have succesfully selected $numberOfServices service'),
                content: Text('Your total cost is: $_totalCost'),
                actions: [
                  CustomButton(
                    btnHeight: 45.h,
                    btnColor: kGreyColor,
                    title: "Cancel",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: kMainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    btnRadius: 10,
                  ),
                  CustomButton(
                    btnHeight: 45.h,
                    btnColor: kGreenColor,
                    title: "Book",
                    onPressed: () {
                      //TODO: go to the nest page where the customer is able to make a booking.
                    },
                    textColor: kMainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    btnRadius: 10,
                  ),
                ],
              );
            }
            return const Center(child: Text('Error'));
          },
          listener: (context, state) {}),
    );
  }
}
