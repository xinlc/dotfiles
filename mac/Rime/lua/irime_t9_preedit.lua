-- iRime 九宫格专用，将输入框的数字转为对应的拼音或英文
local function irime_t9_preedit(input, env)
  for cand in input:iter() do
      if (string.find(cand.text, "%w+") ~= nil) then
          cand:get_genuine().preedit = cand.text
      else
          cand:get_genuine().preedit = cand.comment
      end
      yield(cand)
  end
end

return irime_t9_preedit
