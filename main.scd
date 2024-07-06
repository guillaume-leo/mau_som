
// banners: https://manytools.org/hacker-tools/ascii-banner/
// Font: AINSI SHADOW

(
/*
 ██████╗ ██╗      ██████╗ ██████╗  █████╗ ██╗
██╔════╝ ██║     ██╔═══██╗██╔══██╗██╔══██╗██║
██║  ███╗██║     ██║   ██║██████╔╝███████║██║
██║   ██║██║     ██║   ██║██╔══██╗██╔══██║██║
╚██████╔╝███████╗╚██████╔╝██████╔╝██║  ██║███████╗
 ╚═════╝ ╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
*/
~ui = nil;
)

(
/*
██╗   ██╗██╗
██║   ██║██║
██║   ██║██║
██║   ██║██║
╚██████╔╝██║
 ╚═════╝ ╚═╝
*/

var currentPath = thisProcess.nowExecutingPath.dirname;
var webAppPath = currentPath ++ "/dist/index.html" ;

var browser, reloadStop;

~ui = WebView()
    .minSize_(300@200);
reloadStop = Button()
    .states_([["R"], [""]])
    .fixedSize_(36@28);

reloadStop.action = {
    |v|
    if (v.value == 1) {
        ~ui.reload(true);
    } {
        ~ui.stop;
    }
};

~ui.onLoadStarted = {
    reloadStop.value = 1;
};

~ui.onLoadFinished = {
    reloadStop.value = 0;
};

~ui.onLoadFailed = {
    reloadStop.value = 0;
};

browser = View(bounds:900@700).layout_(VLayout(
    HLayout(
        reloadStop,
    ),
    ~ui
));

browser.front;

~ui.url = webAppPath;

/*
FROM UI MESSAGES
*/

~ui.onJavaScriptMsg = { |view, msg|
	msg.postln;
};

)
~ui.runJavaScript("window.test()")


