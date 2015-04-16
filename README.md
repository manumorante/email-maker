Email maker
================================

Ruby Helpers for create compatible e-mail templates. MailChimp.

  - Compatible
  - GH Pages auto hosting
  - Management of urls

Example
---------------------------------

```ruby
<p <%= font %>>Text with default text styles.</p>
<table <%= table %>>
    <tr>
        <td>
        <p <%= font size: '10px' %>>Small text example.</p>
        <p <%= image src: 'brand.png' %>></p>
        </td>
    </tr>
</table>
```

Use
---------------------------------

The *default layout* is a set of rules valid CSS and HTML to create the basis for our email .

### Helpers

**IMAGE**
```ruby
image(opts = {})
```

**TABLE**
```ruby
table(opts = {})
```

**FONT**
```ruby
font(opts = {})
```

**SPACER**
```ruby
spacer(opts = {})
```

**Error**
```ruby
error msg
```

### Create a new mail

Create a new folder in `/source/emails/` and put here your images and the a file `your_mail.html.erb`.


Links
---------------------------------

Dillinger uses a number of open source projects to work properly:

* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [jQuery] - duh

[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[jQuery]:http://jquery.com
