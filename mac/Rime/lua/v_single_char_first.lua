-- v 模式，单个字符优先
-- 因为设置了英文翻译器的 initial_quality 大于 1，导致输入「va」时，候选项是「van vain …… ā á ǎ à」
-- 把候选项应改为「ā á ǎ à …… van vain」，让单个字符的排在前面
local function v_single_char_first(input, env)
    local code = env.engine.context.input -- 当前编码
    local l = {}
    for cand in input:iter() do
        if (cand.text == "Vs.") then -- 特殊情况处理
            yield(cand)
        end
        -- 以 v 开头、2 个长度的编码、候选项为单个字符的，提到前面来。
        if (string.len(code) == 2 and string.find(code, "v") == 1 and utf8.len(cand.text) == 1) then
            yield(cand)
        else
            table.insert(l, cand)
        end
    end
    for i, cand in ipairs(l) do
        yield(cand)
    end
end

return v_single_char_first
