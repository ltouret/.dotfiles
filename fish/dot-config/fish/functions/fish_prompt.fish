function fish_prompt --description 'Informative prompt'
    # Save the return status of the previous command
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)

    # Guard against fish_color_status being unset
    set -q fish_color_status; or set -g fish_color_status red

    # Root gets a different cwd color and a '#' suffix
    set -l color_cwd $fish_color_cwd
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        set -q fish_color_cwd_root; and set color_cwd $fish_color_cwd_root
        set suffix '#'
    end

    # Dim the status if it was carried over rather than freshly produced
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    test $__fish_prompt_status_generation = $status_generation; and set bold_flag
    set __fish_prompt_status_generation $status_generation

    set -l pipestatus_string (__fish_print_pipestatus "[" "]" "|" \
        (set_color $fish_color_status) (set_color $bold_flag $fish_color_status) \
        $last_pipestatus)

    echo -n -s "[" (date "+%H:%M:%S") "] " \
        (set_color brblue) $USER " " \
        (set_color $color_cwd) (prompt_pwd) $normal \
        (fish_git_prompt) $normal \
        " "$pipestatus_string $suffix " "
end