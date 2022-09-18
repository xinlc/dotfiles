-------------------------------------------------------------
-- 因为英文方案的 initial_quality 大于 1，导致输入「va」时，候选项是「van vain。。。」
-- 单字优先，候选项应改为「ā á ǎ à」
--
-- 不知道这个方法为什么不行啊？？？
-- function v_single_char_first_filter(input)
--     if (string.find(input, "v") == 1 and string.len(input) == 2) then
--         local l = {}
--         for cand in input:iter() do
--             if (utf8.len(cand.text) == 1) then
--                 yield(cand)
--             else
--                 table.insert(l, cand)
--             end
--         end
--         for cand in ipairs(l) do
--             yield(cand)
--         end
--     end
-- end
--
-- 反正是解决了，不知道怎么就解决了，就是最后多一个候选项，没多大影响。
local function single_char_first_filter(input, seg)
    if (string.find(input, "v") == 1 and string.len(input) == 2) then
        yield(Candidate("", seg.start, seg._end, "", ""))
    end
end
-------------------------------------------------------------

return single_char_first_filter
