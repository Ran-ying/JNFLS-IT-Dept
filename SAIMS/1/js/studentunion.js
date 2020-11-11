function start() {
    setTimeout(function () { $('#top').fadeIn('slow') }, 100);
    setTimeout(function () { $("#top_hr").animate({ width: "70%" }) }, 200);
    setTimeout(function () { $('#main').fadeIn('slow') } , 300);
    setTimeout(function () { $('#down').fadeIn('slow') }, 1000);
}