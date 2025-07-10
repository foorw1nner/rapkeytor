# rapKeytor

rapKeytor is a fast and lightweight API key hunter.
It scans JavaScript files and other plaintext sources for API keys in multiple formats — including hardcoded variables, object properties, headers, and embedded URLs.
Beyond typical keys, it also detects:

- Basic authorization tokens

- Bearer tokens

- JWTs (JSON Web Tokens)

Use it to automate the discovery of sensitive tokens that may have been exposed through client-side code or misconfigured applications.

🦖 Track. Hunt. Leak. With rapKeytor.

![image](https://github.com/user-attachments/assets/453996c6-6ccb-41b3-9b11-d77673f42d2e)



Installation
```bash
▶ git clone https://github.com/foorw1nner/rapkeytor.git
▶ cd rapkeytor
▶ chmod +x rapKeytor.sh
```

Usage
```bash
[buffers] | ./rapKeytor.sh -start [flags]
```

Example
```bash
cat js.txt | ./hiddenrecon.sh -start -nocolor
```



