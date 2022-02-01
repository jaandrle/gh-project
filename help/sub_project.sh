echo -e "
    Show columns for given project

    USAGE
      gh project num_project [num_column [num_card]] --[FLAGS]

    EXAMPLES
      gh project 1\tprints columns for project with id 1
      gh project 1 2\tprints cards in column 1 (in project 1)
"
source $this_dir'help/flags.sh'
exit 0
