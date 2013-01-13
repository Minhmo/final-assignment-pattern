for(i=250:1000)
    i
    figure(1);
    show(data2im(a(i)));
    figure(2);
    show(cleanUp(data2im(a(i))));
    pause(0.3);
end