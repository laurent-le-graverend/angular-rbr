# angular-rbr

RBR for Responsive Line Breaks
Add dynmamic line breaks depending of the viewport width!

The origin of this need is is mostly because webkit does not support the CSS property `word-break: "keep-all"` for CJK languages (Chinese, Japanese, Korean).
Without `word-break: "keep-all"`, CJK line breaks are cut in the middle of any word, which is a complicated task when it comes to responsive websites.

You do not want your important sentences or titles beeing cut randomly in the middle of a word - or by extensions, somewhere you don't want between words.

## Install

**The work is ongoing, please wait of fork it!**

Install with `bower`:

```shell
bower install git://github.com/laurent-le-graverend/angular-rbr.git
```

Add a `<script>` to your `index.html`:

```html
<script src="/bower_components/angular-rbr/angular-rbr.js"></script>
```

And add `llg.rbr` as a dependency for your app:

```javascript
app = angular.module('myApp', ['llg.rbr']);
```

## Use

### Just markup!

Use the `rbr` element in your html:

```html
<p>Lorem ipsum do<rbr class="x-small large" data-range="540-700, 1300-1400">lor sit amet</p>
```

### Available classes

Each class has three aliases in case if its style is overrided by some of your CSS.

List of classes, and their default viewport value defining when a line break is added:

* `x-small`, `xs`, `rbr-x-small`, `rbr-xs`: 480px
* `small`, `sm`, `rbr-small`, `rbr-sm`: 768px
* `medium`, `md`, `rbr-medium`, `rbr-md`: 992px
* `large`, `lg`, `rbr-large`, `rbr-lg`: 1200px
* `x-large`, `xl`, `rbr-x-large`, `rbr-xl`: 1300px

## Configure

Allows you to change the default values for the classes defined above.

TODO!

## License

The MIT License

Copyright (c) 2014 Laurent Le Graverend http://www.legraverend.fr

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.