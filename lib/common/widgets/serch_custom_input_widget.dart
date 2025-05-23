import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SerchCustomInputWidget extends StatelessWidget {
  final ValueChanged<String>? onSearchChanged;
  const SerchCustomInputWidget({super.key, this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r)),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar',
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onChanged: onSearchChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
