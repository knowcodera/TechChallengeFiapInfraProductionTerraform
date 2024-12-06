
# Production - Infra com Terraform

Este repositório contém o código-fonte para provisionar a infraestrutura do microsserviço **Production** utilizando **Terraform**.

---

## 🔧 **Descrição**
O objetivo deste projeto é provisionar e configurar os recursos necessários para o microsserviço **Production**, incluindo:
- **CosmosDB** configurado com MongoDB API.
- Regras de acesso e throughput configuráveis.
- Repositório de recursos no Azure Resource Group.

---

## 🚀 **Tecnologias**
Este projeto utiliza as seguintes tecnologias:
- **Provisionamento:** Terraform
- **Infraestrutura:** Azure (Resource Groups, CosmosDB com MongoDB API)

---

## 🛠️ **Configuração**
### **Pré-requisitos**
1. **Azure CLI** configurado com permissões adequadas.
2. **Terraform CLI** instalado localmente.
3. Credenciais configuradas no Azure para autenticação com o Terraform:
   - Subscription ID
   - Client ID
   - Client Secret
   - Tenant ID

### **Comandos Principais**
1. Inicializar o Terraform:
   ```bash
   terraform init
   ```

2. Planejar a infraestrutura:
   ```bash
   terraform plan
   ```

3. Aplicar as mudanças:
   ```bash
   terraform apply -auto-approve
   ```

---

## 📦 **CI/CD**
O pipeline CI/CD está configurado no GitHub Actions para:
- Executar validações e verificações no Terraform.
- Provisionar infraestrutura automaticamente ao fazer merge na branch `main`.

### **Workflow Configurado**
Confira o workflow em:
```bash
.github/workflows/workflow.yml
```

---

## 📄 Licença
Este projeto está licenciado sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.
