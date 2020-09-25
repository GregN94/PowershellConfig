function Complete {
    param($commandName, $wordToComplete, $cursorPosition)

        $completionList = [System.Collections.ArrayList]::new();

        $aspnetgen = "aspnet-codegenerator";
        if ($aspnetgen.StartsWith($wordToComplete))
        {
            $completionList.Add("aspnet-codegenerator");
        }

        [System.Collections.ArrayList]$generatedCompletions = dotnet complete --position $cursorPosition "$wordToComplete" 

        $completionList.AddRange($generatedCompletions);

        $completionList | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

Complete -commandName "dotnet" -wordToComplete "ad" -cursorPosition 6