
void main(){

  print("index:");

  List list = [1,2,3,4];
  List list1 = List.of([1,2,3,4]);
  list1.map((it){
    return print("index:$it");
  });
}