package uk.co.jamesandjack

import com.jamescookie.graphics.ImageManipulator

class Gallery {
    String name
    String galleryPath
    String watermarkText
    String additionalHTML
    List thumbs = []
    TreeMap photos = new TreeMap()

    Gallery(String galleryPath, String thumbnailPath, String name) {
        this.name = name
        this.galleryPath = galleryPath
        findPhotos()
        updateWatermark()
        updateAdditionalHTML()
        createThumbnails(thumbnailPath)
    }

    def getPhotoInfo = {photoName ->
        return [originalName:photoName,
                displayName:prettyPrintPhotoName(photoName),
                next:getNextPhoto(photoName),
                previous:getPreviousPhoto(photoName)]
    }

    def getNextPhoto = {photoName ->
        def submap = photos.tailMap(photoName)
        submap.remove(photoName)
        submap.size() > 0 ? submap.firstKey() : photos.firstKey()
    }

    def getPreviousPhoto = {photoName ->
        def submap = photos.headMap(photoName)
        submap.size() > 0 ? submap.lastKey() : photos.lastKey()
    }

    def findPhotos = {
        new File(galleryPath).eachFileMatch(~/.*\.(jpg|JPG)/) {file ->
            photos.put file.name, file
        }
    }

    def updateWatermark = {
        def file = new File("${galleryPath}${File.separator}watermark.txt")
        if (file.exists()) watermarkText = file.text
    }

    def updateAdditionalHTML = {
        def file = new File("${galleryPath}${File.separator}pageText.html")
        if (file.exists()) additionalHTML = file.text
    }

    def createThumbnails = {thumbnailPath ->
        File thumbnailDir = new File(thumbnailPath)
        if (!thumbnailDir.exists()) {
            thumbnailDir.mkdirs()
        }
        photos.each {imageName, imageFile ->
            try {
                def displayName = prettyPrintPhotoName(imageName)
                def thumbnailName = displayName + ".jpg"
                def thumbnail = new File(thumbnailDir.getAbsolutePath() + File.separator + thumbnailName)
                if (!thumbnail.exists() || (imageFile.lastModified() > thumbnail.lastModified())) {
                    ImageManipulator imageMan = new ImageManipulator(imageFile, new FileOutputStream(thumbnail))
                    imageMan.writeThumbnail(150)
                }
                thumbs.add([
                        safeOriginalName: imageName.encodeAsJavaScript(), 
                        thumbnailName: thumbnailName,
                        displayName: displayName])
            } catch (IOException ioe) {
                ioe.printStackTrace()
            }
        }
    }

    private static String prettyPrintPhotoName(String name) {
        name = name.substring(0, (name.lastIndexOf(".") == -1 ? name.length() : name.lastIndexOf(".")));
        name = name.substring((name.indexOf('-') == -1 ? 0 : name.indexOf('-') + 1), name.length());
        return name.trim();
    }

}
