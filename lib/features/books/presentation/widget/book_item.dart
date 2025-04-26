import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:bookapp/core/navigation/navigation.dart';
import 'package:bookapp/core/resources/resources.dart';
import 'package:bookapp/core/view/components/tap_effect.dart';
import 'package:bookapp/features/books/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  final BookEntity entity;
  const BookItem({super.key,required this.entity});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: ()=> NavigationService.push(Routes.webviewScreen,arguments: {"title":entity.title,"url":entity.formats.textHtml}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: FadeInImage.assetNetwork(
                      placeholder: AppImages.imgPlaceHolder,
                      image: entity.formats.imageJpeg.toString(),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                        AppImages.imgLogo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(bottom: 4,right: 4,child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),color: AppColors.primary),
                  child: Row(
                    children: [
                      Text(entity.downloadCount.toString(),style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w700,fontSize: 16.sp),),
                      2.widthBox,
                      Icon(Icons.download,color: AppColors.white,),
                    ],
                  ),
                )),
              ],
            ),
          ),
          4.heightBox,
          Text(entity.title,maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyLarge?.bold),
          Text(entity.authors.isNotEmpty == true ? entity.authors.first.name : "UnKnown Author",maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium),
          Text(entity.subjects.join(),maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodySmall),
        
        ],
      ),
    );
  }
}