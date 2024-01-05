function create()
  vim.ui.input({ prompt = "Would you like to create a Java project: (Y/n) " }, function(input)
    if input == nil then
      return
    end

    if not string.find(input, "y") then
      return
    end

    local handle = io.popen("mvn archetype:generate -DgroupId=me.ma1de -DartifactId=App -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false")

    if handle == nil then
      return
    end

    local result = handle:read("*a")
    handle:close()

    print(result)
  end)
end

vim.keymap.set('n', '<leader>jcp', create)
