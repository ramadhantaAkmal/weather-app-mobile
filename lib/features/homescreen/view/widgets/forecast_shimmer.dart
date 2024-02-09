import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ForecastShimmer extends StatelessWidget {
  const ForecastShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Shimmer.fromColors(
                            baseColor: const Color(0XFF87888A),
                            highlightColor: const Color(0XFFB9C0C5),
                            child: Container(
                              color: Colors.grey,
                            ),
                          )),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 30,
                          width: 250,
                          child: Shimmer.fromColors(
                            baseColor: const Color(0XFF87888A),
                            highlightColor: const Color(0XFFB9C0C5),
                            child: Container(
                              color: Colors.grey,
                            ),
                          )),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 30,
                          width: 50,
                          child: Shimmer.fromColors(
                            baseColor: const Color(0XFF87888A),
                            highlightColor: const Color(0XFFB9C0C5),
                            child: Container(
                              color: Colors.grey,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            );
          }),
    ));
  }
}
