//
//  SKTexture+RegularRect.h
//  
//
//  Created by Božidar Ševo on 22.12.2013..
//
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface SKTexture (RegularRect)

//returns CGRect in unit coordinates from CGRect in regular coordinates
+ (CGRect)unitRectFromRegularRect:(CGRect)rect inTexture:(SKTexture *)texture;

//returns SKTexture subtexture from texture using regular CGRect
+ (SKTexture *)textureWithRegularRect:(CGRect)rect inTexture:(SKTexture *)texture;

@end
