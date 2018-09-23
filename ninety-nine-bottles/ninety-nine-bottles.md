## Getting Started

From your challenges folder, type the following command:

```
$ et get ninety-nine-bottles
$ cd ninety-nine-bottles
$ atom .
```

### Instructions

Write a program that prints out the lyrics to that beloved classic ["99 Bottles of Beer on the Wall"][lyrics].
As an added twist, add an exclamation point to the sentence for every 10 bottles of beer.

### Sample Output

Here is an example of what the output should look like (only snippets of the song are shown):

```no-highlight
$ ruby beer.rb

99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.

98 bottles of beer on the wall, 98 bottles of beer.
Take one down and pass it around, 97 bottles of beer on the wall.

97 bottles of beer on the wall, 97 bottles of beer.
Take one down and pass it around, 96 bottles of beer on the wall.

... snip

91 bottles of beer on the wall, 91 bottles of beer.
Take one down and pass it around, 90 bottles of beer on the wall.

90 bottles of beer on the wall, 90 bottles of beer!
Take one down and pass it around, 89 bottles of beer on the wall.

89 bottles of beer on the wall, 89 bottles of beer.
Take one down and pass it around, 88 bottles of beer on the wall.

... snip

11 bottles of beer on the wall, 11 bottles of beer.
Take one down and pass it around, 10 bottles of beer on the wall.

10 bottles of beer on the wall, 10 bottles of beer!
Take one down and pass it around, 9 bottles of beer on the wall.

9 bottles of beer on the wall, 9 bottles of beer.
Take one down and pass it around, 8 bottles of beer on the wall.

... snip

2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

1 bottle of beer on the wall, 1 bottle of beer.
Take one down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
```

### Tips

Before submitting your code via `et`:

* Make sure to double-check the output of your code.
  - If there is only one bottle left, you should print `bottle` instead of `bottles`.
  - Make sure there in an extra blank line `\n` between each verse of the song.
  - Check that when there are zero bottles of beer left, the output is "No more bottles of beer..."
* Take a look at the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide). What changes can you make to your code so that it doesn't violate rules in the guide?
* Check your indentation. Proper white-space indentation helps others read your code. Use the "Auto Indent" feature in Atom if you are unsure if your code is properly indented: "Edit > Lines > Auto Indent".

### External Resources

[lyrics]: http://www.99-bottles-of-beer.net/lyrics.html
