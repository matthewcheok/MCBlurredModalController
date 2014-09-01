MCBlurredModalController ![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)
========================

[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/MCBlurredModalController/badge.png)](https://github.com/matthewcheok/MCBlurredModalController)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/MCBlurredModalController/badge.svg)](https://github.com/matthewcheok/MCBlurredModalController)

A sleek way to display your view controller modally.

##Screenshot
![Screenshot](https://raw.github.com/matthewcheok/MCBlurredModalController/master/screenshot.gif "Example of MCBlurredModalController")

## Installation

Add the following to your [CocoaPods](http://cocoapods.org/) Podfile

    pod 'MCBlurredModalController', '~> 0.1'

or clone as a git submodule,

or just copy files in the ```MCBlurredModalController``` folder into your project.

## Using MCBlurredModalController

Simply create the modal controller:

    MCBlurredModalController *modalController = [[MCBlurredModalController alloc] initWithRootViewController:controller];
    modalController.style = MCBlurredStyleLight;
    [modalController presentInViewController:self];

You can configure the `style` with `MCBlurredStyleDark`, `MCBlurredStyleLight` or `MCBlurredStyleExtraLight`.

Dismiss using the `-dismiss` method on the modal controller:

    [self.blurredModalController dismiss];

On the presented controller, `blurredModalController` is available as a reference to the modal controller.

## License

Realm+JSON is under the MIT license.
