# HELLO, WORLD! (draw a triangle)

## DATE 1/1/2023 -

    GOAL: draw a moving in and out triangle

    At 11:00PM, I starts learn openGL (this is the nth time), hello again, https://learnopengl.com/ <br>
    - glEnable(Glenum cap) -> set state options/capabilities, stay enable until glDisable

## TABLE OF CONTENTS
- [HELLO, WORLD! (draw a triangle)](#hello-world-draw-a-triangle)
  - [DATE 1/1/2023 -](#date-112023--)
  - [TABLE OF CONTENTS](#table-of-contents)
  - [I. OpenGL](#i-opengl)
    - [1. What is OpenGL](#1-what-is-opengl)
    - [2. Core-profile vs Immediate mode](#2-core-profile-vs-immediate-mode)
    - [3. Extensions](#3-extensions)
    - [4. State machine](#4-state-machine)
    - [5. Objects](#5-objects)
    - [6. Additional resources](#6-additional-resources)
  - [II. Creating a window](#ii-creating-a-window)
    - [1. GLFW](#1-glfw)


## I. OpenGL

### 1. What is OpenGL

OpenGL is mainly considered an API (Application Programming Interface)<br>
*OpenGL* by itself *is* not an API, but merely **a specification, developed and maintained by Khronos**<br>
Usually *implemented by graphics card manufacturers*

### 2. Core-profile vs Immediate mode

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
- Concepts and techniques remain the same over modern OpenGL versions
- Valid to learn OpenGL 3.3, also higher version require modern graphics cards.

### 3. Extensions

New technique or a new large optimization for rendering is often found in an extension implemented in the drivers<br>
May become part of future OpenGL version<br>
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

### 4. State machine

OpenGL is a large state machine: a collection of variables that define how OpenGL should currently operate.

Often referred as the OpenGL context.

`state-changing` function: change the context.<br>
`state-using` function: perform operation based on the current state of OpenGL.

### 5. Objects

An `object` is a collection of options that represents a subset of OpenGL's state.

e.g: object represents the settings of the drawing windows; we could set its size, how many colors it supports and so on.<br>
C-like struct:
```c
struct object_name {
    float option1;
    int   option2;
    char[] name;
}
```
When use (with OpenGL's context visualized as a large struct):
```c
// The state of OpenGL
struct OpenGL_Context {
    ...
    object_name* object_Window_Target;
    ...
}
```
```cpp
//create object
unsigned int objectId = 0;
glGenObject(1, &objectId);
//bind/assign object to context
glBindObject(GL_WINDOW_TARGET, objectId);
//set options of object currently bound to GL_WINDOW_TARGET
glSetObjectOption(GL_WINDOW_TARGET, GL_OPTION_WINDOW_WIDTH, 800);
glSetObjectOption(GL_WINDOWS_TARGET, GL_OPTION_WINDOW_HEIGHT, 600);
//set context target back to default
glBindObject(GL_WINDOW_TARGET, 0);
```

This piece of code is a workflow frequently seen when working with OpenGL:
- Create an object and store a reference to it as an id (`objectId`)
- Bind the object to the target location of the context (`GL_WINDOW_TARGET`)
- Set the window options
- Unbind the object (set current object id of the window target to `0`)

The options we set are stored in the object referenced by `objectId` and restored as soon as we bind the object back to `GL_WINDOW_TARGET`.

We can create more than one object in our application, set their options and whenever we start an operation that uses OpenGL's state, we bind the object with our preferred settings.

### 6. Additional resources

[OpenGL official website](https://www.opengl.org/)
[OpenGL registry](https://registry.khronos.org/OpenGL/index_gl.php): host the OpenGL specifications and extensions for all OpenGL versions.

## II. Creating a window

An OpenGL context and an application window are needed before creating stunning graphics.<br>
However, those operations are specific per OS and OpenGL purposefully tries to abstract itself from these operations -> we have to:
- Create a window
- Define a context
- Handle user input

Luckily, there are quite a few libraries out there that provide the functionality we seek.<br>
On LearnOpenGL, we will be using `GLFW`

### 1. GLFW

GLFW: a C library allows us to create an OpenGL context, define window parameters, and handle user input

speed run for now, note to come back when I have more time:
https://learnopengl.com/Getting-started/Creating-a-window