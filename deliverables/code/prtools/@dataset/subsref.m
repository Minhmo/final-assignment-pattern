%SUBSREF Subscripted reference. Dataset overload
%
% 
% $Id: subsref.m,v 1.20 2010/06/01 08:47:05 duin Exp $

function c = subsref(a,s)

  prtrace(mfilename,2);
	
  %RD Several precautions are needed to allow for subsref to 
  %datafile constructs. In this case the data field is empty 
  %and the featsize may be undefined.
    
  if strcmp(s(1).type,'.') % c = a.data type of reference
	  c = get(a,s(1).subs);
	  if length(s) > 1
		  c = subsref(c,s(2:end));
	  end
	  return
  end
 
  if isempty(s.subs{1}) | (length(s.subs)>1 & (isempty(s.subs{2}) | ...
			all(s.subs{1} == false) | all(s.subs{2} == false)))
	  c = dataset([]);
	  return
  end

  if length(s.subs) == 1  
	  if strcmp(s.subs{1},':')     % c = a(:)
		  c = a.data(:);
	  else
		  c = a.data(s.subs{1});     % c = a(sub)
	  end
  else                           % c = a(row,col)
	  [m,k] = size(a);
	  c = a;
	  if strcmp(s.subs{1},':')
		  row = [1:m]; keep_row_size = 1;
	  else
		  row = s.subs{1}; keep_row_size = 0;
	  end
	  if strcmp(s.subs{2},':')
		  col = [1:k]; keep_feat_size = 1;
	  else
		  col = s.subs{2};  keep_feat_size = 0;
		  %DXD: here I introduce the possibility to use named indices,
		  % i.e. instead of numeric indices we can use the feature
		  % names.
		  if ~isa(col,'double')
			  col = findfeatlab(a,col);
			  if any(col==0)
				  error('Some features cannot be found.');
			  end
		  end
	  end
		if islogical(row), row = find(row); end
		if islogical(col), col = find(col); end
		
	  row = row(:); % needed to solve strange programming in REPMAT
	  col = col(:); % needed to solve strange programming in REPMAT
    if ~isempty(a.data) % needed for datafile construct
	    c.data = a.data(row,col);
    else
      c.data = [];
    end
%	  c.ident = a.ident(row,:);
    ident = getident(a,'',row);
    c.ident = ident;
	  %DXD in some unfortunate situations the feature labels may not have
	  %been defined. Be resistant against that and fill in the labels with
	  %the selected feature numbers:
		
	  if ~isempty(a.featlab)
		  c.featlab = a.featlab(col,:);
%     elseif ~isempty(col) & ~isempty(a.data)
% 		  c.featlab = col;
	  end
    if ~isempty(col) & ~isempty(a.featdom)
	    c.featdom = a.featdom(col);
    end
    if ~isempty(a.targets)
	    c.targets = a.targets(row,:);
    end
    if ~isempty(a.nlab)
	    c.nlab = a.nlab(row,:);
    end
	  c.prior = a.prior;
    if ~isempty(c.data)
	    [c.objsize,c.featsize] = size(c.data);
    else
      if ~isempty(row)
        c.objsize = length(row);
      end
      if ~isempty(col)
        c.featsize = length(col);
      end
    end
	  if keep_row_size, c.objsize = a.objsize; end
	  if keep_feat_size, c.featsize = a.featsize; end
  end
return