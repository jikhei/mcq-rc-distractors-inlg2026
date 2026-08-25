# Compile SFT Outputs

Use `prep-output.ipynb` to integrate the generated data. Place the generated `output.json` files in the working directory before running the notebook.

More information is provided within the notebook.

## `763_*_distractors.xlsx`

Data from all `.json` files, without filtering, annotation, or modification.

## `486_*_distractors.xlsx`

The last generation for each question.

The prefix `rematch_` indicates further cleaning based on the corresponding column without `rematch_`. See `prep-output.ipynb` for details.

- Column `comment`
  - M: modified; if `rematch_distractor` extracts nothing, the distractor is manually extracted from `distractor` (N = 12 in the current dataset)
  - Q: validity is questionable because the annotator is unsure
  - Q-[A,B,C,D]: validity is questionable because the annotator believes the distractor belongs to another type
  - X: does not fit the question


