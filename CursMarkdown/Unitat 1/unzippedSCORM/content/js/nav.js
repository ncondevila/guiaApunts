window.onload = function() {
    menuOpen = false;
    //window.resizeTo(1024, 768);
};

function switchMenu() {
    if (menuOpen) closeNav();
    else openNav();
    menuOpen = !menuOpen;

}


/* Set the width of the sidebar to 250px (show it) */
function openNav() {
    document.getElementById("mySidepanel").style.width = "250px";
}

/* Set the width of the sidebar to 0 (hide it) */
function closeNav() {
    document.getElementById("mySidepanel").style.width = "0";
}
