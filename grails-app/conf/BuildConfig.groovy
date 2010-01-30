grails.war.resources = { stagingDir ->
  delete(dir:"${stagingDir}/thumbnails")
  delete(dir:"${stagingDir}/WEB-INF/photos")
}
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.war.file = "target/ROOT.war"
