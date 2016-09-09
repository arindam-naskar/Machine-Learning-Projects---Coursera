function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.

% Find indices of y having values ones and zeros
one = find(y == 1);
zero = find(y == 0);

% Plot parameter values for ones and zeros
plot(X(one, 1), X(one, 2), 'k+', 'linewidth', 2, 'markerSize', 7);
plot(X(zero, 1), X(zero, 2), 'ko', 'markerFaceColor', 'y', 'markerSize', 7);

% =========================================================================



hold off;

end
