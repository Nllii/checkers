import cv2
haar_folder = 'haarcascades'



ds_factor = 0.5

class VideoCamera(object):
    def __init__(self):
        self.video = cv2.VideoCapture(0)
        # self.video.set(cv2.CAP_PROP_FRAME_WIDTH, 640)

    def __del__(self):
        self.video.release()
        
    
    def get_frame(self):
        success, image = self.video.read()
        # face_cascade=cv2.CascadeClassifier(f"{haar_folder}/haarcascade_eye_tree_eyeglasses.xml")
        face_cascade = cv2.CascadeClassifier(f"{haar_folder}/haarcascade_frontalface_default.xml")
        eye_cascade = cv2.CascadeClassifier(f"{haar_folder}/haarcascade_eye.xml")

        
        image=cv2.resize(image,None,fx=ds_factor,fy=ds_factor,interpolation=cv2.INTER_AREA)
        gray=cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
        
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)
        for (x,y,w,h) in faces:
            img = cv2.rectangle(image,(x,y),(x+w,y+h),(255,0,0),2)
            roi_gray = gray[y:y+h, x:x+w]
            roi_color = img[y:y+h, x:x+w]
            eyes = eye_cascade.detectMultiScale(roi_gray)
            for (ex,ey,ew,eh) in eyes:
                cv2.rectangle(roi_color,(ex,ey),(ex+ew,ey+eh),(0,255,0),2)
                break

        
        
        # face_rects=face_cascade.detectMultiScale(gray,1.3,5)
        # for (x,y,w,h) in face_rects:
        #     cv2.rectangle(image,(x,y),(x+w,y+h),(0,255,0),2)
            # break
        ret, jpeg = cv2.imencode('.jpg', image)
        return jpeg.tobytes()
