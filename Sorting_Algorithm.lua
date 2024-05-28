local QuickSort do
    local function InsertionSort(Table, Low, High)
        for Index = Low + 1, High do
            local Key, Init = Table[Index], Index - 1;

            while Init >= Low and Table[Init] > Key do
                Table[Index] = Table[Init];
                Init -= 1;
            end;
            
            Table[Index] = Key;
        end;
    end;

    local function Partition(Table, Low, High)
        local Mid = math.floor((Low + High) / 2)

        if Table[Low] > Table[Mid]  then Table[Low], Table[Mid]  = Table[Mid],  Table[Low]; end;
        if Table[Low] > Table[High] then Table[Low], Table[High] = Table[High], Table[Low]; end;
        if Table[Mid] > Table[High] then Table[Mid], Table[High] = Table[High], Table[Mid]; end;

        while true do
            while Table[Low]  < Table[Mid] do Low  += 1; end;
            while Table[High] > Table[Mid] do High -= 1; end;

            if Low >= High then return High; end;

            Table[Low], Table[High] = Table[High], Table[Low];
            Low += 1;
            High -= 1;
        end;
    end;

    local function Sort(Table, Low, High)
        while Low < High do
            if High - Low < 10 then
                InsertionSort(Table, Low, High)
                break
            else
                local Part = Partition(Table, Low, High)

                if Part - Low < High - Part then
                    Sort(Table, Low, Part)
                    Low = Part + 1;
                else
                    Sort(Table, Part + 1, High)
                    High = Part;
                end;
            end;
        end;
    end;

    QuickSort = function(Table)
        Sort(Table, 1, #Table)
    end;
end;

return QuickSort;

-- local Array = {};
-- print("Generating Tables...")
-- for i = 0,10000000 do
--     Array[i] = math.random(1,10000000);
-- end;

-- print("Sorting...")
-- local T = os.time()

-- QuickSort(Array)

-- print("Sorted! Took:", os.time()-T .. "s")
-- print(table.concat(arr, ","))
