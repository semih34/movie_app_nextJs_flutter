import React from 'react'
import {notFound} from "next/navigation";
import MovieContainer from '@/containers/movie'
import { getMovie } from '@/services/movie';

const MoviePage = async ({params,searchParams}) => {
    const movie = await getMovie(params.id);
    if(!movie){
        notFound();
    }
    if(searchParams.error === "true"){
      throw new Error("Error happened");
    }
  return <MovieContainer  movie={movie}/>
}

export default MoviePage