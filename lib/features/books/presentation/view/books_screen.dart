import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:bookapp/core/resources/app_assets.dart';
import 'package:bookapp/core/resources/app_colors.dart';
import 'package:bookapp/core/view/components/empty_component.dart';
import 'package:bookapp/core/view/components/error_component.dart';
import 'package:bookapp/core/view/widgets/custom_text_field.dart';
import 'package:bookapp/core/view/widgets/loading_spinner.dart';
import 'package:bookapp/features/books/presentation/cubit/book_cubit.dart';
import 'package:bookapp/features/books/presentation/widget/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final cubit = context.read<BookCubit>();
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8 && !cubit.isLoading && cubit.state is BookLoaded && !(cubit.state as BookLoaded).hasReachedEnd) {
        cubit.fetchBooks();
      }
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<BookCubit>().fetchBooks(isRefresh: true),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              8.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello,',style: Theme.of(context).textTheme.headlineMedium?.bold.copyWith(color: AppColors.primary),),
                      Text('what do you want to read today?',style: Theme.of(context).textTheme.bodyMedium?.medium.copyWith(color: AppColors.darkGrey),),
                    ],
                  ),
                  SizedBox(width: 36.w,child: Image.asset(AppImages.imgLogo,fit: BoxFit.fill,))
                ],
              ).paddingSymmetric(horizontal: 12.w),
              12.heightBox,
              CustomTextField(
                hintText: 'Search',
                prefixIcon: Icon(Icons.manage_search_outlined),
                borderColor: AppColors.primary,
                borderRadius: 24.r,
                onChange: (x) => context.read<BookCubit>().fetchBooks(isRefresh: true,searchWord: x),
                textInputAction: TextInputAction.search,
              ).paddingSymmetric(horizontal: 8.w),
              12.heightBox,

              Expanded(
                child: BlocBuilder<BookCubit, BookState>(
                  builder: (context, state) {
                    if (state is BookInitial) {
                      context.read<BookCubit>().fetchBooks();
                      return const LoadingSpinner(); 
                    }
                
                    if (state is BookLoading) {
                      return const LoadingSpinner();
                    }
                
                    if (state is BookError) {
                      return ErrorComponent(message: 'Some thing went wrong, please try again', onRetry: () => context.read<BookCubit>().fetchBooks());
                    }
                
                    if (state is BookLoaded) {
                      final books = state.books;
                      final hasReachedEnd = state.hasReachedEnd;
      
                      return books.isEmpty == true 
                      ? EmptyComponent()
                      : GridView.builder(
                        controller: _scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10,  childAspectRatio: 0.6),
                        itemCount: hasReachedEnd ? books.length : books.length + 1, 
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index >= books.length) return const Padding(padding: EdgeInsets.symmetric(vertical: 24), child: LoadingSpinner());
                          return BookItem(book: books[index]);
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}