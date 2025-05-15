// Import this first
import java.io.File
import java.io.FileInputStream
import java.util.*

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// key.properties 파일 경로를 읽어오는 코드
val keyPropertiesFile = file("key.properties")  // 여기서 경로 설정을 상대경로로 지정
println("key.properties file path: ${keyPropertiesFile.absolutePath}")
val keyProperties = Properties().apply {
    load(FileInputStream(keyPropertiesFile))  // 상대 경로로 key.properties 파일을 로드
}

// get a property
val detKeyAlias = keyProperties.getProperty("key.alias.name")
val detKeyPassword = keyProperties.getProperty("key.alias.password")
val detStoreFile = keyProperties.getProperty("key.store.file")
val detStorePassword = keyProperties.getProperty("key.store.password")

// Ensure properties are not null
require(detKeyAlias != null) { "keyAlias not found in key.properties file." }
require(detKeyPassword != null) { "keyPassword not found in key.properties file." }
require(detStoreFile != null) { "storeFile not found in key.properties file." }
require(detStorePassword != null) { "storePassword not found in key.properties file." }


android {
    namespace = "com.kr.jogakjogak"
    compileSdk = 35
    // NDK 버전을 명시적으로 설정
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.kr.jogakjogak"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = 33
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = detKeyAlias
            keyPassword = detKeyPassword
            storeFile = file(detStoreFile)
            storePassword = detStorePassword
        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
