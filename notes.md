This statement is my commitment to this project. I will complete the book and make a ray tracer
using Swift & Metal (?).


# Commit Messages

I'm following the conventionalcommit and angular guidelines for commit messages. For reference:
Type

Must be one of the following:

    build: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
    ci: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
    docs: Documentation only changes
    feat: A new feature
    fix: A bug fix
    perf: A code change that improves performance
    refactor: A code change that neither fixes a bug nor adds a feature
    style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
    test: Adding missing tests or correcting existing tests



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


# Chapter 3

This chapter lead up to inverting matrices. Inverting a matrix allows you to undo transformations.
We invert a matrix using "cofactor expansion"

Matrix inversion requires several pieces:
- Matrix Multiplication
  - Take each row from M1 and each column from M2, and multiply the row & col values, then add their products to get the result in M3 at [row, col]
- Identity Matrix
  - Similar to the number 1 (the identity for multiplication), the identity matrix multiplied by M results in M unchanged
- Matrix Transposition
  - This swaps rows for the columns and the columns for the rows
- Determinants
  - A number which can be used to see if a system of equations has a solution
  - For a 2x2 it is given by the equation 
    - [a b]
      [c d]
    - `ad - bc` 
  - For matrices larger than 2x2, you grab a row and multiply each element by its cofactor, and add those products together
- Submatrices
  - A submatrix is a matrix which had a row and col removed to produce a smaller matrix.
- Minors
  - The minor of an element at row i and col j, is the determinant of the submatrix at (i, j)
- Cofactors
  - A minor which might have had its sign changed
  - If you add the row and column indexes together, and the result is odd, then negate the minor

Finally to invert a matrix M1:
1. You create a matrix M2 which consists of the cofactors of each element of M1.
2. Then you transpose M2.
3. Then you divide each element in M2 by the determinant of M1.

# Chapter 4

Translation is the moving of a point through a transformation.
Translating a vector does nothing to the vector

You can scale points and vectors to change their "size"

Side note: NASA uses PI rounded to 15 decimals, as that's pretty darn accurate: https://www.jpl.nasa.gov/edu/news/how-many-decimals-of-pi-do-we-really-need/

Rotation happens clockwise along the respective axis when toward the negative end. If you are viewing the x axis in 3d space, a rotation around the x axis would be clockwise facing the negative x direction.

Shearing is the transformation of space such that straight lines become slanted. Points must remain evenly spaced and such this is done by changing the components in proportion to each other.

Transformations can be applied in sequence but they must be concatenated in reverse order of what you want (they are applied right to left)
M1 = sheer * translate * rotateX * M

## Clock
My points weren't drawing in the right positions. I was rotating around the z axis correctly, but applying the translation to the point every turn. I also needed to remap the coordinates to a proper range, since my origin was at the center, some coordinates were in negative quadrants.
