-- 限制码长（最多能输入 length_limit 个字符，超过后不再上屏）
-- 参考于：https://github.com/rime/weasel/issues/733
local function code_length_limit_processor(key, env)
  local ctx = env.engine.context
  local config = env.engine.schema.config
  -- 限制
  local length_limit = config:get_string(env.name_space) or 100
  if (length_limit ~= nil) then
      if (string.len(ctx.input) > tonumber(length_limit)) then
          -- ctx:clear()
          ctx:pop_input(1) -- 删除输入框中最后个编码字符
          return 1
      end
  end
  -- 放行
  return 2
end

return code_length_limit_processor
