SKTexture Regular Rect Coordinates Subtexture
=================================

Use regular CGRect coordinates to get subtextures from SKTexture in Sprite Kit code. This was made using Objective C categories.

Why this?
---
I was playing a bit with **SKTexture** and the method
```objc
+ (SKTexture *)textureWithRect:(CGRect)rect inTexture:(SKTexture *)texture
```
and I did not get the results as I expected.
Then I went to see details about that method in the documentation and there was this part about the "rect" argument:
>A rectangle in the **unit** coordinate space that specifies the portion of the texture to use.

So as you see, you need to use **unit** coordinate space coordinates. In most of methods that I used **CGRect** I used regular CGRect, example: (30, 20, 100, 300). That is why I made this *SKTexture* category. There are two methods added to *SKTexture*.

Methods
---
I added two methods to **SKTexture** using Objective C categories

First method returns **CGRect** in unit coordinates from CGRect in regular coordinates
```objc
+ (CGRect)unitRectFromRegularRect:(CGRect)rect inTexture:(SKTexture *)texture;
```
Second method returns **SKTexture** subtexture from texture using regular CGRect
```objc
+ (SKTexture *)textureWithRegularRect:(CGRect)rect inTexture:(SKTexture *)texture;
```

Examples
---
If you have some texture with dimensions 100x50 and you want to get subtexture from (10,20) with width of 40 and height of 30, you should call it like this:
```objc
CGRect regularRect = CGRectMake(10, 20, 40, 30);
//your SKTexture is loaded to "yourTexture" variable
SKTexture *subTexture = [SKTexture textureWithRegularRect:regularRect inTexture:yourTexture];
```
And this code will calculate your regular CGRect to unit coordinate space and return you the correct subtexture.

Method Arguments
---
You can pass CGRect of any values. If any of *width* or *height* is negative you will get back CGRect (0,0,0,0) or subtexture with that CGRect.
If you have negative *x* or *y* in CGRect, values will be translated to 0 and width or height will also be changed.
For example:
```objc
CGRect regularRect = CGRectMake(-10, 20, 50, 30);
//your SKTexture is loaded to "yourTexture" variable
SKTexture *subTexture = [SKTexture textureWithRegularRect:regularRect inTexture:yourTexture];
```
is the same as:
CGRect regularRect = CGRectMake(0, 20, 40, 30);
//your SKTexture is loaded to "yourTexture" variable
SKTexture *subTexture = [SKTexture textureWithRegularRect:regularRect inTexture:yourTexture];
```

You
---
I hope this will help you as well as it did to me :)