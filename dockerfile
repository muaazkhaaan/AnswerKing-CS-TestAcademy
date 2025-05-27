# syntax=docker/dockerfile:1

# Stage 1: Build the .NET application using the SDK image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Set the working directory in the container
WORKDIR /app

# Copy all files from the host to the container
COPY . .

# Restore NuGet packages and publish the project in Release mode to /app/out
RUN dotnet restore && dotnet publish src/Answer.King.Api/Answer.King.Api.csproj -c Release -o out

# Stage 2: Create the runtime image using the ASP.NET Core runtime only
FROM mcr.microsoft.com/dotnet/aspnet:7.0

# Set the working directory for the runtime container
WORKDIR /app

# Copy the published output from the build stage
COPY --from=build /app/out /app

# Set the entry point to run the application
ENTRYPOINT ["dotnet", "Answer.King.Api.dll"]

# Expose ports 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443
