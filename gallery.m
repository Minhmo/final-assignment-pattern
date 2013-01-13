for(i=1:100)
    i
    figure(1);
    show(data2im(a(i)));
    figure(2);
    show(cleanUp(data2im(a(i))));
    pause(0.3);
end