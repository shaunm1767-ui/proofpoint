- name: Build and push Docker image
  id: build-and-push
  uses: docker/build-push-action@v6
  with:
    context: .
    file: ./Dockerfile-proofpoint.txt  # choose the Dockerfile you want
    push: true
    tags: |
      ghcr.io/${{ github.repository }}/proofpoint:latest
      ghcr.io/${{ github.repository }}/proofpoint:${{ github.sha }}

- name: Sign the Docker image
  if: github.event_name != 'pull_request'
  env:
    TAGS: ${{ steps.build-and-push.outputs.tags }}
    DIGEST: ${{ steps.build-and-push.outputs.digest }}
  run: echo "${TAGS}" | xargs -I {} cosign sign --yes {}@${DIGEST}
