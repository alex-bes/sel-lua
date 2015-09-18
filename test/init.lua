local sel = require "../sel/init"
require 'busted.runner'()

describe('Basic capabilities', function()
    local evaluator
    before_each(function()
        evaluator = sel.createDefaultEvaluator()
    end)

    it('should return original string if there are no any expressions', function()
        local res = evaluator.evaluate('some test string');
        assert.are.same(res, 'some test string')
    end);
end)
