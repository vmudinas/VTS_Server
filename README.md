# VTS Server

VTS Server is a backend API service extracted from the VTS_CRM project, providing all server-side functionality.

## Setup Instructions

### Prerequisites
- .NET 9.0 SDK or later
- For SQLite: No additional setup needed (default)
- For SQL Server: SQL Server instance and credentials
- For Docker deployment: Docker and Docker Compose

### Environment Variables
You can configure the server using the following environment variables:

```
# Database Configuration
DB_SERVER=your_sql_server_name      # Optional: SQL Server name (defaults to SQLite if not provided)
DB_PORT=1433                        # Optional: SQL Server port (default: 1433)
DB_NAME=FAI                         # Optional: Database name (default: FAI)
DB_USER=your_db_username            # Required for SQL Server
DB_PASSWORD=your_db_password        # Required for SQL Server

# Authentication
JWT_SECRET=your_jwt_secret_key      # Optional: Secret key for JWT token signing (min 256 bits)

# Admin User Initial Setup 
ADMIN_USERNAME=admin                # Optional: Initial admin username
ADMIN_PASSWORD=secure_password      # Optional: Initial admin password

# Bitcoin Wallet Service
BITCOIN_SEED_PHRASE=your_seed_phrase # Required for Bitcoin payment processing
```

### Running the Server

#### Option 1: Run Locally

1. Clone the repository
```
git clone https://github.com/vmudinas/VTS_Server.git
cd VTS_Server/server
```

2. Restore dependencies
```
dotnet restore
```

3. Run the server
```
dotnet run
```

#### Option 2: Run with Docker

1. Clone the repository
```
git clone https://github.com/vmudinas/VTS_Server.git
cd VTS_Server
```

2. For production environment:
```
docker-compose up -d
```

3. For development environment:
```
docker-compose -f docker-compose.dev.yml up -d
```

#### Configuration Options for Docker

You can customize your Docker deployment by:

1. Creating a `.env` file (based on `docker/config/sample.env`)
```
cp docker/config/sample.env .env
# Edit .env with your values
```

2. Then run Docker Compose:
```
docker-compose --env-file .env up -d
```

The server will be available at:
- API: http://localhost:4000/api
- Swagger Documentation: http://localhost:4000/swagger

### API Endpoints

The server provides the following main endpoints:

- `/api/auth` - Authentication services
- `/api/products` - Product catalog management
- `/api/orders` - Order management
- `/api/messages` - Contact messages
- `/api/videos` - Video content management

Refer to the Swagger documentation for a complete API reference.

### Default Credentials

In development mode, the following default credentials are available:
- Username: `admin`
- Password: `letmein123`
