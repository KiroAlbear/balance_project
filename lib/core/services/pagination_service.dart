class PaginationService {
  (bool, List<T>) getPaginationData<T>(
      List<T> data,
      List<T>? currentData,
      bool isLoadingMore,
      int pageSize,
      ) {
    bool isEndOfList = false;
    if (isLoadingMore && currentData != null) {
      currentData.addAll(data);
    } else {
      currentData = data;
    }
    isEndOfList = data.length < pageSize;
    return (isEndOfList, currentData);
  }
}
