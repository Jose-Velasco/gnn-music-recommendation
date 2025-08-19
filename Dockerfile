FROM tensorflow/tensorflow:latest-gpu AS base

# # Install dependencies
# FROM base AS py-deps

# GPU install
COPY requirements.txt requirements.txt

RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 && \
    pip install -r requirements.txt && \
    pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-2.6.0+cu118.html

# RUN pip install --no-cache-dir torch==2.6.0+cu118 torchvision==0.21.0+cu118 torchaudio==2.6.0+cu118 \
#     --index-url https://download.pytorch.org/whl/cu118 && \
#     pip install --no-cache-dir pyg_lib torch-scatter torch-sparse torch-cluster torch-spline-conv \
#     -f https://data.pyg.org/whl/torch-2.6.0+cu118.html && \
#     pip install --no-cache-dir torch-geometric && \
#     pip install --no-cache-dir -r requirements.txt --no-deps

# RUN pip install -r requirements.txt

# FROM py-deps AS runtime

# Create and switch to a new user
RUN useradd --create-home appdev
WORKDIR /home/appdev/src
# USER appdev

# COPY . .