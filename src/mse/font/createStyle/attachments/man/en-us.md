# Synopsis

Creates a color style code for parameter-compliant text informed.



&nbsp;

# Parameters

## int colorSystem

- aka       : -c --colorSystem
- default   : 4
- options   : 
  - 4:
  - 8:
  - 32:
- hint      :  
  Color system (4, 8 or 32 bits).

There are 3 color description systems that can be used according to the 
compatibility of your terminal.

Choose one of these:

- 4   : Uses 4 bits for color representation (16 colors).
        This is the most common system among the various terminals.
- 8   : Uses 8 bits for color representation (256 colors).
- 32  : Uses 32 bits for true color representation.


&nbsp;

## int|string attribute

- aka       : -a --attribute
- hint      :
  Code or name of the font attribute to use.

You can set more than one value by simply separating them by a comma.

  Cod     : Name        : Effect
  20      : NONE        : Resets any defined attribute (default value).

   1      : BOLD        : Bold
   2      : DARK        : Dark
   3      : ITALIC      : Italic
   4      : UNDERLINE   : Underline
   5      : BLINKS      : Blink (slow)
   6      : BLINKF      : Blink (fast)
   7      : REVERSE     : Inverts the font color and background color selection
   8      : HIDE        : Hide
   9      : STRIKE      : Strike

  21      : RBOLD       : Remove Bold
  22      : RDARK       : Remove Dark
  23      : RITALIC     : Remove Italic
  24      : RUNDERLINE  : Remove Underline
  25      : RBLINKS     : Remove Blink (slow)
  26      : RBLINKF     : Remove Blink (fast)
  27      : RREVERSE    : Remove Inversion
  28      : RHIDE       : Remove Hide
  29      : RSTRIKE     : Remove Strike

**Values considered invalid will be ignored.**


&nbsp;

## int|string background

- aka       : -bg --background
- hint      :
  Background color to use.

The value to be described varies depending on the type of color system selected.


**4-bit system**
In this case you can use the code or the name of the color as shown in the 
table below:

  Cod     : Name        : Effect
  49      : NONE        : Resets the background color (default value).

  Normal Palette
  40      : BLACK       : Black
  41      : RED         : Red
  42      : GREEN       : Green
  43      : YELLOW      : Yellow
  44      : BLUE        : Blue
  45      : PURPLE      : Purple
  46      : CYAN        : Cyan
  47      : WHITE       : White

  Light / Luminous Palette
  100     : LBLACK      : Black
  101     : LRED        : Red
  102     : LGREEN      : Green
  103     : LYELLOW     : Yellow
  104     : LBLUE       : Blue
  105     : LPURPLE     : Purple
  106     : LCYAN       : Cyan
  107     : LWHITE      : White


**8-bit system**

Enter a value between 0 and 255 for the desired color. 
The default value in this case is "0" (black).


**32-bit system**

Enter a value between 0 and 255 for each of the vectors R, G, and B separated 
by a ";" character.
The default value in this case is "0;0;0" (black).


**For either case, values considered invalid will be reverted to the default 
value of each system.**


&nbsp;

## int|string foreground

- aka       : -fg --foreground
- hint      :
  Foreground color to use.

The value to be described varies depending on the type of color system selected.


**4-bit system**
In this case you can use the code or the name of the color as shown in the 
table below:

  Cod     : Name        : Effect
  39      : NONE        : Resets the background color (default value).

  Normal Palette
  30      : BLACK       : Black
  31      : RED         : Red
  32      : GREEN       : Green
  33      : YELLOW      : Yellow
  34      : BLUE        : Blue
  35      : PURPLE      : Purple
  36      : CYAN        : Cyan
  37      : WHITE       : White

  Normal Palette + Dark Attribute
  230     : DBLACK      : Black
  231     : DRED        : Red
  232     : DGREEN      : Green
  233     : DYELLOW     : Yellow
  234     : DBLUE       : Blue
  235     : DPURPLE     : Purple
  236     : DCYAN       : Cyan
  237     : DWHITE      : White

  Light / Luminous Palette
  90      : LBLACK      : Black
  91      : LRED        : Red
  92      : LGREEN      : Green
  93      : LYELLOW     : Yellow
  94      : LBLUE       : Blue
  95      : LPURPLE     : Purple
  96      : LCYAN       : Cyan
  97      : LWHITE      : White

  Light / Luminous Palette + Dark Attribute
  290     : LDBLACK     : Black
  291     : LDRED       : Red
  292     : LDGREEN     : Green
  293     : LDYELLOW    : Yellow
  294     : LDBLUE      : Blue
  295     : LDPURPLE    : Purple
  296     : LDCYAN      : Cyan
  297     : LDWHITE     : White


**Obs:** the _DARK_ version of the colors is a non-standard implementation and 
works just as a _wrapper_ to set said color with the _DARK_ attribute.


**8-bit system**

Enter a value between 0 and 255 for the desired color. 
The default value in this case is "255" (white).


**32-bit system**

Enter a value between 0 and 255 for each of the vectors R, G, and B separated 
by a ";" character.
The default value in this case is "255;255;255" (white).


**For either case, values considered invalid will be reverted to the default 
value of each system.**


&nbsp;

## bool returnAsString

- aka       : -raa --returnAsString
- default   : 0
- hint      :  
  Enter '1' if you want to return the style code in readable string format.

If omitted or entered '0' a color code will be returned ready for be used in a 
Bash string formatting. If you enter '1' the value returned will be a string 
containing all the generated code representing the style of colors formed.



&nbsp;

# Examples

``` shell
  result=$(mse_font_createStyle "4" "BOLD" "DWHITE" "LBLUE")
  printf "${result}Formatted as i wanted"
```



&nbsp;

# Returns string

Returns a string representative of the formed style, either in code format 
ready to use, either as a readable string.