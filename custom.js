console.log("I'm in");

(function(d, script) {
    script = d.createElement('script');
    script.type = 'text/javascript';
    script.async = true;
    script.onload = function() {
        // remote script has loaded
    };
    script.src =
        'http://127.0.0.1:35729/livereload.js';
    d.getElementsByTagName('head')[0].appendChild(script);
}(document));

console.log("Infected");
