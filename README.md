
<img width="1913" height="1076" alt="image" src="https://github.com/user-attachments/assets/13b9ac98-856a-4c81-b6a4-6f134f03729a" />


# 🚀 Java Web App - Dockerized Build & Deploy

This project demonstrates a **multi-stage Docker build** for a Java web application.  
It uses **Maven** to build the WAR file and **Tomcat** to run it inside a container.

---

## 📂 Project Structure 
- **Stage 1 (Build):** Maven compiles the source code and packages it into a WAR file.
- **Stage 2 (Runtime):** Tomcat runs the WAR file as the deployed application.

---

## 🛠️ How to Build & Run

### 1. Build Docker Image
```bash
docker build -t myapp .

docker run -d -p 8081:8080 myapp
👉 Access the app at: http://localhost:8081 

---

**### 2.  Notes**
- Default Tomcat apps are removed for a clean deployment.
<img width="1913" height="1076" alt="image" src="https://github.com/user-attachments/assets/79fe4c1a-a23b-43e8-8684-7db15128b288" />

- The WAR file is copied as ROOT.war, so the app runs directly at /.
- Multi-stage build keeps the final image lightweight.

---

**### 3.  License**
This project is open-source. Feel free to fork, modify, and use it for learning or deployment.

