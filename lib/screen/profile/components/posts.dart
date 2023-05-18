import 'package:flutter/material.dart';
import 'package:travel/screen/profile/controller/profile_cubit.dart';
import '../../../components/style/size.dart';
class PostsImage extends StatelessWidget {
  final ProfileCubit cubit;

  const PostsImage({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GridView.builder(
          physics:const BouncingScrollPhysics(),
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 3,
         mainAxisSpacing: 3,
         crossAxisSpacing: 3,
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

