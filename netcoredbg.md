# Run debugger on a compiled binary
netcoredbg --interpreter=cli -- dotnet ~/apps/GetStartedApp/bin/Debug/net9.0/GetStartedApp.dll

# Add ability for sources to be viewed for debugging in *.csproj of app
	..
    <EmbedAllSources>true</EmbedAllSources>
  </PropertyGroup>

# Run
r

# Continue from breakpoint
c

# Print variable
print varName

# Set breakpoint on file and line 10
ncdb> b MainWindow.axaml.cs:10

