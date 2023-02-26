# movies_app_clean_arch_setstate 💙💙
  - Using **setState** Mangement .
  - Using **http** package .
  - Using **Clean Architecture** .

# Map from *list of data* to *dart model* 
 - Using *List<DartModel>.from((data as List).map((e)=> DartModel.fromJson(e),))*
   ```dart
   List<MovieModel> succcessData = List<MovieModel>.from(
     (response.data["results"] as List).map(
       (e) => MovieModel.fromJson(e),
     ),
   );
   return succcessData;
   ```
<p align="center"> OR </p>

- Using *(data as List).map((e)=>DartModel.fromJson(e)).toList*

   ```dart
    List<MovieModel> succcessData = (response.data['results'] as List)
        .map(
          (e) => MovieModel.fromJson(e),
        )
        .toList();
    return succcessData;
   ```
