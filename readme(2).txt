----This is a readme file---
the main code is in the test.m script. the complete code is commented out as per each question of the assignment.
make sure you download the dataset A and B in the current folder along with the image provided.
all these images and videos should be in the current folder beofre you can run the code.

to run all the functions at once, and see all the results at once remove the complete code from comments and run. or if you wish to see answers in a serial manner by questions keep commenting out the part of code which says the question number in the beginning.
if you wish to see all the results at once, after commenting the code out, run the main test.m script and wait for the rsukts to pop uo one by one.
the first function is ICV_rot_img.m, which takes an image and ange as an input and rotates the image by the degree and returns it.

the second function is ICV_skew.m which skews takes an image and angle as an input and returns a skewed image by that angle.

the third function is ICV_convolution, that takes a 3x3,5x5, or 7x7 kernel and a greyscale image as an input and returns the filtered image.
to apply new kernels or the effect of two or more kernels you need to call the function again with the filtereed image and a new filter.

the fourth function is ICV_rgbhistogram, which taken an image or a frame as input and returns the RGB bins of the image.

The fifth function is ICV_histintersection, that takes a video as an input and displays live frame T and T+1 with their respective histograms and intersection values.
