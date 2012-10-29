# TiSocial

A Titanium Appcelerator module that implements Social framework in iOS 6+

## Usage

This module is only supported to iOS 6+. If you are using 5.0 as min iOS version, you can use the [TiTwitter](http://github.com/Nyvra/TiTwitter) module to integrate with Twitter. Facebook integration will only works with iOS 6+.

For this reason, it's important that before you make the request to create the Social Network dialog, you verify if it's supported.

### Require module

	var TiSocial = require("ti.social");
	
### Facebook
	
	if (TiSocial.isFacebookSupported) {
		TiSocial.createFacebookDialog({
			text: "Foobar message",
			image: "Foo.jpg",
			url: "http://www.rafaelks.com"
		});
	}
	
### Twitter

	if (TiSocial.isTwitterSupported) {
		TiSocial.createTwitterDialog({
			text: "Foobar message",
			image: "Foo.jpg",
			url: "http://www.rafaelks.com"
		});
	}
	
### SinaWeibo

	if (TiSocial.isSinaWeiboSupported) {
		TiSocial.createSinaWeiboDialog({
			text: "Foobar message",
			image: "Foo.jpg",
			url: "http://www.rafaelks.com"
		});
	}
	
### Events

	TiSocial.addEventListener("success", function(e) {
		if (e.service === "twitter") {
			Ti.API.info("Twitter sharing successful");
		}
	});
	
	TiSocial.addEventListener("cancelled", function(e) {
		if (e.service === "twitter") {
			Ti.API.info("Twitter sharing cancelled");
		}
	});
	
## Parameters

* **message**: Message to sharing.
* **image**: A file to share with your message.
* **url**: An URL to share with your message.
* **animated**: Animation in Dialog show/hide. Default is true.

## Properties

* **isFacebookSupported** (BOOL)
* **isTwitterSupported** (BOOL)
* **isSinaWeiboSupported** (BOOL)

## Methods

* **createFacebookDialog**: Creates the Facebook iOS dialog.
* **createTwitterDialog**: Creates the Twitter iOS dialog.
* **createSinaWeiboDialog**: Creates the SinaWeibo iOS dialog.

## Events

* **success**: Fired when sharing was successful
	* **success**: (true / false)
	* **service**: (twitter / facebook / sinaweibo)
* **cancelled**: Fired when user cancel sharing
	* **success**: (true / false)
  	* **service**: (twitter / facebook / sinaweibo)

## Issues

* Make compatibility with Twitter framework (from iOS 5) without use [TiTwitter](http://www.github.com/Nyvra/TiTwitter) module
* Create method to request Facebook account informations
* Create method to request Twitter account informations
