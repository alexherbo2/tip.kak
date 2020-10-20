# Save the tip paths
declare-option -hidden str tip_root_path %sh(dirname "$kak_source")
declare-option -hidden str tip_tips_path "%opt{tip_root_path}/../tips"

provide-module tip %{
  # Modules
  require-module execute-key

  define-command tip-of-the-day -docstring 'Display the tip of the day' %{
    edit -existing "%opt{tip_tips_path}/%sh(date '+%F').md"
  }

  define-command tip-browse -docstring 'Browse tips' %{
    # Edit tips
    edit! -scratch '*tips*'

    # Insert the tips
    execute-key | %{
      find "$kak_opt_tip_tips_path" -type f | sort
    }

    # Search the current day
    try %{
      execute-key / %sh{
        date '+%F'
      }
    } catch %{
      execute-keys 'gg'
    }

    # Options
    set-option buffer readonly true

    # Preview the tip under the cursor.
    hook -group tip-preview buffer NormalIdle .* %{
      tip-preview
    }

    # Mappings
    map -docstring 'Open tip' buffer normal <ret> ': tip-open<ret>'
  }

  define-command -hidden tip-select -docstring 'Select the path of the tip under the cursor' %{
    execute-keys '<space><a-x>_'
  }

  define-command -hidden tip-open -docstring 'Open the tip under the cursor' %{
    tip-select
    execute-keys 'gf'
  }

  define-command -hidden tip-preview -docstring 'Preview the tip under the cursor' %{
    tip-select
    info -title tip-preview %sh{
      cat "$kak_main_reg_dot"
    }
  }
}
