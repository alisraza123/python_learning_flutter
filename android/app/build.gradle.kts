plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")

    // Firebase Google Services plugin lagayen
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.learnpythonapp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.learnpythonapp"
        minSdk = 23        // change from flutter.minSdkVersion to 23
        targetSdk = 33
        versionCode = 1
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
    ndkVersion = "27.0.12077973" // Add this line

}

dependencies {
    // Firebase BoM use karen taake compatible versions milen
    implementation(platform("com.google.firebase:firebase-bom:34.1.0"))

    // Firebase Analytics ka example
    implementation("com.google.firebase:firebase-analytics")

    // Agar Firebase ke aur SDKs chahiye to yahan add karein

    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")

}

flutter {
    source = "../.."
}
