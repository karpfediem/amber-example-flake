{...} : {
    pre-commit = {
        check.enable = false;
        settings = {
            hooks = {
                compile-amber = {
                    enable = true;
                    name = "compile-amber";
                    description = "Compile all amber scripts found in the source directory";
                    files = "amber/.*.ab";
                    entry = "nix/pre-commit/compile-amber.sh";
                };
            };
        };
    };

}