package uk.co.jamesandjack

import java.awt.Font
import com.jamescookie.graphics.Watermark
import com.jamescookie.maps.GoogleApiKey

class GalleryController {
    def galleryService

    def index = {redirect(action: list, params: params)}

    def list = {
        [galleryList: galleryService.findGalleries()]
    }

    def show = {
        findGalleryAndExecute {gallery ->
            [gallery: gallery]
        }
    }

    def showPhoto = {
        findGalleryAndExecute {gallery ->
            [gallery: gallery.name, photo: gallery.getPhotoInfo(params.photo)]
        }
    }

    def renderPhoto = {
        findGalleryAndExecute {gallery ->
            File f = gallery.photos."$params.photo"
            if (f && f.exists()) {
                response.setContentType('image/jpeg')
                def out = response.getOutputStream()
                Watermark watermark = new Watermark(f, out)
                if (gallery.watermarkText?.trim()?.length() > 1) {
                    watermark.writeWaterMarkTextAllOver(gallery.watermarkText,
                            watermark.createThumbnail(600),
                            new Font("Verdana", Font.PLAIN, 32))
                } else {
                    watermark.writeThumbnail(600)
                }
                out.flush()
                out.close()
            }
        }
    }

    def ourWorld = {
        [mapkey: GoogleApiKey.getKey(request.getServerName()),
                host: request.serverName + ":" + request.serverPort + grailsAttributes.getApplicationUri(request)]
    }

    def findGalleryAndExecute = {closure ->
        def gallery = galleryService.findGallery(params.id)

        if (!gallery) {
            flash.message = "Gallery '${params.id}' not found"
            redirect(action: list)
        } else {
            return closure.call(gallery)
        }
    }
}
