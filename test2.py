import cv2

image = cv2.imread('lenna.jpg')
cv2.imshow('img',image)
cv2.waitKey(5000)
cv2.destroyAllWindows()

cv2.imshow('grey',cv2.cvtColor(image, cv2.COLOR_BGR2GRAY))
cv2.waitKey(5000)
cv2.destroyAllWindows()