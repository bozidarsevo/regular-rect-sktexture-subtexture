//
//  SKTexture+RegularRect.m
//  
//
//  Created by Božidar Ševo on 22.12.2013..
//
//
// you can find details on Github at https://github.com/bozidarsevo/regular-rect-sktexture-subtexture

#import "SKTexture+RegularRect.h"

@implementation SKTexture (RegularRect)

+ (CGRect)unitRectFromRegularRect:(CGRect)rect inTexture:(SKTexture *)texture
{
    CGFloat textureWidth = texture.size.width;
    CGFloat textureHeight = texture.size.height;
    
    if (textureWidth < 0.0 || textureHeight < 0.0) {
        return CGRectMake(0.0, 0.0, 0.0, 0.0);
    }
    
    CGFloat xFinal, yFinal, widthFinal, heightFinal;
    
    CGFloat xRect = rect.origin.x;
    CGFloat yRect = rect.origin.y;
    CGFloat widthRect = rect.size.width + xRect;
    CGFloat heightRect = rect.size.height + yRect;
    
    
    // X PART
    if (xRect < 0.0) {
        widthRect = widthRect + xRect;
        xRect = 0.0;
    }
    else if (xRect > textureWidth) {
        xRect = textureWidth;
        widthRect = textureWidth;
    }
    
    // Y PART
    if (yRect < 0.0) {
        heightRect = heightRect + yRect;
        yRect = 0.0;
    }
    else if (yRect > textureHeight) {
        yRect = textureHeight;
        heightRect = textureHeight;
    }
    
    // WIDTH
    if (widthRect < 0.0) {
        widthRect = 0.0;
    }
    else if (widthRect > textureWidth) {
        widthRect = textureWidth;
    }
    if (widthRect < xRect) {
        widthRect = xRect;
    }
    
    // HEIGHT
    if (heightRect < 0.0) {
        heightRect = 0.0;
    }
    else if (heightRect > textureHeight) {
        heightRect = textureHeight;
    }
    if (heightRect < yRect) {
        heightRect = yRect;
    }
    
    // FINAL
    xFinal = xRect / textureWidth;
    yFinal = yRect / textureHeight;
    widthFinal = (widthRect - xRect) / textureWidth;
    heightFinal = (heightRect - yRect) / textureHeight;

    return CGRectMake(xFinal, yFinal, widthFinal, heightFinal);
}

+ (SKTexture *)textureWithRegularRect:(CGRect)rect inTexture:(SKTexture *)texture
{
    CGRect unitRect = [self unitRectFromRegularRect:rect inTexture:texture];
    
    return [SKTexture textureWithRect:unitRect inTexture:texture];
}
    
@end
