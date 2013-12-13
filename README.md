```
       ______     ______     ______     ______     _____     ______
      /\  __ \   /\  == \   /\  ___\   /\  __ \   /\  __'.  /\  ___\
      \ \ \/\.\  \ \  __<   \ \ \____  \ \ \/\ \  \ \ \/\ \ \ \  __\
       \ \___\_\  \ \_\ \_\  \ \_____\  \ \_____\  \ \___.+  \ \_____\
        \/___/_/   \/_/ /_/   \/_____/   \/_____/   \/___.'   \/_____/
```

Introduction
------------

vim-QRCode provides a way to display a QR code on your vim. The QR code can have a content limited to 140 characters. You can display any content by executing a command with a seleced text or a text as an argument.

The generated QRCode will be displayed on a new tab.

Screenshot
----------

![Screenshot of vim-QRCode](https://raw.github.com/OrgaChem/vim-qrcode/images/screenshots/screenshot.png)


Usage
-----

QRCode will get a selected text by the QRCode command:

    :'<,'>QRCode

Display a text by QRCode command:

    :QRCode Lorem ipsum dolor sit amet.

And an URL can be displayed (many smart phones can recognize an URL style QR code, so it makes easy to open the URL by the smart phones):

    :QRCode https://www.vim.org

Requirements
------------

QRCode requires a Ruby interface (`+ruby`) and a [rQRCode module](https://github.com/whomwah/rqrcode) that is a QR code generator implemented by ruby.

You can install rQRCode by the command:

    gem install rqrcode


License
-------

[MIT License](http://opensource.org/licenses/MIT)


Credit
------

* QR code is trademarked by [Denso Wave inc](http://www.qrcode.com/en/).
* [rQRCode](https://github.com/whomwah/rqrcode)
