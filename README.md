- name: Build and push Docker image
  id: build-and-push
  uses: docker/build-push-action@v6
  with:
    context: .
    file: ./Dockerfile
    push: true
    tags: |
      ghcr.io/${{ github.repository }}/proofpoint:latest
      ghcr.io/${{ github.repository }}/proofpoint:${{ github.sha }}
context: .
file: ./Dockerfile
file: ./Dockerfile-proofpoint.txt
# - name: Sign the Docker image
#   if: github.event_name != 'pull_request'
#   run: echo "${TAGS}" | xargs -I {} cosign sign --yes {}@${DIGEST}
tags: |
  ghcr.io/${{ github.repository }}/proofpoint:latest
  ghcr.io/${{ github.repository }}/proofpoint:${{ github.sha }}
