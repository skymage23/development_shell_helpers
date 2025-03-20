import sys

def Get_RepoCorruptMessage():
    return  """
Something happened to your copy of the code repository.
A file or directory that is required is missing.  You
will have to reset the repository to a previous commit. 
"""

def Write_RepoCorruptMessage():
    print(Get_RepoCorruptMessage, file=sys.stderr)