import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/repair/presentation/screens/repair_order_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/global/widgets/navigate_to.dart';

class RepairSubServiceScreen extends StatelessWidget {
  const RepairSubServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    12,
                        (index) => buildGridProduct(
                          context: context,
                        image:
                        'https://th.bing.com/th/id/R.30194e24f83e6de17913aab6c91e64f6?rik=8eucKitbF9ZfTA&pid=ImgRaw&r=0'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildGridProduct({
  required String image,
  required context,
}) =>
    Container(
      //color: Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    //color: Colors.white,
                    height: 80,
                    child: Image(
                      image: NetworkImage(image),
                      width: double.infinity,
                    ),
                  ),
                  /*Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'DISCOUNT',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )*/
                ],
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    navigateTo(context: context, destination: RepairOrderScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      //color: Colors.white.withOpacity(.5),
                      height: 100,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'Ahmed',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColorConstant.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              height: 1,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                '99',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '199',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          /*IconButton(
              onPressed: () {
                //cubit.postFavorites(productId: model.id);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 26,
              )),*/
        ],
      ),
    );

/*Widget BuildCaroural(String image, int index) => Container(
  margin: const EdgeInsets.all(10),
  child: Image(
    image: NetworkImage(image),
    fit: BoxFit.cover,
  ),
);*/
