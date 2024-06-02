

-- 日期时间
-- 提高权重的原因：因为在方案中设置了大于 1 的 initial_quality，导致 rq sj xq dt ts 产出的候选项在所有词语的最后。
local function calendar(input, seg, env)
    if not env.date then
		local config = env.engine.schema.config
		env.name_space = env.name_space:gsub("^*", "")
        env.date = config:get_string(env.name_space .. "/date") or "rq"
        env.time = config:get_string(env.name_space .. "/time") or "sj"
        env.week = config:get_string(env.name_space .. "/week") or "xq"
        env.datetime = config:get_string(env.name_space .. "/datetime") or "dt"
        env.timestamp = config:get_string(env.name_space .. "/timestamp") or "ts"
    end

    -- 日期
    if (input == env.date) then
        local cand = Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "")
        cand.quality = 100
        yield(cand)
        local cand = Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), "")
        cand.quality = 100
        yield(cand)
        local cand = Candidate("date", seg.start, seg._end, os.date("%Y.%m.%d"), "")
        cand.quality = 100
        yield(cand)
        local cand = Candidate("date", seg.start, seg._end, os.date("%Y 年 " .. tostring(tonumber(os.date("%m"))) .. " 月 " .. tostring(tonumber(os.date("%m"))) .. " 日"), "")
        cand.quality = 100
        yield(cand)
    end
    -- 时间
    if (input == env.time) then
        local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M"), "")
        cand.quality = 100
        yield(cand)
        local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), "")
        cand.quality = 100
        yield(cand)
    end
    -- 星期
    if (input == env.week) then
        local weakTab = {'日', '一', '二', '三', '四', '五', '六'}
        local cand = Candidate("week", seg.start, seg._end, "星期" .. weakTab[tonumber(os.date("%w") + 1)], "")
        cand.quality = 100
        yield(cand)
        local cand = Candidate("week", seg.start, seg._end, "礼拜" .. weakTab[tonumber(os.date("%w") + 1)], "")
        cand.quality = 100
        yield(cand)
        local cand = Candidate("week", seg.start, seg._end, "周" .. weakTab[tonumber(os.date("%w") + 1)], "")
        cand.quality = 100
        yield(cand)
    end
    -- ISO 8601/RFC 3339 的时间格式 （固定东八区）（示例 2022-01-07T20:42:51+08:00）
    if (input == env.datetime) then
        local cand = Candidate("datetime", seg.start, seg._end, os.date("%Y-%m-%dT%H:%M:%S+08:00"), "")
        cand.quality = 100
        yield(cand)
        local cand = Candidate("time", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), "")
        cand.quality = 100
        yield(cand)
    end
    -- 时间戳（十位数，到秒，示例 1650861664）
    if (input == env.timestamp) then
        local cand = Candidate("datetime", seg.start, seg._end, os.time(), "")
        cand.quality = 100
        yield(cand)
    end

    -- if (input == "date") then
    --     --- Candidate(type, start, end, text, comment)
    --     yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
    --     yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
    --     yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), ""))
    -- end
    -- if (input == "time") then
    --     --- Candidate(type, start, end, text, comment)
    --     yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
    --     yield(Candidate("time", seg.start, seg._end, os.date("%H%M%S"), ""))
    -- end
    -- if (input == "datetime") then
    --     --- Candidate(type, start, end, text, comment)
    --     yield(Candidate("datetime", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), ""))
    --     yield(Candidate("datetime", seg.start, seg._end, os.date("%Y-%m-%dT%H:%M:%S+08:00"), ""))
    --     yield(Candidate("datetime", seg.start, seg._end, os.date("%Y%m%d%H%M"), ""))
    -- end

    -- -- @JiandanDream
    -- -- https://github.com/KyleBing/rime-wubi86-jidian/issues/54

    -- if (input == "week") then
    --     local weakTab = {'日', '一', '二', '三', '四', '五', '六'}
    --     yield(Candidate("week", seg.start, seg._end, "周" .. weakTab[tonumber(os.date("%w") + 1)], ""))
    --     yield(Candidate("week", seg.start, seg._end, "星期" .. weakTab[tonumber(os.date("%w") + 1)], ""))
    -- end

    -- -- 输入月份英文
    -- if (input == "month") then
    --     yield(Candidate("month", seg.start, seg._end, os.date("%B"), ""))
    --     yield(Candidate("month", seg.start, seg._end, os.date("%b"), "缩写"))
    -- end

    -- 输出内存
	-- if input == "gccount" then
	-- 	local cand = Candidate("date", seg.start, seg._end, ("%.f"):format(collectgarbage('count')), "")
	-- 	cand.quality = 100
	-- 	yield(cand)
	-- end
    -- if input == "xxx" then
    --     collectgarbage()
    --     local cand = Candidate("date", seg.start, seg._end, "collectgarbage()", "")
    --     cand.quality = 100
    --     yield(cand)
    -- end
end

return calendar

-- function date_translator(input, seg)

--     -- 日期格式说明：

--     -- %a	abbreviated weekday name (e.g., Wed)
--     -- %A	full weekday name (e.g., Wednesday)
--     -- %b	abbreviated month name (e.g., Sep)
--     -- %B	full month name (e.g., September)
--     -- %c	date and time (e.g., 09/16/98 23:48:10)
--     -- %d	day of the month (16) [01-31]
--     -- %H	hour, using a 24-hour clock (23) [00-23]
--     -- %I	hour, using a 12-hour clock (11) [01-12]
--     -- %M	minute (48) [00-59]
--     -- %m	month (09) [01-12]
--     -- %p	either "am" or "pm" (pm)
--     -- %S	second (10) [00-61]
--     -- %w	weekday (3) [0-6 = Sunday-Saturday]
--     -- %x	date (e.g., 09/16/98)
--     -- %X	time (e.g., 23:48:10)
--     -- %Y	full year (1998)
--     -- %y	two-digit year (98) [00-99]
--     -- %%	the character `%´

--     -- 输入完整日期
--     if (input == "datetime") then
--         yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d %H:%M:%S"), ""))
--     end

--     -- 输入日期
--     if (input == "date") then
--         --- Candidate(type, start, end, text, comment)
--         yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
--         yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
--         yield(Candidate("date", seg.start, seg._end, os.date("%Y.%m.%d"), ""))
--         yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
--         yield(Candidate("date", seg.start, seg._end, os.date("%m-%d-%Y"), ""))
--     end

--     -- 输入时间
--     if (input == "time") then
--         --- Candidate(type, start, end, text, comment)
--         yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
--         yield(Candidate("time", seg.start, seg._end, os.date("%Y%m%d%H%M%S"), ""))
--         yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
--     end

--     -- 输入星期
--     -- -- @JiandanDream
--     -- -- https://github.com/KyleBing/rime-wubi86-jidian/issues/54
--     if (input == "week") then
--         local weakTab = {'日', '一', '二', '三', '四', '五', '六'}
--         yield(Candidate("week", seg.start, seg._end, "周"..weakTab[tonumber(os.date("%w")+1)], ""))
--         yield(Candidate("week", seg.start, seg._end, "星期"..weakTab[tonumber(os.date("%w")+1)], ""))
--         yield(Candidate("week", seg.start, seg._end, os.date("%A"), ""))
--         yield(Candidate("week", seg.start, seg._end, os.date("%a"), "缩写"))
--     end

--     -- 输入月份英文
--     if (input == "month") then
--         yield(Candidate("month", seg.start, seg._end, os.date("%B"), ""))
--         yield(Candidate("month", seg.start, seg._end, os.date("%b"), "缩写"))
--     end
-- end



-- function date_translator(input, seg)
--     if (input == "rq") then
--         --- Candidate(type, start, end, text, comment)
--         yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
--         yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
--         yield(Candidate("date", seg.start, seg._end, os.date("%m-%d"), ""))
--         yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
--     end
--     if (input == "sj") then
--         --- Candidate(type, start, end, text, comment)
--         yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
--         yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
--     end
--     if (input == "xq") then
--         local weakTab = {'日', '一', '二', '三', '四', '五', '六'}
--         yield(Candidate("week", seg.start, seg._end, "周"..weakTab[tonumber(os.date("%w")+1)], ""))
--         yield(Candidate("week", seg.start, seg._end, "星期"..weakTab[tonumber(os.date("%w")+1)], ""))
--         yield(Candidate("week", seg.start, seg._end, "礼拜"..weakTab[tonumber(os.date("%w")+1)], ""))
--     end
-- end
