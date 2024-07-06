
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

var browser;

~ui = WebView()
    .minSize_(300@200);

browser = View(bounds:900@700).layout_(VLayout(
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


