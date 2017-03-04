function [labels, names] = classifyCategories(inputData)
   names = unique(inputData);
   labels = zeros(height(inputData), length(names));
   for i = 1:height(names)
       labels(strcmp(inputData,names(i)), i) = 1;
   end
end