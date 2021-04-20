if (document.getElementsByClassName("scroll-sidebar").length > 0 && document.getElementsByClassName("amend-box").length > 0) {
    document.getElementsByClassName("scroll-sidebar")[0].onscroll = function () {
        if (this.scrollTop > 20) {
            document.getElementsByClassName("amend-box")[0].classList.add('shadow');
            document.getElementsByClassName("amend-box")[0].style.margin = '0';
        } else {
            document.getElementsByClassName("amend-box")[0].classList.remove('shadow');
            document.getElementsByClassName("amend-box")[0].style.margin = '12px';
        }
    }
}