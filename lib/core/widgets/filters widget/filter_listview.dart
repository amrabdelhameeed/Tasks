import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/filter_model.dart';
import '../../utils/size_config.dart';
import '../../../view_model/tasks_cubit/tasks_cubit.dart';
import '../../../view_model/tasks_cubit/tasks_state.dart';
import 'filter_list_item.dart';

class FilterListView extends StatelessWidget {
  const FilterListView({
    Key? key,
    required this.filters,
  }) : super(key: key);
  final List<FilterModel> filters;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        var cubit = TasksCubit.get(context);
        return SizedBox(
          height: SizeConfig.screenHeight! * 0.06,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                width: SizeConfig.screenWidth! * 0.03,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  cubit.selectFilter(filters[index], filters);
                },
                child: FilterListItem(filter: filters[index]),
              );
            },
          ),
        );
      },
    );
  }
}
