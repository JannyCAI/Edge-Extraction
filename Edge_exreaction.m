%% 初始化
clc;clear;

%% 获取原视频帧数据
path='D:\2.mp4';   %原视频存放路径
obji=VideoReader(path);
num=obji.NumberOfFrames; %获取视频帧数
disp(['总图片帧数为：',num2str(num)])

%% 创建视频对象并打开
Wobj=VideoWriter('D:\2_p.mp4', 'MPEG-4');   
%输出视频，mp4格式合成的视频较小，如果想更高清可以改为avi格式，只需将'MPEG-4'改为'Uncompressed AVI'
open(Wobj);

%% 对每一帧进行边缘检测并保存到视频对象中
for i=1:num
  frame=read(obji,i);
  f=rgb2gray(frame);
  roberts=edge(f,'roberts');  %roberts算子边缘检测
  %也可将'roberts'修改为'roberts','Sobel'、'Prewitt'、'LOG'或'Canny'，尝试不同的算子
  Img = mat2gray(1-roberts);
  imshow(Img)
  writeVideo(Wobj,Img);  
  if (rem(i,100) == 0)
    disp(['****************',num2str(i),'****************'])
  end
end 

%% 关闭视频对象，并提示完成
close(Wobj);
disp('已完成')
