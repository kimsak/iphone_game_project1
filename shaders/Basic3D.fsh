
varying lowp vec4 colorVarying;

void main()
{
    if(colorVarying.w > 0.0) gl_FragColor = colorVarying;
	else discard;
}
