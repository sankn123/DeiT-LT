CUDA_VISIBLE_DEVICES=0,1 python -m torch.distributed.launch --nproc_per_node=2 --use_env --master_port=47773 main.py \
    --model deit_base_distilled_patch16_224 \
    --batch-size 256 \
    --epochs 1200 \
    --gpu 0 \
    --teacher-path "Enter teacher path" \
    --distillation-type hard \
    --data-path cifar100 \
    --data-set CIFAR100LT \
    --imb_factor 0.01 \
    --output_dir deit_out_c100lt \
    --student-transform 0 \
    --teacher-transform 0 \
    --teacher-model resnet32 \
    --teacher-size 32 \
    --experiment [deitlt_paco_sam_cifar10_if100] \
    --drw 1100 \
    --no-mixup-drw \
    --custom_model \
    --accum-iter 4 \
    --save_freq 300 \
    --weighted-distillation \
    --moco-t 0.05 --moco-k 1024 --moco-dim 32 --feat_dim 64 --paco \
    # --log-results \