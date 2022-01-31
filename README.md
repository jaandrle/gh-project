# gh-project
GitHub cli extension to see projects and moving cards

ℹ️ contributions welcome

A [GitHub CLI](https://cli.github.com/) extension to work with projects.

## Installation

Make sure you have at least version 2 of the GitHub CLI installed. Internaly use [jq](https://stedolan.github.io/jq/).

Install this extension with:
```bash
gh extension install jaandrle/gh-project
```

## Synopsis
- basic
  ```text
      Work with GitHub Projects

      USAGE
        gh project [num_project [num_column [num_card]]] --[FLAGS]

      EXAMPLES
        gh project  prints projects list in current repo
        gh project 1  prints columns for project with id 1
        gh project 1 2  prints cards in column 1 (in project 1)
        
    FLAGS
      help  show help for “current level” (projects, columns, cards list, …)

  ```
- moving cards
  ```text
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
        
      FLAGS
        help  show help for “current level” (projects, columns, cards list, …)
  ```
  
## Examples
```bash
gh project
# NUM     NAME    DESCRIPTION
# 6       Crossversion
# 19      v2.3.Sx Sprint 12

gh project 19
# Project 'v2.3.Sx'
# NUM     NAME
# 0       To do
# 1       In progress
# 2       Testing & Integration
# 3       Ready to next stage

gh project 19 0
# Project 'v2.3.Sx' → Column 'To do'
# NUM     ISSUE   TITLE/NOTE
# 0       405     Search functionality disappeared from Staffing and FR 
# 1       397     Vytvoření a nasazení nové generace ikon (FontAwesome → SVGIcon)
# 2       382     Relikty po v2.1.Sx
# 3       410     Relikty po v2.3.Sx
# 4       null    ??? (historické)        Nataliya Kuhle: `var_dump(html_entity_decode("Internal ToDo’s &# 58;"));`
# 5       null    ###### Automation Rules         - `demilestoned_issue`  - `new_issue`

gh project 19 0 0 below
# now 5
gh project 19 0 5 above 1
# now 1 (1 → 2, 2 → 3, …)
gh project 19 0 1 column 1
# under 'In progress' column as first
gh project 19 1 0 view
# view issue, or note content
```
