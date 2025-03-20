import development_shell_helpers.imports.Python3.Universal.repo_utils as repo_utils

class RepoCorruptError(Exception):
    def __init__(self):
        super().__init__(repo_utils.Get_RepoCorruptMessage())