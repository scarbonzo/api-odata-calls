FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["api-odata-calls/api-odata-calls.csproj", "api-odata-calls/"]
RUN dotnet restore "api-odata-calls/api-odata-calls.csproj"
COPY . .
WORKDIR "/src/api-odata-calls"
RUN dotnet build "api-odata-calls.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "api-odata-calls.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "api-odata-calls.dll"]