#version 300 es

in vec4 position;
in vec2 texcoordin;
in vec3 normals;
out vec4 positionout;
out vec4 normalsout;

out vec2 texcoordout;
uniform mat4 matrix;
uniform mat4 modelmatrix;

void main()
{
    texcoordout=texcoordin;
    positionout=modelmatrix*position;
    normalsout=vec4(mat3(modelmatrix)*vec3(normals.xyz),1.0);
    gl_Position=matrix*position;
}