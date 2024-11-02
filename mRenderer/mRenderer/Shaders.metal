//
//  Shaders.metal
//  mRenderer
//
//  Created by Thy Tran on 11/2/24.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float4 position [[position]];
};

vertex VertexIn basic_vertex(const device float3 *vertices [[buffer(0)]], unsigned int vid [[vertex_id]]) {
    VertexIn out;
    out.position = float4(vertices[vid], 1.0);
    return out;
}

fragment float4 basic_fragment() {
    return float4(1, 0, 0, 1); // Red color
}

