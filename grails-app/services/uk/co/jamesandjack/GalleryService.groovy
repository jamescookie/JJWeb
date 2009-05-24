package uk.co.jamesandjack

import javax.servlet.ServletContext
import org.springframework.web.context.ServletContextAware

class GalleryService implements ServletContextAware {
    def servletContext

    void setServletContext(ServletContext servletContext) {this.servletContext = servletContext}

    Gallery findGallery(id) {
        id = URLDecoder.decode(id)
        def photoPath = servletContext.getRealPath("/WEB-INF/photos/$id")
        def thumbnailPath = servletContext.getRealPath("/thumbnails/$id")
        return new Gallery(photoPath, thumbnailPath, id)
    }

    List findGalleries() {
        def galleries = []
        new File(servletContext.getRealPath("/WEB-INF/photos")).eachDir {galleries << it.name}
        return galleries
    }

}
