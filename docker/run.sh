docker run -it --rm --gpus all \
            -v /home/leo/projects/semantic_bevnet/:/workspace/semantic_bevnet \
            -v /home/leo/dataset/rellis_4class_100x100:/workspace/semantic_bevnet/data/rellis_4class_100x100 \
            -v /home/leo/dataset/semantic_kitti_4class_100x100:/workspace/semantic_bevnet/data/semantic_kitti_4class_100x100 \
            leo/bevnet:t110cu113 /bin/bash