function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0;
sigma = 0;
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))

C_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_values = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

length_C = length(C_values);
length_sigma = length(sigma_values);

% Training an SVM and calculating predictions and errors
for i = 1:length_C,
    for j = 1:length_sigma,
        C_i = C_values(i);
        sigma_j = sigma_values(j);
        
        % models computation
        model = svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, sigma_j));
        
        % predictions computation;
        prediction = svmPredict(model, Xval);
        
        % error computation
        errors(i, j) = mean(double(prediction ~= yval));
        
    end;
end;

[error_min, I] = min(errors(:));
[C_index, sigma_index] = ind2sub(size(errors), I); 

C = C_values(C_index);
sigma = sigma_values(sigma_index);


% =========================================================================

end
