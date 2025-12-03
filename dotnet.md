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

# Add References
dotnet add reference ../CommonLibrary/CommonLibrary.csproj

# Add Project to solution
dotnet sln add CommonLibrary.Tests/CommonLibrary.Tests.csproj

# Clean
dotnet clean

# Run unit tests
dotnet test

# Show sdks, runtimes, environment vars
dotnet --info 

# Beautify/Format code
dotnet format

# nuget dependencies
dotnet add package PACKAGE_NAME_HERE
dotnet remove package PACKAGE_NAME_HERE

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

# Show buildable projects types
dotnet new --list
Template Name                 Short Name                   Language      Tags
----------------------------- ---------------------------- ------------ ----------------------------------------
API Controller                apicontroller               C#            Web/ASP.NET
ASP.NET Core Empty            web                         C#,F#         Web/Empty
ASP.NET Core gRPC             grpc                        C#            Web/gRPC/API/Service
ASP.NET Core Web API          webapi                      C#,F#         Web/Web API/API/Service
ASP.NET Core Web API AOT      webapiaot                   C#            Web/Web API/API/Service
ASP.NET Core MVC              mvc                         C#,F#         Web/MVC
ASP.NET Core Web App          webapp,razor                C#            Web/MVC/Razor Pages
Avalonia .NET App             avalonia.app                C#,F#         Desktop/Xaml/Avalonia/Windows/Linux/macOS
Avalonia .NET MVVM            avalonia.mvvm               C#,F#         Desktop/Xaml/Avalonia/Windows/Linux/macOS
Avalonia Cross Platform       avalonia.xplat              C#,F#         Desktop/Xaml/Avalonia/Browser/Mobile
Avalonia Resource             avalonia.resource                         Desktop/Xaml/Avalonia/Windows/Linux/macOS
Avalonia Styles               avalonia.styles                           Desktop/Xaml/Avalonia/Windows/Linux/macOS
Avalonia Templated Control    avalonia.templatedcontrol   C#,F#         Desktop/Xaml/Avalonia/Windows/Linux/macOS
Avalonia UserControl          avalonia.usercontrol        C#,F#         Desktop/Xaml/Avalonia/Windows/Linux/macOS
Avalonia Window               avalonia.window             C#,F#         Desktop/Xaml/Avalonia/Windows/Linux/macOS
Blazor Web App                blazor                      C#            Web/Blazor/WebAssembly
Blazor WebAssembly            blazorwasm                  C#            Web/Blazor/WebAssembly/PWA
Class                         class                       C#,VB         Common
Class Library                 classlib                    C#,F#,VB      Common/Library
Console App                   console                     C#,F#,VB      Common/Console
dotnet gitignore              gitignore,.gitignore                      Config
Dotnet local tool             tool-manifest                             Config
EditorConfig file             editorconfig,.editorconfig                Config
Enum                          enum                        C#,VB         Common
global.json file              globaljson,global.json                    Config
Interface                     interface                   C#,VB         Common
MSBuild Directory             buildprops                  buildprops    MSBuild/props
MSBuild Directory             buildtargets                buildtargets  MSBuild/props
MSBuild Directory             packagesprops               packagesprops MSBuild/packages/props/CPM
MSTest Playwright             mstest-playwright           C#            Test/MSTest/Playwright/Desktop/Web
MSTest Test Class             mstest-class                C#,F#,VB      Test/MSTest
MSTest Test Project           mstest                      C#,F#,VB      Test/MSTest/Desktop/Web
MVC Controller                mvccontroller               C#            Web/ASP.NET
MVC ViewImports               viewimports                 C#            Web/ASP.NET
MVC ViewStart                 viewstart                   C#            Web/ASP.NET
NuGet Config                  nugetconfig,nuget.config                  Config
NUnit 3 Test Item             nunit-test                  C#,F#,VB      Test/NUnit
NUnit 3 Test Project          nunit                       C#,F#,VB      Test/NUnit/Desktop/Web
NUnit Playwright              nunit-playwright            C#            Test/NUnit/Playwright/Desktop/Web
Protocol Buffer               proto                                     Web/gRPC
Razor Class Library           razorclasslib               C#            Web/Razor/Library
Razor Component               razorcomponent              C#            Web/ASP.NET
Razor Page                    page                        C#            Web/ASP.NET
Razor View                    view                        C#            Web/ASP.NET
Record                        record                      C#            Common
Solution File                 sln,solution                              Solution
Struct                        struct,structure           C#,VB          Common
Uno Platform App              unoapp                      C#            Multi-platform/Uno Platform/Android/iOS/macOS/Windows/Linux/WebAssembly/WinUI
Uno Platform Class Library    unolib                      C#            Multi-platform/Uno Platform/Library/Android/iOS/Windows/macOS/Linux/WebAssembly
Uno Platform MAUI Library     unomauilib                  C#            Multi-platform/Uno Platform/Android/iOS/Windows/WinUI
Uno Platform UI Test          unoapp-uitest               C#            Multi-platform/Uno Platform/UITest/Android/iOS/macOS/WebAssembly
Web Config                    webconfig                                 Config
Worker Service                worker                      C#,F#         Common/Worker/Web
xUnit Test Project            xunit                       C#,F#,VB      Test/xUnit/Desktop/Web

# Build project, -n means name of project
dotnet new classlib -n ConfigLogging

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
