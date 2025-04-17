import 'package:flutter/material.dart';
import 'package:logiology/app/data/model/review_model.dart';
import 'package:logiology/support/helper.dart';

class ReviewTile extends StatelessWidget {
  final List<Review> reviews;
  const ReviewTile({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          reviews
              .map(
                (review) => Container(
                  padding: EdgeInsets.all(6),
                  width: double.infinity,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${review.reviewerName} ${List.generate(review.rating, (index) => "⭐️").join()}",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 4),
                      Text(convertToMonthDayYear(dateTimeString: review.date) ?? "", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 4),
                      Text(review.comment, style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}
