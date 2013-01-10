%MINUS Mapping overload

function c = minus(a,b)
		prtrace(mfilename,2);
sa = size(a);
sb = size(b);
if any(sa ~= sb)
		error('Mappings should have equal size')
end
if ~isa(a,'mapping') % can this happen?
	c = -b+a;  % so we need uminus
	return
end

if ~isaffine(a) | (isa(b,'mapping') & ~isaffine(b))
	if isa(b,'double')
		b = affine(b);
	end
	k = size(a,2);
	w = dyadicm([],1,-1,k);
	w.size_in = 2*k;
 	if isuntrained(a)
 		w.mapping_type = 'combiner';
 	end
	c = [a b]*w;
	c.labels = a.labels;
elseif isa(b,'mapping')
	c = a;
	c.data.rot = c.data.rot - b.data.rot;
	c.data.offset = c.data.offset - b.data.offset;
elseif isa(b,'double')
	c = a;
	if length(b) == 1
		c.data.offset = c.data.offset - b;
	elseif all(size(b) == size(c.data.offset))
		c.data.offset = c.data.offset - b;
	elseif any(size(b) ~= size(c.data.rot))
		error('Mappings should have equal size')
	else
		c.data.rot = c.data.rot - b;
	end
end
return
