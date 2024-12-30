import 'package:balance_project/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'test_feature_state.g.dart';

@CopyWith()
class TestFeatureState extends ParentState {
  int? number = 0;
  TestFeatureState({this.number});
}

@CopyWith()
class TestFeatureAnotherState extends ParentState {
  int? number = 0;

  TestFeatureAnotherState({this.number});
}
