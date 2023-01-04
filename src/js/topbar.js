//漢堡線控制
let menuIcon = document.getElementById('menu-icon-box');
let menu = document.getElementById('topbar-btn-group');

menuIcon.addEventListener('click', function () {
    document.getElementById('topbar-btn-group').classList.toggle('on');
});



//錨點

const navLinkList = document.querySelectorAll(".anchor-box li a.scrollDetectorJS"),
    header = document.querySelector("div.top-area"),
    navigationTable = {};
navLinkList.forEach(link => {
    const sid = link.dataset.scroll,
        section = document.getElementById(sid),
        top = section.offsetTop,
        bottom = section.offsetHeight + top;
    console.log(section, top, bottom);
})

// const a_news = document.querySelector('.a-news');
// const a_events = document.querySelector('.a-events');
// const a_aboutus = document.querySelector('.a-aboutus');
// const a_shops = document.querySelector('.a-shops');

// a_news.addEventListener("click", function () {
//     const element = document.getElementById('anchor1');
//     element.scrollIntoView(true);
//     element.scrollIntoView({ behavior: 'smooth' });
// });

// // a_events.addEventListener("click", function(){
// //     document.querySelector('#anchor2').scrollIntoView(true);
// // })

// a_aboutus.addEventListener("click", function () {
//     document.querySelector('#anchor3').scrollIntoView(true);
//     console.log('t');
//     function test() {
//         window.scrollBy(0, -100);
//     }
//     test();
//     console.log('tt');
// })


// a_shops.addEventListener("click", function () {
//     document.querySelector('#anchor4').scrollIntoView(true);
//     window.scrollBy(0, -100);

// })


// console.log("[navDomList]" , navDomList);
// const navTable ={};
// for (const a of navDomList){
//     console.log(a.dataset);
//     console.log(a.id);
// }

//Back To Top
const backToTop = document.getElementById('backToTop');
backToTop.addEventListener('click', function () {
    window.scrollTo({ top: 0, behavior: "smooth" });
})