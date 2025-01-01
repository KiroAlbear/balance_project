import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../imports.dart';

class ParentBloc<B extends StateStreamable<S>, S> extends StatelessWidget {
  final Widget? Function(S) builder;
  final bool Function(S, S)? buildWhen;
  final bool Function(S, S)? listenWhen;
  final Function(BuildContext context, S state)? listenerFunction;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;

  ParentBloc({
    Key? key,
    required this.builder,
    this.listenerFunction,
    this.buildWhen,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.listenWhen,
  }) : super(key: key);

  Widget _buildMainWidget(BuildContext context, S state) {
    if ((state as ParentState).status == Status.initial) {
      return loadingWidget ??
          Container(
              child: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: StaticColors.themeColor, size: 50)));
    } else if (((state as ParentState).status == Status.loading)) {
      return loadingWidget ??
          Container(
              child: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: StaticColors.themeColor, size: 50)));
    } else if ((state as ParentState).status == Status.empty) {
      return emptyWidget ?? NoDataErrorWidget();
    } else if ((state as ParentState).status == Status.error) {
      return errorWidget ?? ServerErrorWidget();
    } else if ((state as ParentState).status != null) {
      return builder(state) ?? SizedBox();
      // return SizedBox()
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listenWhen: (S previous, S current) {
        if (listenWhen == null) {
          return previous != current;
        } else {
          return listenWhen!(previous, current);
        }
      },
      buildWhen: (S previous, S current) {
        if (buildWhen == null) {
          return previous != current;
        } else {
          return buildWhen!(previous, current);
        }
      },
      listener: (BuildContext context, S state) {
        if (listenerFunction != null) listenerFunction!(context, state);
      },
      builder: (BuildContext context, S state) {
        return _buildMainWidget(context, state);
      },
    );
  }
}
