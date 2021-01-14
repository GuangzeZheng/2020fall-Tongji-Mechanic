w=0:0.01:20*pi;

n11= ((sqrt(1000^2+ 25*w.^2 )).*(sqrt( (0.229*w.^2+312.5).^2+(1.563*w).^2))) ./...
    ((sqrt((1.417*w.^2 -1000).^2+(5*w).^2)).*(sqrt( (4.999*w.^2-1000).^2+(5*w).^2))) ;
plot(w,n11)
title('H_{f,f_{T1}}(w)的幅频特性曲线')
xlabel('w/(rad/s)')
ylabel('|H_{f,f_{T1}}(w)|')


n12= (atan2(25*w,1000)+atan2(1.563*w,0.229*w.*w+312.5)-...
atan2(5*w,1000-1.417*w.*w)-atan2(5*w,1000-4.999*w.*w))*180/pi;

plot(w,n12)
title('H_{f,f_{T1}}(w)的相频特性曲线')
xlabel('w/(rad/s)')
ylabel('\theta_{f,f_{T1}}(w)')


n21=  ((sqrt(1000^2+ 25*w.^2 )).*(sqrt( (1.646*w.^2+687.5).^2+(3.438*w).^2))) ./...
    ((sqrt((1.417*w.^2 -1000).^2+(5*w).^2)).*(sqrt( (4.999*w.^2-1000).^2+(5*w).^2))) ;
plot(w,n21)
title('H_{f,f_{T2}}(w)的幅频特性曲线')
xlabel('w/(rad/s)')
ylabel('|H_{f,f_{T2}}(w)|')

n22= (atan2(25*w,1000)+atan2(3.438*w,1.646*w.*w+678.5)-...
atan2(5*w,1000-1.417*w.*w)-atan2(5*w,1000-4.999*w.*w))*180/pi;

plot(w,n22)
title('H_{f,f_{T2}}(w)的相频特性曲线')
xlabel('w/(rad/s)')
ylabel('\theta_{f,f_{T2}}(w)')


n31= (sqrt(1000^2+ 25*w.^2 )) ./...
    (sqrt( (4.999*w.^2-1000).^2+(5*w).^2)) ;
plot(w,n31)
title('H_{f,f_{Ts}}(w)的幅频特性曲线')
xlabel('w/(rad/s)')
ylabel('|H_{f,f_{Ts}}(w)|')

n32= (atan2(25*w,1000)-atan2(5*w,1000-4.999*w.*w))*180/pi;

plot(w,n32)
title('H_{f,f_{Ts}}(w)的相频特性曲线')
xlabel('w/(rad/s)')
ylabel('\theta_{f,f_{Ts}}(w)')

