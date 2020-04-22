function pageRedirect(page)
{
    timer = setTimeout(window.location.replace(`http://127.0.0.1:9393/${page}`), 10000);
    clearTimeout(timer);
}