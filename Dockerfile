FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build 
WORKDIR /app 
COPY . . 
RUN dotnet publish Birthday2.csproj -c Release -o /app/out 
FROM mcr.microsoft.com/dotnet/aspnet:8.0 
WORKDIR /app 
COPY --from=build /app/out . 
EXPOSE 8080 
ENV ASPNETCORE_URLS=http://0.0.0.0:8080 
ENTRYPOINT ["dotnet", "Birthday2.dll"]
