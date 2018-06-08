FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
#RUN apt-get -qq update && apt-get install -y build-essential
#RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash -
RUN apt-get install -y nodejs
RUN npm i -g --unsafe-perm node-sass && npm rebuild --unsafe-perm node-sass -f
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /SRC/API
COPY API.csproj .
#RUN apt-get -qq update && apt-get install build-essential -y && apt-get install -my wget gnupg && apt-get -qq -y install bzip2 
#RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash -
RUN apt-get install -y nodejs
RUN dotnet restore ./SRC/API/API.csproj
COPY . .
WORKDIR /SRC/API/
RUN dotnet build API.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish /SRC/API/API.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "API.dll"]