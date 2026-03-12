# Local Coding Setup

[Reference](https://vasilkoff.com/blog/vscodium-and-ollama)

1. Install [VSCodium](https://github.com/VSCodium/vscodium/releases)
2. Install [Ollama](https://docs.ollama.com/quickstart)
3. Check available models [Library](https://ollama.com/library)
4. Run `ollama serve` in a terminal

    If getting the error: `Error: listen tcp 127.0.0.1:11434: bind: address already in use`

    Run:
    
    ```
    sudo systemctl status ollama.service 
    sudo systemctl stop ollama
    ```

5. Install Continue Extension

    Continue Config:

    ```yml
    name: Local Config
    version: 1.0.0
    schema: v1
    models:

    - name: Llama 3.2 3B
    provider: ollama
    model: llama3.2:3b
    roles:
        - chat
        - edit
        - apply

    - name: Qwen2.5-Coder 1.5B
    provider: ollama
    model: qwen2.5-coder:1.5b-base
    roles:
        - autocomplete

    - name: Nomic Embed
    provider: ollama
    model: nomic-embed-text:latest
    roles:
        - embed
    ```

    Alternate Chat / Edit Model, slightly heavier:

    ```yml
    - name: Llama 3.1 8B
        provider: ollama
        model: llama3.1:8b
        roles:
            - chat
            - edit
            - apply
    ```
