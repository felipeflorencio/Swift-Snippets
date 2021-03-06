<div align="center">

# Swift-Snippets <a href="https://github.com/felipeflorencio"><img src="https://github.com/felipeflorencio/Swift-Snippets/blob/master/icons/awesome-badge-template.png?raw=true" height="20px" width="120px"></a>

<img src="https://github.com/felipeflorencio/Swift-Snippets/blob/master/icons/swift-cube.png?raw=true" height="250px" width="250px">

##### A collection of functions / helpers for easy get not daily code use , like core data manager, scroll view, keyboard dismiss, and a lot more codes that we from time to time need to use.

[![Swift 4](https://img.shields.io/badge/Swift-4-green.svg?style=flat)](https://swift.org)
[![Platforms iOS | watchOS | tvOS | macOS](https://img.shields.io/badge/Platforms-iOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20macOS-green.svg?style=flat)](http://www.apple.com)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic)]()



### All of these scripts is suppose to work on all apple environment

</div>

## Code Snippets

<details>
<summary>Core Data</summary>

Collection of core data most used code that you will need

Link to the folder: [link](CoreData)

- `Initialize core data/*`: snippet for you initialize you core date environment;
- `Receive update about core data update/*`: snippet for you receive any core data update, for new itens added, updated and deleted;

Tip:
Realm provide a good cheatsheet how to use NSPredicate, as is something that you need to use on CoreData, check here: https://academy.realm.io/posts/nspredicate-cheatsheet/  

</details>

<details>
<summary>Foundation</summary>

Collection of helpers functions for Foundation API's and the way to use in your project.

Can be just a class or a extension, variable, function, you can chose what is the best for your implementation / need.

Link to the folder: [link](Foundation)

- `Date formatter*`: snippet for you set the formatter that you want for you date string, has a default value or even you can set your own;
- `Computed variable inside extension using associated object*`: snippet for you be able to add computed variables inside extension using associate object;
- `Delay operation*`: snippet for you to easy delay operations using the block syntax or even implement using the protocol implementation;
- `Array extension, secure get item*`: snippet for secure retrieve a item from array already validating if item is there and if so return, otherwise return nil;
- `Array extension, remove duplicated itens`: snippet that allow you to simple unify your array removing the duplicated itens;
- `Array extension, return unique itens`: snippet that allow you to simple have unique itens inside an array;
- `Dictionary extension, get value if exist passing type*`: snippet for get the value of a dictionary if exist the same time that validate if is the type that you pass, if not exist or not the type throw an error;
- `Create a full copy of any object that inherit from NSObject*`: snippet that make easy clone any object, this will create a totally new object with new address in memory;

</details>

<details>
<summary>UI</summary>

Collection of UI most used code that you will need.

All the files / class has some kind of comment and help according to the need and if need.

<details>
<summary>Helpers</summary>

Collection of helpers functions for things related to view in general and the way to use in your project.

Can be just a class or a extension, variable, function, you can chose what is the best for your implementation / need.

Link to the folder: [link](UI/Helpers)

- `Load view controller programmatically at start*`: snippet for you set programmatically which will be the root view controller when loading your app;
- `Load NIB according to the view controller file*`: snippet for you load your nibs just using the view controller name and access a function that will return the nib, without need to set the bundle or path;
- `Universal tap function using closure for callback*`: snippet for you add to any UIKit object the tap functionality, working with closure, that will add the tap gesture to the object and callback your closure, and from there you can add any action that you want for example dismiss;
- `Load from anywhere the view controller that is being presented*`: Added helper method to get top view controller that is presented

<details>
<summary>UIColor</summary>

Collection of helpers functions for UIColor and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

Link to the folder: [link](UI/UIColor)

- `Get the UIColor from HEX string*`: snippet for you get the UIColor according to the HEX string;
- `Get the HEX from UIColor`: snippet for you get a string with the HEX representation from UIColor;

</details>

</details>

<details>
<summary>UIView</summary>

Collection of helpers functions for UIView and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

Link to the folder: [link](UI/UIView)

- `Add border to your view*`: snippet for you add border to your view type;
- `Add border color to your view*`: snippet for you add border color to your view type;
- `Add corner radius to your view*`: snippet for you add corner radius to your view type;
- `Add border to specific side to your view*`: snippet for you add border to specific side or all side on your view type object;
- `Add shake effect to your view*`: snippet for you add the shake effect to any view that inherit from UIView;
- `Add corner radius to specific border*`: snippet for you add corner radius only to specific border that you want;
- `Add loader to any UIView using extension*`: snippet for you add a loader to any UIView in the center;
- `Add a method to convert rect between two views*`: snippet for you be able to convert one CGRect between one view and another one;
</details>

<details>
<summary>UIImage</summary>

Collection of helpers functions for UIImage and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

Link to the folder: [link](UI/UIImage)

- `Tint color to your UIImage*`: snippet for you tint you image;

</details>

<details>
<summary>UIButton</summary>

Collection of helpers functions for UIButton and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

Link to the folder: [link](UI/UIButton)

- `Add image and text horizontal aligned to your UIButton*`: snippet for you add a image and text and align both horizontal and center;
- `Rotate UIButton according to the device orientation*`: snippet for you be able to rotate a button according to the device orientation;

</details>

<details>
<summary>UITextView</summary>

Collection of helpers functions for UITextView and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

Link to the folder: [link](UI/UITextView)

- `Auto adjust UITextView*`: snippet for you adjust your UITextView according to the text size;

</details>
</details>

<details>
<summary>RxSwift</summary>

Collection of RxSwift helper, function and anything related to this.

All the files / class has some kind of comment and help according to the need and if need.

Link to the folder: [link](RxSwift)

- `Custom operator for disposeBag '>>>'*`: snippet to simple disposeBag without need type this function always;
- `Custom operator for get last update from both observer '<->'*`: snippet to simple avoid loop about update observers that are listen each other;
- `Unwrap option values easy*`: snippet to simple unwrap optional value without need to validate at subscriber;
- `Is empty validation values check*`: snippet to simple check if value is empty;
- `Validate if the value is nil*`: snippet to simple check if value is nil, as we have some situations that this is useful;
- `Validate if the value is void*`: snippet to simple check if value is void like we set the value to 0 so we want to do something on this situation without validate on subscriber value if is 'void';
- `Get only the first value*`: snippet to only react to that action if is the first response from the observable;

</details>

<details>
<summary>Helpers - General</summary>

Folder that contains general code helpers, that can help you with tasks that are not that specific.

Link to the folder: [link](Helper)

- `Keyboard Avoid Helper*`: Helper class for you easy adjust any view with text field that is inside ScrollView and it's behind keyboard. With possibility to pass any other size that you want to have as difference the keyboard. - [link](Helper/KeyboardAvoidHelper.swift)
- `Identify if user set the device to mute*`: Helper that allow you to identify programmatically if user set the device to muted / silence state. - [link](Helper/DeviceStatus.swift)

</details>

## Utilities

<details>
<summary>Deep link on Simulator</summary>

Helper that facilitate you test deep link on your running simulator.

With this you can easy have you running project in debug mode, trigger the deep link that you want to test and will be triggered so you can use your breakpoints to debug .

- Link: https://github.com/felipeflorencio/iOSSimulatorDeepLinkHelper

</details>

## Cheat Sheet

<details>
<summary>Cheat Sheet</summary>

- `Content Hugging and Content Compression resistance priorities*`: Cheat Sheet for easy understand and consult how to handle this properties;

<a href="https://github.com/felipeflorencio/Swift-Snippets/raw/master/Cheat-Sheet/Content-Hugging-Resistence-Priorities-Cheat-Sheet.pdf"><img src="https://github.com/felipeflorencio/Swift-Snippets/blob/master/Cheat-Sheet/Content-Hugging-Resistence-Priorities-Cheat-Sheet.png?raw=true" height="518px" width="400px"></a>

</details>

## Installing

* For now it's just get the files according to the type and use on your project, future improvement is create a snippet tool to easy access or even a code-snippet to use direct on your project

## Me - https://felipeflorencio.github.io/

## Donate
If this project helped you in any way and you feel like supporting me please share new code snippets that you think is useful and I will be happy add here to create the best swift snippet repo

## License

MIT License

Copyright (c) 2018 Felipe Garcia

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
