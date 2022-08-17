colorlab.enter

for shape = {'circle'}
    figure('Name',shape{:})
    for scheme = {'tab20','tab20c','Set2'}
        target = [randi(20),randi(20)];
        powder = get_palette(scheme{:});
        boom(target,powder,shape{:})
    end
end

function boom(point,powder,shape)
    for j = 1:10
        for i=1:1000
            switch shape
                case 'circle'
                    x(i) = randn();
                    y(i) = randn();
                case 'square'
                    x(i) = rand();
                    y(i) = rand();
                case 'noname'
                    x(i) = clipgauss();
                    y(i) = clipgauss();
                otherwise
                    error('undefined shape!')     
            end
        end
        hold on
        color = powder(j,:);
        scatter(x+point(1),y+point(2),[],color,'filled');
    end
    axis equal off
    set(gcf,'Color','k')
end
% Experimental
function tensor = clipgauss(varargin)
    % Generate Gaussian
    tensor = randn(varargin{:});
    % Only Potivie Axis
    tensor = abs(tensor);
    % Clip Inside Unit Circle
    tensor(tensor > 1) = rand;
end