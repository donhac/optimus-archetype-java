# stonehenge-archetype-java
a maven archetype for stonehenge service.

## generate project from archetype

[使用案例](http://git.oschina.net/gdesign/grand-design/blob/master/dubbox-archetype-userguide.mdhttp://git.oschina.net/gdesign/grand-design/blob/master/dubbox-archetype-userguide.md)

with interactive mode

```
mvn archetype:generate                             \
  -DarchetypeGroupId=com.github.donhac             \
  -DarchetypeArtifactId=stonehenge-archetype-java  \
  -DarchetypeVersion=1.0.0
```


you will required to input groupId, artifactId for your new project.


without interactive mode

```
mvn archetype:generate                             \
  -DarchetypeGroupId=com.github.donhac             \
  -DarchetypeArtifactId=stonehenge-archetype-java  \
  -DarchetypeVersion=1.0.0                         \
  -DgroupId=x.y                                    \
  -DartifactId=a                                   \
  -DarchetypeCatalog=local
```

this process should be slow, but if you had already run once successfully, to speed up, add this param:

```
-DarchetypeCatalog=local
```

## Setting up Zookeeper

in src/main/resources/dubbo.properties

modify following line:

```
dubbo.registry.address=zookeeper://127.0.0.1:2181
```

### Setting up zookeeper in MacOS

```
brew install zookeeper
```

then start zookeeper by run:
```
zkServer start
```

or using the LaunchRocket GUI.

## run

```
mvn spring-boot:run
```

## deploy service client jar to repository

setup the login and password required to authenticate to this server in **~/.m2/settings.xml** file:

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
  <servers>
    <server>
      <id>moria-snapshots</id>
      <username>username</username>
      <password>password</password>
    </server>
    <server>
      <id>moria-release</id>
      <username>username</username>
      <password>password</password>
    </server>
  </servers>
</settings>
```

deploy artifact:

```
mvn deploy
```

## reference

* [Introduction to Archetypes](https://maven.apache.org/guides/introduction/introduction-to-archetypes.html)
* [Guide to Creating Archetypes](https://maven.apache.org/guides/mini/guide-creating-archetypes.html)
