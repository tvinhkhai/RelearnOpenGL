HELLO, WORLD! (draw a triangle)

DATE 1/1/2023 -

    GOAL: draw a moving in and out triangle

    At 11:00PM, I starts learn openGL (this is the nth time), hello again, https://learnopengl.com/

    - glEnable(Glenum cap) -> set state options/capabilities, stay enable until glDisable

I. OpenGL
1. What is OpenGL
    OpenGL is mainly considered an API (Application Programming Interface)
    OpenGL by itself is not an API, but merely a specification, developed and maintained by Khronos
    Usually implemented by graphics card manufacturers

2. Core-profile vs Immediate mode
    Immediate mode (often referred to as the fixed function pipeline):
        - Easy to use and understand, but also extremely inefficient
        - Most of the functionality of OpenGL was hidden, developers did not have much control over how OpenGL does it calculations
        - Deprecated from version 3.2 -> more flexible core-profile mode

    Core-profile mode:
        - Modern practices: whenever we try to use one of OpenGL's deprecated functions, OpenGL raises an error and stops drawing
        - Very flexible and efficient
        - More difficult to learn
        - Require OpenGL and graphics programming understanding

    LearnOpenGL site uses core-profile OpenGL 3.3 but not lastest version because:
        - All future versions of OpenGL starting from 3.3 add extra useful features to OpenGL without changing OpenGL's core mechanics
        -> concepts and techniques remain the same over modern OpenGL versions
        -> valid to learn OpenGL 3.3, also higher version require modern graphics cards.

3. Extensions
    New technique or a new large optimization for rendering is often found in an extension implemented in the drivers
    May become part of future OpenGL version
    Query whether the extension is available before use:
    ```cpp
    if (GL_ARB_extension_name)
    {
        // Do cool new stuff supported by hardware
    }
    else
    {
        // Extension not supported: do it the old way
    }
    ```

###################################################################################################