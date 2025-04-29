plugins {
    id("com.android.application")
    id("com.google.gms.google-services")  // Добавляем плагин для Firebase
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(11))
    }
}

dependencies {
    // Импортируем Firebase BoM (Bill of Materials)
    implementation(platform("com.google.firebase:firebase-bom:33.13.0"))

    // Добавляем зависимости для нужных Firebase продуктов
    implementation("com.google.firebase:firebase-analytics")

    // Здесь можно добавлять другие зависимости Firebase, например:
    // implementation("com.google.firebase:firebase-auth")
    // implementation("com.google.firebase:firebase-firestore")
}

allprojects {
    repositories {
        google()  // Используем репозиторий Google для загрузки зависимостей
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

