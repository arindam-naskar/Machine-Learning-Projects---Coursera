function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.

% Adding the 'bias' column and finding the activations in the hidden layer
X = [ones(m, 1) X];
layer2_activations = sigmoid(X * Theta1');

% Adding the 'bias' column and finding the output
layer2_activations = [ones(size(layer2_activations, 1), 1) layer2_activations];
output = sigmoid(layer2_activations * Theta2');
output = output';

% Finding of the indices with max element 
[max_output , I] = max(output);

% Assigning the prediction to p
p = I';


% =========================================================================


end
