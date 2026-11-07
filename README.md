# GAMS optimization exercises

Four compact models from my operations-research coursework. I kept the original formulations mostly as written and added this README so the purpose of each file is clear.

## Models

- `LA_project.gms` — a two-stage transportation model from factories to inventories and then to shops.
- `q1.gms` — workforce scheduling across eight time periods.
- `q2.gms` — a six-period production-planning model with inventory, regular time, overtime, and hiring.
- `q3-sa.gms` — a small sensitivity loop for the transportation model that records solutions as one inventory capacity changes.

## Running a model

With GAMS installed:

```text
gams models/q1.gms
```

The examples use small data tables embedded in each file. They are educational models, so the numbers are illustrative rather than taken from a real company.

## Notes

The models are useful for reading and experimentation, but they have not been packaged as a general-purpose library. Some names and comments retain the straightforward style of the original course submission.

