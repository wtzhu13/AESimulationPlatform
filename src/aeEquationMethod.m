function nextUs = aeEquationMethod(target)
% aeEquationMethod.m    The kernel AE algorithm
%   Input:
%       target    The target Lu     
%   Output:
%       nextUs    The exposure time of next frame
%   Instructions:
%       author:     wtzhu
%       e-mail:     wtzhu_13@163.com
% Last Modified by wtzhu v1.0 2021-06-05
% Algorithm is borrowed from patent whose patent application number is
% 200410102536.0
% y = -1420*x^ (-0.1689) + 471.4;
us = int32(solve(sprintf('%d = -1420*x^ (-0.1689) + 471.4', target), 'x'));
if rem(us, 10) < 5
    us = 10 * fix(us / 10);
else
    us = 10 * (fix(us / 10) + 1);
end
nextUs = us;

