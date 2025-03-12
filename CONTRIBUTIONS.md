Contributions from other developers are most welcome, but we have some rules that must be followed.

1. Use PowerShell naming conventions for all variable, function, and class names wherever possible.
    -- -- If this cannot be done due to the syntax or enforced naming conventions of another shell,
          then do the best you can to match PowerShell style and then in the API listing in the "
          api-list.txt" file, next to your API name, put the associated "PowerShell-style" name
          next to it in parentheses.

2. Never expect that a user can call class methods. Many shells do not support classes.
   All APIs must either be global variables, functions, structs, or strings. No exceptions.

3. All structs used must have associated getter/setter functions for the API.

4. Never assume that the user can easily access struct attributes directly.
   That simply is not possible for most shells. All attribute access must be
   through explicitly declared APIs.

5. Whenever you make a new API or implement an existing one for another shell,
   add it to the main "api-list.txt" file. Any and all exceptions must be discussed
   in the forum, and you must provide an explicit and detailed reason on why
   you need to do this. If this project's maintainers agree with your
   reasoning, you will be granted an exception.

    -- -- Example of an allowed API: A function needed to work around OS-related
          weirdness that is isolated to a particular shell only.
    
    -- -- If you are given permission to add such an API, you must document
          it in the "api-list.txt" file under the appropriate subdirectory.
          If it is something that is universal for the shell in question
          across all supported OSs, put it in the "api-list.txt" file inside
          that shell's "Universal" subdirectory.

    -- -- If it is specific to certain OSs, for each affected OS, add the API
          to the "api-list.txt" file in that OS's subdirectory under the
          directory of the shell in question.

6. Do not return strings directly whenever possible. Instead, use 
   structs.

7. All structs and their APIs must be defined in their own shell
   script file under the appropriate subdirectory. Structs that
   are universal in nature go in the "Universal/datatype" directory
   for each shell where APIs that require these structs are
   implemented.  OS-specific APIs do under the "datatype" subdirectory
   of the OS's own subdirectory under the shell in question.

8. For all API files, struct definition files included, use include guards.
   How you do this is shell dependent:
   
   -- --For Bash, use:

   if [ "$<include-file-path-here>" != "" ]; then
       return
   fi

   export <include-file-path-here>=1


   -- --For PowerShell, use:
   
   if($<include-file-path-here>) {
       return
   }
   $<include-file-path-here> = $true

   -- -- "<include-file-path-here>" is the path to the file to be imported with the delimiters
   removed and in Camel Case. If this simply cannot be done due to shell syntax restrictions,
   then, in a comment above the include guard, put the filepath to the include file relative
   to the project base directory, delimiters and all.

   -- -- Include guards are not required for Python scripts because Python caches modules by default,
         and module source code is parsed only once (preserving module-local variables) 
         unless the module is explicitly unloaded.

   9. When adding support for a new shell (thanks, by the way), in the project base directory,
      add a new directory for that shell, the "Universal" subdirectory for that shell, placed
      within said shell's newly created directory, and the "api-list.txt" file for said
      "Universal" subdirectory. The "api-list.txt" file is allowed to be blank. That is
      fine for the first commit for a new shell.

   10. All PowerShell import files must be "psm1" modules with
       the API functions properly exported using "Export-ModuleName"

       --For readability, the "Export-ModuleName" line to 
         export an API function must be placed directly below
         the function definition.

   11. Some APIs are shell-specific, and that is OK.
       For these, add them under the shell's
       "Specific" subdirectory, and add the API
       listing to the "api-list.txt" file located there.
   
   12. If something is both shell-specific and OS-specific,
       then place the import file under the "Specific" directory
       under the OS subdirectory, itself under the shell's
       directory.  Again, don't forget to add the API listing
       to the "api-list.txt" file in said "Specific" directory.


More rules may be added in the future, but for now, this it.