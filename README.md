<div align="center">

# Swift-Snippets <a href="https://github.com/felipeflorencio"><img src="https://github.com/felipeflorencio/Swift-Snippets/blob/master/icons/awesome-badge-template.png?raw=true" height="20px" width="120px"></a>

<img src="https://github.com/felipeflorencio/Swift-Snippets/blob/master/icons/swift-cube.png?raw=true" height="250px" width="250px">

##### A collection of functions / helpers for easy get not daily code use , like core data manager, scroll view, keyboard dismiss, and a lot more codes that we from time to time need to use.

[![Swift 4](https://img.shields.io/badge/Swift-4-green.svg?style=flat)](https://swift.org)
[![Platforms iOS | watchOS | tvOS | macOS](https://img.shields.io/badge/Platforms-iOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20macOS-green.svg?style=flat)](http://www.apple.com)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic)]()



### All of these scripts is suppose to work on all apple environment

</div>

## Scripts

<details>
<summary>Core Data</summary>

Colletion of core data most used code that you will need

- `Initialize core data/*`: snippet for you initialize you core date environment;
- `Receive update about core data update/*`: snippet for you receive any core data update, for new itens added, updated and deleted;

</details>

<details>
<summary>Foundation</summary>

Colletion of helpers functions for Foundation API's and the way to use in your project.

Can be just a class or a extension, variable, function, you can chose what is the best for your implementation / need.

- `Date formatter*`: snippet for you set the formatter that you want for you date string, has a default value or even you can set your own;
- `Computed variable inside extension using associated object*`: snippet for you be able to add computed variables inside extension using associate object;
- `Delay operation*`: snippet for you to easy delay operations using the block syntax or even implement using the protocol implementation;
- `Array extension, secure get item*`: snippet for secure retrieve a item from array already validating if item is there and if so return, otherwise return nil;

</details>

<details>
<summary>UI</summary>

Colletion of UI most used code that you will need.

All the files / class has some kind of comment and help according to the need and if need.

<details>
<summary>Helpers</summary>

Colletion of helpers functions for things related to view in general and the way to use in your project.

Can be just a class or a extension, variable, function, you can chose what is the best for your implementation / need.

- `Load view controller programmatically at start*`: snippet for you set programmatically which will be the root view controller when loading your app;
- `Load NIB according to the view controller file*`: snippet for you load your nibs just using the view controller name and access a function that will return the nib, without need to set the bundle or path;
- `UIColor+Helper - Get the HEX from UIColor`: snippet for you get a string with the HEX representation from UIColor;

</details>

<details>
<summary>UIView</summary>

Colletion of helpers functions for UIView and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

- `Add border to your view*`: snippet for you add border to your view type;
- `Add border color to your view*`: snippet for you add border color to your view type;
- `Add corner radious to your view*`: snippet for you add corner raidous to your view type;
- `Add border to specific side to your view*`: snippet for you add border to specific side or all side on your view type object;

</details>

<details>
<summary>UIImage</summary>

Colletion of helpers functions for UIImage and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

- `Tint color to your UIImage*`: snippet for you tint you image;

</details>

<details>
<summary>UIButton</summary>

Colletion of helpers functions for UIButton and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

- `Add image and text horizontal aligned to your UIButton*`: snippet for you add a image and text and align both horizontal and center;
- `Rotate UIButton according to the device orientation*`: snippet for you be able to rotate a button according to the device orientation;

</details>

<details>
<summary>UITextView</summary>

Colletion of helpers functions for UITextView and the way to use in your project.

Can be just a class or a extension, you can chose what is the best for your implementation / need.

- `Auto adjust UITextView*`: snippet for you adjust your UITextView according to the text size;

</details>
</details>

<details>
<summary>RxSwift</summary>

Colletion of RxSwift helper, function and anything related to this.

All the files / class has some kind of comment and help according to the need and if need.

- `Custom operator for disposeBag '>>>'*`: snippet to simple disposeBag without need type this function always;
- `Custom operator for get last update from both observer '<->'*`: snippet to simple avoid loop about update observers that are listen each other;
- `Unwrap option values easy*`: snippet to simple unwrap optional value without need to validate at subscriber;
- `Is empty validation values check*`: snippet to simple check if value is empty;
- `Validate if the value is nil*`: snippet to simple check if value is nil, as we have some situations that this is usuful;
- `Validate if the value is void*`: snippet to simple check if value is void like we set the value to 0 so we want to do somethin on this situation without validate on subscriver value if is 'void';
- `Get only the first value*`: snippet to only react to that action if is the first response from the observable;

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
If this project helped you in any way and you feel like supporting me please share new code snippets that you think is usefull and I will be happy add here to create the best swift snippet repo

## License

MIT License

Copyright (c) 2018 Felipe Garcia

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
