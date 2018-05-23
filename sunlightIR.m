%kinectStream now has the live video input of the xbox 1 v2 kinect
kinectStream = videoinput('kinect',1);

%make kinectStream a gray scale video
kinectStream.ReturnedColorSpace = 'grayscale';

%Store histogram of kinectStream in himage
vidRes = kinectStream.VideoResolution;
f = figure('Visible','off');
imageRes = fliplr(vidRes);
subplot(1,2,1);
himage = imshow(zeros(imageRes));
axis image;
setappdata(himage,'UpdatePreviewWindowFcn',@update_livehistogram_display);

preview(kinectStream, himage)


%pause(30);

%stoppreview(kinectStream);
%delete(f);
%delete(kinectStream)
%clear kinectStream

