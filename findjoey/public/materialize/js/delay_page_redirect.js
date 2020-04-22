function doNothing() {;
}

function pageRedirect() {
    setTimeout(doNothing, 30000)
    window.location.href = "http://127.0.0.1:9393/login"
}