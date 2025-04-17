import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/app/modules/home/controller/home_controller.dart';
import 'package:logiology/theme/app_theme.dart';
import 'package:logiology/theme/widgets/input_text.dart';

void openFilterDialog(BuildContext context) {
  final HomeController controller = Get.find();
  final minPriceController = TextEditingController(text: controller.activeMinPrice?.toString() ?? '');
  final maxPriceController = TextEditingController(text: controller.activeMaxPrice?.toString() ?? '');

  final selectedCategory = (controller.activeCategory ?? '').obs;
  final selectedTags = controller.activeTags.toList().obs;

  Get.defaultDialog(
    backgroundColor:appColor(context).whiteColor,
    title: "Filter Products",
    titleStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    contentPadding: EdgeInsets.all(16),
    titlePadding: EdgeInsets.only(top: 24),
    content: SingleChildScrollView(
      child: Column(
        children: [
          InputText(
            labelText: "Min Price",
            controller: minPriceController,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
            textStyle: TextStyle(color: appColor(context).background),
            labelStyle: TextStyle(color: appColor(context).background),
          ),
          InputText(
            labelText: "Max Price",
            controller: maxPriceController,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
            textStyle: TextStyle(color: appColor(context).background),
            labelStyle: TextStyle(color: appColor(context).background),
          ),
          SizedBox(height: 10),
          Obx(
            () => DropdownButton<String>(
              hint: Text("Select Category"),
              value: selectedCategory.value == '' ? null : selectedCategory.value,
              onChanged: (value) => selectedCategory.value = value ?? '',
              items:
                  controller.categories.map((cat) {
                    return DropdownMenuItem(value: cat, child: Text(cat));
                  }).toList(),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 6,
              children:
                  controller.tags.map((tag) {
                    return Obx(
                      () => FilterChip(
                        backgroundColor: appColor(context).primary,
                        label: Text(tag),
                        selected: selectedTags.contains(tag),
                        onSelected: (selected) {
                          if (selected) {
                            selectedTags.add(tag);
                          } else {
                            selectedTags.remove(tag);
                          }
                        },
                      ),
                    );
                  }).toList(),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  controller.resetFilters();
                  Get.back();
                },
                child: Text("Reset", style: TextStyle(color: appColor(context).errorText, fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              TextButton(
                onPressed: () {
                  double minPrice = double.tryParse(minPriceController.text) ?? 0;
                  double maxPrice = double.tryParse(maxPriceController.text) ?? double.infinity;
                  controller.applyAdvancedFilter(
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                    category: selectedCategory.value,
                    selectedTags: selectedTags,
                  );
                  Get.back();
                },
                child: Text("Apply", style: TextStyle(color: appColor(context).buttonColor, fontWeight: FontWeight.w600, fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
