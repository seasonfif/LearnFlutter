import 'package:meta/meta.dart';

/**
 * State中所有属性都应该是只读的
 */
@immutable
class CountState{

  int _count;

  int get count => _count;

  CountState(this._count);

  CountState.initState(){
    _count = 0;
  }
} 

/**
 * 定义操作该State的全部Action
 * 这里只有增加count一个动作
 */
enum CountAction{

  increment

}

/**
 * reducer会根据传进来的action生成新的CountState
 */
CountState reducer(CountState state, action){
  if(action == CountAction.increment){
    return CountState(state._count + 1);
  }
  return state;
}