String fixUrl(String url) {
  const http = 'https:';
  if (url.startsWith('//')) {
    url = http + url;
  }
  url = url.replaceAll('t_thumb', 't_cover_big');
  return url;
}
