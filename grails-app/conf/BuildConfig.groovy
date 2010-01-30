grails.war.resources = { stagingDir ->
  delete(dir:"${stagingDir}/WEB-INF/photos")
}
