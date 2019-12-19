0- Download the entire  dataset folder to your local machine, and extract it in the current folder with the functions.
							-----NOTE------
		    -----run on windows, or if you wanna run on linux update the libstream plugin and run----
				---------run the test file to get all the outputs------------
							QUESTION-6
1- the function ICV_localbinaryattern() take input a grayscale image. 
if you pass a grayscale image the fucntion will return a global feature descriptor of the image.
to make teh image grayscale, pass the image, to function ICV_rgbtogray(), it will return a grayscale image.
 to classify this image pass this image along with a face global descriptor and a non-face global descriptor to ICV_lcpclassification()
						QUESTION-4
					      -----NOTE-----
			 ---TAKES A WHILE TO EXECUTE, PLEASE WAIT FOR ITS RESULTS------
2- the fucntion ICV_finalblock(), takes in two frames block size adn search range as input and returns motion vectors and the predicted image.
ICV_mad() takes in inout two square blocks of euqalsize and their blocksize and returns the mean absolute difference of the two blocks.
						QUESTION-5
3- the function ICV_movingobjects(), takes input as two frames and returns the fore ground or binary image.
ICV_background() does not takes a video as an input, and returns the back ground of the a video as an image.
ICV_numberofmovingobjects(), does not take any input, just call the function and it will plot a graph of numbe of moving objects versus frame number.

