var TiSocial = require("ti.social");
Ti.API.info("module is => " + TiSocial);

var winExample = Ti.UI.createWindow({
	backgroundColor: "#FFFFFF"
});

var buttonFacebookExample = Ti.UI.createButton({
	title: "createFacebookDialog();",
	top: 10,
	left: 10,
	right: 10,
	height: 50
});
winExample.add(buttonFacebookExample);

var buttonTwitterExample = Ti.UI.createButton({
	title: "createTwitterDialog();",
	top: 70,
	left: 10,
	right: 10,
	height: 50
});
winExample.add(buttonTwitterExample);

var imageViewExample = Ti.UI.createImageView({
	image: "Homer.jpg",
	left: 10,
	right: 10,
	bottom: 10	
});
winExample.add(imageViewExample);

winExample.open();

buttonFacebookExample.addEventListener("click", function() {
	if (TiSocial.isFacebookSupported) {
		TiSocial.createFacebookDialog({
			text: "Foobar message",
			image: "Homer.jpg"
		});
	}
});

buttonTwitterExample.addEventListener("click", function() {
	if (TiSocial.isTwitterSupported) {
		TiSocial.createTwitterDialog({
			text: "Foobar message",
			image: "Homer.jpg"
		});
	}
});