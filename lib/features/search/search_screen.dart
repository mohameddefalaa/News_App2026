import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController serchcontroller;
  @override
  void initState() {
    serchcontroller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    serchcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search",
          style: TextTheme.of(context).titleMedium!.copyWith(
            fontSize: AppSize.sp16,
            color: AppLightColor.textPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.dg16),
        child: Column(
          children: [
            TextField(
              controller: serchcontroller,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextTheme.of(context).displayMedium!.copyWith(
                  fontSize: AppSize.sp14,
                  color: AppLightColor.tertiarytext,
                ),
                fillColor: AppLightColor.backgroundColor,
                suffixIcon: Icon(Icons.search, size: AppSize.r24),

                suffixIconColor: AppLightColor.tertiarytext,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.r4),
                  borderSide: BorderSide(color: AppLightColor.border2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.r4),
                  borderSide: BorderSide(color: AppLightColor.border2),
                ),
              ),
            ),
            SizedBox(height: AppSize.h20),
            Column(
              children: List.generate(
                3,
                (index) => Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsetsGeometry.zero,
                      title: Text(
                        "City has an earthquake with 6.2 richer",
                        style: TextTheme.of(context).displayMedium!.copyWith(
                          color: AppLightColor.placeholdertext,
                        ),
                      ),
                      leading: Icon(Icons.search),
                    ),

                    Divider(
                      color: AppLightColor.border,
                      thickness: 1,
                      endIndent: .5,
                      height: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
