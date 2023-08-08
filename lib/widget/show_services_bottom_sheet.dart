import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../model/baber.dart';

class SignUpBottomSheet extends StatefulWidget {
  final Baber baber;
  const SignUpBottomSheet({super.key, required this.baber});

  @override
  State<SignUpBottomSheet> createState() => _SignUpBottomSheetState();
}

class _SignUpBottomSheetState extends State<SignUpBottomSheet> {
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
                title: "Select Services",
                color: kBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: widget.baber.services.length,
            itemBuilder: (context, index) {
              String service = widget.baber.services.keys.elementAt(index);
              double price = widget.baber.services.values.elementAt(index);
              return Row(
                children: [
                  Checkbox(value: _checked, onChanged:(value){setState(() {
      if(value!){
        _totalCost -= price;
        _selectedServices.remove(service);
      } else{
        _totalCost += price;
        _selectedServices.addEntries({service: price}.entries);
      }
      _checked = !_checked;
    });}),
                  Text(service), Text(price.toString(),textAlign: TextAlign.end,),
                ],
              );
            },
            
          ),
        )
      ],
    );
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(_emailController.text, _passwordController.text),
      );
    }
  }