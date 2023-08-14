import React from 'react';
import HomeContainer from '@/containers/home';
import { getSingelCategory,getGenres,getPopularMovies,getTopRatedMovies } from '@/services/movie';



export default async function  Home ({params}) {
    let selectedCategoryMovies;
  if(params.category?.length>0){
    const  {results} = await getSingelCategory(params.category[0]);
    selectedCategoryMovies = results;
  }

  const [{genres:categories},{results :popularMovies},{results:topRatedMovies}] = await Promise.all([getGenres(),getPopularMovies(),getTopRatedMovies()]);
  return <HomeContainer 
    popularMovies={popularMovies}
    topRatedMovies={topRatedMovies}
    categories={categories}
    selectedCategory={{
      id: params.category?.[0] ?? "",
      movies: selectedCategoryMovies ?? [],
    }}
  />;
}
