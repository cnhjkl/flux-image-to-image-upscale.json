# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes were found in the workflow.
# The following unknown_registry custom nodes couldn't be resolved automatically (no aux_id provided):
# - BasicGuider
# - RandomNoise
# - DualCLIPLoader
# - UNETLoader
# - VAELoader
# - VAEDecode
# - SaveImage
# - SamplerCustomAdvanced
# - CLIPTextEncode
# - BasicScheduler
# - KSamplerSelect
# - VAEEncode
# - LatentUpscaleBy
# - Seed (rgthree)
# - Note
# - LoadImage
# (These nodes have no aux_id / GitHub repo info in the workflow, so they were skipped.)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors --relative-path models/text_encoders --filename t5xxl_fp8_e4m3fn.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/stable-diffusion-3.5-fp8/resolve/main/text_encoders/clip_l.safetensors --relative-path models/clip --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux1-dev/resolve/main/flux1-dev-fp8.safetensors --relative-path models/diffusion_models --filename flux1-dev-fp8.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
