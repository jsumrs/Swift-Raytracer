This statement is my commitment to this project. I will complete the book and make a ray tracer
using Swift & Metal (?).


# Preface 
I'll learn how to implement a Whitted Ray Tracer (Turner Whitted). Which goes something like this:

1. Cast a ray into the scene, and see where it hits a surface.
2. Cast a ray from that point toward a light point and determine which light source illuminates it.
3. If the surface is reflective, cast a ray in the direction of the surface and see what the color
would be there.
4. If the surface is transparent, follow it through its refraction and determine the color there.
5. Combine all the colors for that point and return the color of that pixel.


The book will explain things using pseudocode, so my project can be written in any language and
environment. I'll be given test cases written in Cucumber which describe what a function needs to
perform. I can use Cucumber tests or whatever I prefer. I'm going to use swift testing.

The book doesn't get into the details of math, like the creation of certain formulas or expressions.
I might also not agree with the book's software architecture, so i can modify it as i see fit.

A lot of testing will be done with floating point numbers so accuracy should be set to 0.0001.
This value is referred to as EPSILON.


The comparison of data structures will require new functions for which the book doesn't create tests
for. I should implement my own.


# Chapter 1

You can represent a point in a plane as an ordered pair of numbers, a tuple:
 x  y
(0, 4)

You can represent directions to get to a point as an ordered pair of numbers as well, a vector:
 x  y
(0, 4)

This means, move 0 units in the x direction, and 4 units in the positive y direction.


We can also represent both in 3D space:
 x  y  z
(0, 4, 1)
-- A point at (0, 4, 1)


 x  y  z
(0, 4, 1)
-- A vector pointing to (0, 4, 1)
This means, move 0 units in the x direction, and 4 units in the positive y direction, and 1 unit in
the positive z direction.

The z direction is away from you, using the left handed coordinate system. Point your thumb in the
positive x direction, then your fingers are going in the pos y direction, and if you curl them, they
go in the z direciton.



To tell vectors and points apart we can use a w component:

Point:
 x  y  z  w
(0, 4, 1, 1)

Vector:
 x  y  z  w
(0, 4, 1, 0)


As i'm writing the RTTuple struct, i'm cringing at this architecture. We are storing type
information inside the w variable, and also inside a type variable. This is terribleeeee

I'm going to just use Swift Package Manager for a CLI app. No xcode. Going with VSCode for
simplicity.

To run the tests just do:
`swift test`

The magnitude of a vector is given by the pythagorem theorem:
magnitude(v) = sqrt(x * x + y * y + z * z + w * w)

This chapter introduced a lot of operations you can perform on vectors and points. Normalizing, getting the magnitude, multiplying / scaling, dividing, 

I'll want to go back and replace RTTuple with protocols or something, storing type inside the data is convoluted.

# Chapter 2

Colors are represented by three 0..1 numbers. BUT it's good to support numbers outside that range throughout the rendering pipeline. If you normalize too early it can lead to parts of the scene being too bright or dark.

Colors are blended by multiplying the together. THis is called the Hadamard or Schur product.

PPM is a pretty simple format. https://oceancolor.gsfc.nasa.gov/staff/norman/seawifs_image_cookbook/faux_shuttle/ppm.html
First line is the version you are using P3 for simple, and P6 for binary.
The next line is width and height.
The next is the max color value
Then its the pixels in R G B format. Note that you can't exceed 70 characters in P3 mode.

I split all my tests up on a per type basis. This helps keep the test files small, and easier to navigate.
