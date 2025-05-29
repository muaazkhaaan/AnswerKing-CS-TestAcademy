FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY ./src/Answer.King.Api/bin/Release/net7.0/linux-x64/publish /app
ENTRYPOINT ["dotnet", "AnswerKing.dll"]