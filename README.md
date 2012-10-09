# TiSocial

A Titanium Appcelerator module that implements Social framework in iOS 6+

## Usage

	var TiSocial = require("ti.social");
	
	// Facebook
	if (TiSocial.isFacebookSupported) {
		TiSocial.createFacebookDialog({
			text: "Foobar message",
			image: "Foo.jpg",
			url: "http://www.rafaelks.com"
		});
	}
	
	// Twitter
	if (TiSocial.isTwitterSupported) {
		TiSocial.createTwitterDialog({
			text: "Foobar message",
			image: "Foo.jpg",
			url: "http://www.rafaelks.com"
		});
	}
	
### Properties

* **isFacebookSupported** (BOOL)
* **isTwitterSupported** (BOOL)

### Methods

* **createFacebookDialog**: Creates the Facebook iOS dialog.
* **createTwitterDialog**: Creates the Twitter iOS dialog.

### Parameters

* **message**: Message to sharing.
* **image**: A file to share with your message.
* **url**: An URL to share with your message.
* **animated**: Animation in Dialog show/hide. Default is true.