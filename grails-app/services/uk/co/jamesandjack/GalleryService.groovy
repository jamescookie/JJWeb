package uk.co.jamesandjack

import javax.servlet.ServletContext
import org.springframework.web.context.ServletContextAware
import groovy.xml.MarkupBuilder

class GalleryService implements ServletContextAware {
    def servletContext
    def SEPARATOR = '|'

    void setServletContext(ServletContext servletContext) {this.servletContext = servletContext}

    Gallery findGallery(id) {
        id = URLDecoder.decode(id)
        def replaced = id.replace(SEPARATOR, '/')
        def photoPath = servletContext.getRealPath("/WEB-INF/photos/$replaced")
        def thumbnailPath = servletContext.getRealPath("/thumbnails/$replaced")
        return new Gallery(photoPath, thumbnailPath, id)
    }

    def findGalleries() {
        def writer = new StringWriter()
        def xml = new MarkupBuilder(writer)
        xml.galleries(name: "Galleries") {
            recurseDirectories(new File(servletContext.getRealPath("/WEB-INF/photos")), xml, '')
        }
        return writer.toString()
    }

    def recurseDirectories(file, xml, pathSoFar) {
        def files = []
        file.eachDir {files << it}
        files.sort {a,b-> a.name <=> b.name}
        files.each {
            def subFile = it
            xml.gallery(name: subFile.name, id: pathSoFar + subFile.name) {
                recurseDirectories(subFile, xml, pathSoFar + subFile.name + SEPARATOR)
            }
        }
    }

}
