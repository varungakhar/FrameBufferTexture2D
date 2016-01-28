#version 300 es 
precision lowp float;
in vec2 texcoordout;

uniform sampler2D image;
uniform vec4 lightposition;
uniform vec4 eyeposition;
in vec4 positionout;
in vec4 normalsout;
uniform float  offset ;
layout (location=0)out vec4 fragcolor;
layout (location=1)out vec4 BrightColor;

void main()
{

    
    if (offset==0.0)
    {
            vec4 lightvalue=normalize(lightposition-positionout);
            float diffuse=dot(normalize(normalsout),lightvalue);
            vec4 eyevalue=normalize(eyeposition-positionout);
            vec4 reflection=normalize(reflect(-lightvalue,normalize(normalsout)));
        float specularity=dot(reflection,eyevalue);
        specularity=clamp(specularity,0.0,1.0);
        specularity=pow(specularity,16.0);
        vec4 ds=vec4(diffuse,diffuse,diffuse,1.0)+vec4(specularity,specularity,specularity,1.0);
        fragcolor= texture(image,texcoordout);

        float brightness = dot(ds.rgb, vec3(0.2126, 0.7152, 0.0722));

            BrightColor = vec4(ds.rgb, 1.0);
        
    }
    else
    {
        fragcolor=texture(image,texcoordout);
    }
    
    
    
}
