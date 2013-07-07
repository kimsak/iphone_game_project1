//
//  Shader.fsh
//  iOS_Sample1
//
//  Created by 木村 裕作 on 2013/03/26.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

varying lowp vec4 colorVarying;
varying mediump vec2 texCoord0;

uniform sampler2D sampler;

void main()
{
	if(colorVarying.w > 0.0) gl_FragColor = colorVarying * texture2D(sampler, texCoord0);
	else discard;
}
