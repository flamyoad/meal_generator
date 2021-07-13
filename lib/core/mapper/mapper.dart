abstract class Mapper<I, O> {
  I from(O? output);

  O to(I? input);

  List<I> fromList(List<O> list) {
    return list
        .where((output) => output != null)
        .map((output) => from(output)).toList();
  }

  List<O> toList(List<I> list) {
    return list
        .where((input) => input != null)
        .map((input) => to(input)).toList();
  }
}
