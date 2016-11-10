classdef Rabbit
    properties
        name;
        weight;
    end

    methods
        function obj = Rabbit(name, weight)
            obj.name = name;
            obj.weight = weight;
        end

        function result = details(obj)
            result = sprintf('%s weighs %d Kg', obj.name, obj.weight);
        end

        function result = shoot(obj)
            if rand > 0.5
                result = 'missed!';
            else
                result = sprintf('You killed %s!', obj.name);
            end
        end

        function obj = eat(obj, numCarrots)
            obj.weight = obj.weight + numCarrots;
        end
    end
end
