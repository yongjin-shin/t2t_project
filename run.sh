#cd fairseq/examples/translation/
#bash prepare-wmt14en2de.sh
#cd ../../..
#
# Preprocess/binarize the data
# TEXT=fairseq/examples/translation/wmt17_en_de
# fairseq-preprocess --source-lang en --target-lang de \
#     --trainpref $TEXT/train --validpref $TEXT/valid --testpref $TEXT/test \
#     --destdir data/wmt17_en_de \
#     --thresholdtgt 0 --thresholdsrc 0 \
#     --workers 20
#
#CUDA_VISIBLE_DEVICES=0 fairseq-train data/wmt17_en_de \
#    --arch transformer_dpp_wmt_en_de --share-decoder-input-output-embed \
#    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
#    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
#    --dropout 0.3 --weight-decay 0.0001 \
#    --criterion cross_entropy_dpp \
#    --max-tokens 4096 \
#

CUDA_VISIBLE_DEVICES=0 fairseq-train \
    ../../Desktop/data/iwslt14.tokenized.de-en \
    --arch transformer_dpp_iwslt_de_en --share-decoder-input-output-embed \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
    --lr 5e-4 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --criterion label_smoothed_cross_entropy_dpp --label-smoothing 0.1 \
    --max-tokens 4096