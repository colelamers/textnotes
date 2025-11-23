# Builds debug
dotnet build

# Builds release
dotenet build --configuration Release

# Prep for deployment
dotnet publish -c Release -o ./publish

# Runtime targeting for publish
dotnet publish -c Release -r win-x64 --self-contained true

# Compile in a simplified binary including .NET so users do not need dotnet versions! Basically statically linked. 
# This publishes under the /linux-x64 (or win-x86; etc), publish/ folder.
dotnet publish -c Release -r linux-x64 --self-contained true /p:PublishSingleFile=true

# Clean
dotnet clean

# Run unit tests
dotnet test

# Show sdks, runtimes, environment vars
dotnet --info 

# Resolve nuget dependencies
dotnet restore

# Typical flow
1. dotnet restore
2. dotnet build
3. dotnet run
4. dotnet publish

# Upgrade dotnet
1. dotnet --info
2. wget https:#builds.dotnet.microsoft.com/dotnet/Sdk/...WHATEVER_VERSION_HERE
3. sudo mkdir -p /usr/share/dotnet
4. sudo tar -xzf sdk-downloaded-file -C /usr/share/dotnet
5. export PATH=$PATH:/usr/share/dotnet
6. echo 'export PATH=$PATH:/usr/share/dotnet' >> ~/.bashrc
7. source ~/.bashrc

# Show buildable projects
dotnet new --list

# Make a new viewmodel
dotnet new class -n MyViewModel -o ViewModels

# Build a new app
dotnet new avalonia.app -n MyApp
dotnet new avalonia.mvvm -n MyApp

# === Create Views ===
dotnet new avalonia.window -n MainWindow -o Views
dotnet new avalonia.usercontrol -n KUserControl -o Views

# === Create ViewModels ===
dotnet new class -n MainWindowViewModel -o ViewModels
dotnet new class -n KViewModel -o ViewModels

# === Create Models ===
dotnet new class -n SampleModel -o Models
dotnet new record -n SampleRecord -o Models
dotnet new enum -n SampleEnum -o Models

# === Compile for Linux ===
dotnet publish -c Release -r linux-x64 --self-contained true
