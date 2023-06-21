import 'package:flutter/material.dart';
import 'package:travel/screen/another_profile/controller/another_rprofile_cubit.dart';

class PostsImage extends StatelessWidget {
  final AnotherProfileCubit cubit;

  const PostsImage({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GridView.builder(
          physics:const BouncingScrollPhysics(),
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         mainAxisSpacing: 5,
         crossAxisSpacing: 5,
         childAspectRatio: .85
      ),
      itemBuilder: (context, index){
       return Image.asset(cubit.postsImage[index], fit: BoxFit.fill,);
      },
      itemCount: cubit.postsImage.length
    );
  }
}







//4

