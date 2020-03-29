## importing lib
# import numpy as np
# import matplotlib.pyplot as plt
import cv2
import sys

# Ensuring that if the argument passed is an image, else exit.
if len(sys.argv) < 2:
    print("USAGE: {} img-file".format(sys.argv[0]))
    sys.exit(1)

# Load an color image in grayscaleimg = cv2.imread(sys.argv[1],0)
img = cv2.imread(sys.argv[1])
cv2.imshow('image',img)
cv2.waitKey(5000)

# Display color image in Greay Scale
cv2.imshow('image',cv2.cvtColor(img, cv2.COLOR_BGR2GRAY))
cv2.waitKey(5000)
cv2.destroyAllWindows()
## Alternative: 
# grayimg = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# cv2.imshow('image',grayimg)
# cv2.waitKey(5000)
# cv2.destroyAllWindows()

## Load color image in grayscale... cv2.imread(sys.argv[1],0)
## the arg '0' passed with the read operation 
# img = cv2.imread(sys.argv[1],0)
# cv2.imshow('image',img)
# cv2.waitKey(5000)
# cv2.destroyAllWindows()
## Alternative:
# img = cv2.imread(sys.argv[1], cv2.IMREAD_GRAYSCALE)
# cv2.imshow('image',img)
# cv2.waitKey(5000)
# cv2.destroyAllWindows()
