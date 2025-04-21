apiVersion: apps/v1
kind: Deployment
metadata:
  name: xcaddy-auth
  namespace: gpt
  labels:
    app: xcaddy-auth
spec:
  replicas: 1
  selector:
    matchLabels:
      app: xcaddy-auth
  template:
    metadata:
      labels:
        app: xcaddy-auth
    spec:
      containers:
        - name: xcaddy-auth
          image: exrienz/ollama-api:latest
          ports:
            - containerPort: 8081
          volumeMounts:
            - name: ollama-storage
              mountPath: /root/.ollama  # ✅ persist only Ollama data
      volumes:
        - name: ollama-storage
          persistentVolumeClaim:
            claimName: ollama-data  # ✅ only this PVC needed
