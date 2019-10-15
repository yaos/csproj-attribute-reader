# csproj Attribute Reader GitHub action

Reads the version tag from [ a .NET Core csproj file](https://docs.microsoft.com/en-us/dotnet/core/tools/csproj).

## Usage

You must provide the relative file path to the csproj file from the repository root.

```
name: Read version from csproj file
on: [push]
jobs:
  get-version:
    name: Read version
    runs-on: ubuntu-latest
      - name: Read version
        id: read-version
        uses: yaos/version-reader@master
        with:
          FilePath: ./example.csproj
          
```
