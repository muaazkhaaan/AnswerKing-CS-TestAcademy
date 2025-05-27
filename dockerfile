# Use the .NET SDK image (includes runtime)
FROM mcr.microsoft.com/dotnet/sdk:7.0

WORKDIR /app

# Copy all project files
COPY . .

# Restore and publish the app
RUN dotnet restore \
 && dotnet publish src/Answer.King.Api/Answer.King.Api.csproj -c Release -o out

# Set working directory to the output folder
WORKDIR /app/out

# Start the application
ENTRYPOINT ["dotnet", "Answer.King.Api.dll"]

# Expose ports for HTTP and HTTPS
EXPOSE 80 443