# csproj Version Reader GitHub action

Reads the version tag from [ a .NET Core csproj file](https://docs.microsoft.com/en-us/dotnet/core/tools/csproj).

## Usage

You must provide the relative file path to the csproj file from the repository root.
The version is stored in the output variable: version

Use `${{ steps.read-version.outputs.version }}` to access the variable.

```
name: Read version from csproj file
on: [push]
jobs:
  get-version:
    name: Read version
    runs-on: ubuntu-latest
      - name: Read version
        id: read-version
        uses: yaos/csproj-version-reader@master
        with:
          FilePath: ./example.csproj
      - name: Create tag and GitHub release
        id: create_tag_and_release
        uses: actions/create-release@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          tag_name: v${{ steps.read-version.outputs.version }}
          release_name: v${{ steps.read-version.outputs.version }}
          draft: false
          prerelease: false
          
```
