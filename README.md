# Music Recommendation System with Graph Neural Networks (GNNs)

Graduate project for **CMPE 252 – Artificial Intelligence (San José State University)**.  
Explores how Graph Neural Networks can improve music recommendations by integrating user–item interactions and song metadata.

## Overview
- Built a **hybrid recommender system** with Graph Neural Networks.
- **Collaborative Filtering (CF):** modeled through a bipartite graph of **users ↔ songs**, where edges represent interaction histories.  
- **Content-Based Filtering (CBF):** modeled by enriching song nodes with **tags (Last.fm)** and **textual descriptions (Songfacts)** transformed into embeddings.  
- Implemented a **Graph Attention Network (GAT) encoder** with an **MLP edge-level decoder**.  
- Applied negative sampling and dropout for generalization.  
- Tuned 100+ models using **Ray Tune**, achieving:
  - **ROC-AUC: 0.77**
  - **Accuracy: 0.76**

## Dataset
Used the **KGRec Music Dataset** (MTG, Universitat Pompeu Fabra):
- 8,640 songs
- 5,199 users
- 750k+ user-item interactions
- Metadata: user-generated tags + textual descriptions

⚠️ Dataset is not included in this repo. Please follow dataset provider instructions.

## Development Environment
This repo includes a reproducible setup:
- `requirements.txt` for Python dependencies
- `Dockerfile` + `docker-compose.yml`
- `.devcontainer.json` for VS Code Dev Containers

### Run with Docker
```bash
docker-compose up --build
```

## Results

| Metric  | Value   |
|---      |---      |
| Loss    | 0.4712  |
| AUC     | 0.7721  |
| Acc     | 0.7643  |
| F1      | 0.4514  |

### Insights

- GNNs naturally fused Collaborative Filtering (edges) and Content-Based Filtering (node features) into a single framework.

- Metadata improved cold-start performance by recommending new songs with no prior interaction history.

- Training stabilized after ~30 epochs with dropout and negative sampling.

## Contributors

- Jose Velasco (Artificial Intelligence, SJSU)  
- Jessica Lieu (Artificial Intelligence, SJSU)  
- Hoai An Nguyen (Software Engineering, SJSU)  


## Citation

If you use this repo, please cite this project and the KGRec dataset.

