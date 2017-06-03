# Image-Montage
Create a Cover Image using many small images

# Theory
- When we create a montage, we are trying to create the low pass information of the cover image using many small images.
- We lose the details in the cover image, but the structure is retained. 
- We divide the cover image into non overlapping blocks and calculate the average value of the block.
- The average value represents the low pass information in that block.
- We compare this average value with the average value of all the small images.
- Now we have 2 options. We can either select the image which has the closest average to the block or randomly select an image from top k closest matches

# Results

![output](https://cloud.githubusercontent.com/assets/13918778/26756715/cf8c9b56-485d-11e7-9632-5182dd95f494.jpg)

![output](https://cloud.githubusercontent.com/assets/13918778/26756712/bc88c3fe-485d-11e7-904e-d9914cfd55fb.jpg)

# Notes:
Presently the code is made for gray images. Montage for color images will be added later.
I have created a matrix of all the average values for every image in the folder. This matrix needs to be changed according to users images.

# Running the code
- Run the main.m file

# Acknowledgements
I would like to thank Imagenet (http://image-net.org). I have selected 5000 random images from this dataset.
