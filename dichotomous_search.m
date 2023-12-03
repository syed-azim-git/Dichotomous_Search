% Function to Maximize (Only Unimodal Function)
f = @(x) 4*sin(x)*(1 + cos(x));

% Plot
fplot(f,[-1,7],'b', LineWidth=2);
hold on; grid on;
title('Plot of f(x)');
xlabel('x'); ylabel('f(x)');

% Initiation
a = 0;
b = pi/2;
epsilon = 0.2;
stop = 0.5;

% Dichotomous search algorithm
dichotomous_search(f, a, b, epsilon,stop);

function dichotomous_search(f, a, b, epsilon, stop)

    i = 1; %number of iterations
    while (abs(a - b) > stop)

        x1 = (a + b - epsilon) / 2;
        x2 = (a + b + epsilon) / 2;

        if f(x1) > f(x2)
            b = x2;
        else
            a = x1;
        end
        
        disp([num2str(i) ': ' num2str(x1) ' , ' num2str(x2)]); % x1, x2 Values
        disp(['   {' num2str(f(x1)) ' , ' num2str(f(x2)) '}']); % x1 x2 function values
        disp(['   [', num2str(a) ' , ' num2str(b) ']']); % New intervals 
        scatter([a, b], [f(a), f(b)], LineWidth=2); %Plot new interval

        i = i + 1; %Increment Interation
    end

    % Maximum value 
    x_max = (a + b) / 2;

    % Display result
    disp(['Minimum: (', num2str(x_max) ',' num2str(f(x_max)) ')']);
    stem(x_max, f(x_max), LineWidth=2);hold off;
end
