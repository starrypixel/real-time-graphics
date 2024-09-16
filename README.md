# real-time-graphics
Notes and code by auditing the real-time graphics course taught at UPF.

[Real-time Graphics - A course about modern real-time render engines](https://tamats.com/learn/realtime-graphics/)
 
### Description ###
In this course we would learn the basic of how modern realtime render engine's work.
Students start with a very basic render engine and build uppon it all the current techniques to improve the visual quality maintaining a good framerate.

### Requirements ###
Students must have prior knowledge to C/C++ programming, OpenGL and basic Computer Graphics algorithms (like 3D transformations, linear algebra, framebuffer, etc).
The Computer Graphics Course material can be found also in this website.

### Materials ### 
All the code can be found in its [github repository](https://github.com/jagenjo/GTR_Framework).
The framework can be compiled in Visual Studio, GCC or XCode.
We use Blender as our main tool to export content to our engine.
Website to get assets: [Sketchfab](https://sketchfab.com) and [Polyhaven](https://polyhaven.com).
There are recordings of the coding part of every class. You can find the video in the [Youtube Playlist](https://www.youtube.com/playlist?list=PLpH3ZN1TMo28AivxHZRMeFLO6XY37k60H)

### Content ###

    1. Introduction
        - Recap of previous required knowledge    
    2. The GPU
        - Understanding the basics of how a GPU works, and what can it do.
    3. The Framework
        - A walkthrough over the C++/OpenGL codebase used along the course.
    4. Illumination
        - Basic of Phong equation, types of light (point, spot, directional) and attenuation.
    5. Shadows
        - Shadow techniques, how to generate shadowmaps, optimizations.
    6. First Assignment
        - In the first assigment you must add illumination and shadows to the framework.
    7. Render Pipelines
        - Optimizing the rendering pipeline for more complex environments. Programming a deferred rendering pipeline.
    8. Physicaly Based Materials
        - Understanding the PBR Model, coding the equation and how to improve materials.
    9. HDR and Linear Space
        - High-dynamic range images for better quality and using Linear Color Space to improve fidelity.
    10. Ambient Occlusion
        - Basic implementation of Amblient Occlusion to give better depth to scenes.
    11. Second Assignment
        - Here we will optimize our render pipeline with Deferred Rendering and improve the visual quality with PBR and SSAO.
    12. Irradiance
        - Approaches for bounced light.
    13. Reflections
        - Adding reflections to the scene, from precomputed to realtime.
    14. Volumetric Rendering
        - How to render volumetric elements like fog.
    15. Decals
        - Improving the scene with decals to give detail to surfaces.
    16. Post-processing
        - Understanding a post-processing stack to enhance the visual quality.
    17. Beyond the course
        - Final recap and some guides of how to move forward after this course.
    18. Final Assignment
        - Here we will add Reflections, Irradiance, Volumetric lights and PostFX.     
    19. WebGPU
        - Presentation about WebGPU.
