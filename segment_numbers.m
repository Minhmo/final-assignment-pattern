function out = segment_numbers(im,sr,sc,jr,jc,r,c)
out = {{}};
k = 1;
pr = sr;
for i = 1:r
    pc = sc;
    for j = 1:c
        sub = im(pr:(pr+jr),pc:(pc+jc));
        out{i, j}=sub;
        k=k+1;
        pc = pc + jc;
    end
    pr = pr + jr;
end

%subImage = fullImage(row1:row2, column1:column2);

end