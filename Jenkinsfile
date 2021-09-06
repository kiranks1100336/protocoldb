@Library(['dsl-lib', 'devops-lib']) _
properties([gitLabConnection('GitSwarmWithAPIToken')])

containerizeSpringApp {
    component='protocoldbservice'
    skipGenerateSources = "false"
    skipUnitTests = "true"
    skipSonar = "true"
    skipPackageRPM="false"
    skipPackageContainer="false"

    pom_file = "pom.xml"
    package_pom_file = "package-pom.xml"
    
    codegen_pom_file="./codegen-pom.xml"
    
    docker_file="./Dockerfile"
    container_name="protocoldb-service"
}
