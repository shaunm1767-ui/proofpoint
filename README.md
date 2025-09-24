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
