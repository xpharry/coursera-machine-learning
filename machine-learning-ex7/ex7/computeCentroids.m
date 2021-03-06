function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

counts = zeros(K, 1);
for i = 1 : m
    % for each example
    centroids(idx(i), :) = centroids(idx(i), :) + X(i, :);
    counts(idx(i)) = counts(idx(i)) + 1;
end

for k = 1 : K
    centroids(k, :) = centroids(k, :) / counts(k);
end

% concised version
% for k = 1:K
%     c_k = (idx == k); % equal: 1, else: 0
%     n_k = sum(c_k); % number of examples for each centroid
%     c_k_matrix = repmat(c_k, 1, n); % for the following operation
%     X_k = X .* c_k_matrix; % remain the example in the cluster
%     centroids(k,:) = sum(X_k) ./ n_k;
% end

% =============================================================

end
