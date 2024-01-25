cd /usr/docker_sharedpc/SoftHebb

conda env create -n softhebb -f environment_pytorch==1.7.1.yml

source /opt/conda/etc/profile.d/conda.sh
conda activate softhebb

# CUDA 11.0
pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html

# this works fine without any additions
python demo.py 

# this works with a compulsory change to the repo - already in pqlet repo
# 1) ray.init(num_gpus=1) # place before tune.run() in ray_search.py
python ray_search.py --preset 2SoftHebbCnnCIFAR --dataset-unsup CIFAR10_1 --dataset-sup CIFAR10_50 --folder-name 'CIFAR10_SoftHebb2' --save-model