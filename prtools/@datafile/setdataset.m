%SETDATASET Set DATASET datafile field

% Copyright: R.P.W. Duin, r.p.w.duin@prtools.org
% Faculty EWI, Delft University of Technology
% P.O. Box 5031, 2600 GA Delft, The Netherlands

function a = setdataset(a,s)

	prtrace(mfilename,2);
  
	isdataset(s);
  a.dataset = s;
  
 return
