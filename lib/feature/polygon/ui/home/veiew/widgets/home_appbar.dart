import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:polygontrade/feature/polygon/ui/home/bloc/grouped_daily_bloc.dart';

import '../../../../../../common/theme/colors.dart';

class SearchCryptoWidget extends StatefulWidget implements PreferredSizeWidget {
  const SearchCryptoWidget({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(90);
  @override
  State<SearchCryptoWidget> createState() => _SearchCryptoWidgetState();
}

class _SearchCryptoWidgetState extends State<SearchCryptoWidget> {
  late TextEditingController _searchController;
  bool _isSearching = false;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _cancelSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      DateTime today = DateTime.now();
      DateTime yesterday = today.subtract(const Duration(days: 2));
      String formattedDate = DateFormat('yyyy-MM-dd').format(yesterday);

      BlocProvider.of<GroupedDailyBloc>(context)
          .add(GetGroupedDailyEvent(formattedDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: AppColors.white,
        title: _isSearching
            ? Container(
                padding: const EdgeInsets.only(top: 19),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(8)),
                //   border: Border.all(
                //     width: 2,
                //     color: AppColors.colorLigthGrey,
                //   ),
                // ),
                child: TextField(
                  controller: _searchController,
                  maxLength: 20,
                  maxLines: 1,
                  readOnly: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _isSearching
                        ? IconButton(
                            icon: SvgPicture.asset(
                              'assets/icon/clear.svg',
                              // color: AppColors.colorLigthGrey,
                            ),
                            onPressed: _cancelSearch,
                          )
                        : IconButton(
                            icon: SvgPicture.asset(
                              'assets/icon/search_appbar.svg',
                              // color: AppColors.colorLigthGrey,
                            ),
                            onPressed: _cancelSearch,
                          ),
                    hintText: 'Тикер / Название',
                    hintStyle: const TextStyle(color: AppColors.colorLigthGrey),
                    // border: InputBorder.none,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          width: 2, color: Color.fromRGBO(146, 166, 185, 1)),
                    ),
                  ),
                  style: const TextStyle(color: AppColors.textDark),
                  onChanged: (value) {
                    final inputString = value;
                    Timer? searchTimer;

                    // Cancel the previous timer if it exists
                    searchTimer?.cancel();

                    // Start a new timer with a 2-second delay
                    searchTimer = Timer(const Duration(seconds: 2), () {
                      BlocProvider.of<GroupedDailyBloc>(context)
                          .add(ValueToSearchTicketEvent(inputString));
                    });
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  'Криптовалюта',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
        actions: [
          if (_isSearching)
            TextButton(
                onPressed: _cancelSearch,
                child: Text(
                  'Отмена',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColors.primary),
                ))
          else
            IconButton(
              icon: SvgPicture.asset('assets/icon/search.svg'),
              onPressed: _startSearch,
            ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
