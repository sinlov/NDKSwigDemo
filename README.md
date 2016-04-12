# Warning

## Using this code must install

* android-sdk build-tools 23.0.2 API-23 ++
* andorid-ndk r10e ++
* swig 3.0.8
* gradle 2.4+


## Using is at first

```sh
cd [ProjectRootPath]
./gradlew runSwig
```

## must be config file

add file `local.properties` at project root path

and set your sdk and ndk path

```properties
sdk.dir=/Users/sinlov/opt/android-sdk
ndk.dir=/Users/sinlov/opt/android-ndk/android-ndk-r10e
```

If gradle need config, you can use like this

```properties
systemProp.http.proxyHost=
systemProp.http.proxyPort=
systemProp.https.proxyHost=
systemProp.https.proxyPort=
```

You can use shell like this to create config file `create_properties.sh`

```sh
#!/bin/bash
#
LOCAL_PRO="local.properties"

#GRADLE_PRO="gradle.properties"

if [ -f "$LOCAL_PRO" ]; then
	echo ">> File $LOCAL_PRO is exist"
	else
		cat > $LOCAL_PRO << EOF
# Please set your config path after this
ndk.dir=/Users/sinlov/opt/android-ndk/android-ndk-r10e
sdk.dir=/Users/sinlov/opt/android-sdk
EOF
echo ">> create $LOCAL_PRO finish"
fi

if [ ! -n "$GRADLE_PRO" ]; then
	echo ">> You are note set gradle.properties please set at this shell line 5."
		elif [ -f "$GRADLE_PRO" ]; then
			echo ">> File gradle.properties is exist"
		else
			cat > $GRADLE_PRO << EOF
# Please set your config path after this
#systemProp.http.proxyHost=
#systemProp.http.proxyPort=
#systemProp.https.proxyHost=
#systemProp.https.proxyPort=
EOF
echo ">> create $GRADLE_PRO finish"
fi
```

and run by shell 

```sh
chmod +x create_properties.sh && ./create_properties.sh
```

---

Apache License
Version 2.0, January 2004
http://www.apache.org/licenses/

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION