echo -e "
    Manipulate given card

    USAGE
      gh project num_project num_column num_card [above|below|column|view] [num_card_target|num_column_target] --[FLAGS]

      - above/below [num_card_target]: change position inside current column
        …place before/after target card ('num_card_target') – defaults to 'top'/'bottom'
      - column [num_column_target]: move to target column ('num_column_target'),
        …if no 'num_column_target' given you can input interactively
      - view: alias for 'gh issue view :id: -c', or shows note

    EXAMPLES
      gh project 1 2\tprints cards in column 1 (in project 1)
"
source $this_dir'help/flags.sh'
exit 0
