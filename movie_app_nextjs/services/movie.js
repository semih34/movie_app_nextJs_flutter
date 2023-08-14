const API_URL = 'https://api.themoviedb.org/3/';

const getMovieRequest = async (pathname, query = '') => {
  try {
    const options = {
      method: 'GET',
      headers: {
        accept: 'application/json',
        Authorization: process.env.API_KEY,
      },
    };
    const result = await fetch(`${API_URL}${pathname}${query}`, options);
    return result.json();
  } catch (error) {
    return new Error(error);
  }
};
const getTopRatedMovies = async () => {
  return getMovieRequest('movie/top_rated', '?language=en-US&page=1');
};

const getPopularMovies = async () => {
  return getMovieRequest('movie/popular', '?language=en-US&page=1');
};

const getGenres = async () => {
  return getMovieRequest('genre/movie/list', '?language=en-US');
};

const getSingelCategory = async (genreId) => {
  return getMovieRequest(
    'discover/movie',
    `?language=en-US&with_genres=${genreId}`
  );
};

const getMovie = async (movieId) => {
  return getMovieRequest(`/movie/${movieId}`);
};

export {
  getTopRatedMovies,
  getPopularMovies,
  getGenres,
  getSingelCategory,
  getMovie,
};
