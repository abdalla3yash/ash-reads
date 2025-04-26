import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bookapp/core/navigation/navigation.dart';
import 'package:bookapp/core/resources/app_assets.dart';
import 'package:bookapp/core/resources/app_colors.dart';
import 'package:bookapp/core/view/widgets/custom_button.dart';
import 'package:bookapp/features/books/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookEntity book;
  const BookDetailsScreen({super.key,required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 300.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: FadeInImage.assetNetwork(
                    placeholder: AppImages.imgPlaceHolder,
                    image: book.formats.imageJpeg.toString(),
                    fit: BoxFit.contain,
                    imageErrorBuilder: (context, error, stackTrace) => Image.asset(AppImages.imgLogo, fit: BoxFit.contain),
                  ),
                ),
              ).toCenter(),

              8.heightBox,
              Text(book.title,maxLines: 2,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.headlineMedium?.bold).toCenter(),
              
              4.heightBox,
              Text(book.authors.isNotEmpty == true ? book.authors.first.name : "UnKnown Author",maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textColor)).toCenter(),


              if (book.bookshelves.isNotEmpty)...[
                12.heightBox,
                Text('Shelves',style: Theme.of(context).textTheme.titleLarge?.bold),
                4.heightBox,
                Text(book.bookshelves.join("\n"),style: Theme.of(context).textTheme.bodyMedium),
              ],

              if (book.summaries.isNotEmpty)...[
                12.heightBox,
                Text('Summary',style: Theme.of(context).textTheme.titleLarge?.bold),
                4.heightBox,
                Text(book.summaries.first,style: Theme.of(context).textTheme.bodyMedium),
              ],
              
              if (book.subjects.isNotEmpty)...[
                12.heightBox,
                Text('Subjects',style: Theme.of(context).textTheme.titleLarge?.bold),
                4.heightBox,
                Text(book.subjects.join('\n').replaceAll('-', ''),style: Theme.of(context).textTheme.bodyMedium),
              ],

              if (book.languages.isNotEmpty)...[
                12.heightBox,
                Text('Languages',style: Theme.of(context).textTheme.titleLarge?.bold),
                4.heightBox,
                Text(book.languages.join('\n').replaceAll('-', ''),style: Theme.of(context).textTheme.bodyMedium),
              ],
          
              114.heightBox,
            ],
          ),
        ) 
      ).paddingSymmetric(horizontal: 12.w),
      bottomSheet: Container(
        width: double.maxFinite,
        height: 52.h,
        color: AppColors.white,
        child: CustomButton(
          color: AppColors.primary,
          onPressed: ()=> NavigationService.push(Routes.webviewScreen,arguments: {"title":book.title,"url":book.formats.textHtml}),
          text: 'View',
          textColor: AppColors.white,
          fontSize: 20.sp,
        ).paddingSymmetric(horizontal: 12.w,vertical: 4.h),
      ),
    );
  }
}