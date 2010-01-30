package uk.co.jamesandjack

import groovy.util.XmlSlurper
import de.andreasschmitt.richui.taglib.renderer.*

// required due to bug
class TreeViewTagLib {

	static namespace = "jjweb"

	def treeView = {attrs ->
		try {
			attrs.xml = new XmlSlurper().parseText(attrs.xml)
		}
		catch(Exception e){
			log.error("Error parsing xml", e)
			return ""
		}

		//Render output
		try {
			out << new MyRenderer().renderTag(attrs)
		}
		catch(RenderException e){
			log.error(e)
		}

	}

}