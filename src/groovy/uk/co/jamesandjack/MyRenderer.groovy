package uk.co.jamesandjack

import de.andreasschmitt.richui.taglib.renderer.TreeViewRenderer
import groovy.xml.MarkupBuilder
import de.andreasschmitt.richui.taglib.renderer.RenderException
import de.andreasschmitt.richui.taglib.renderer.RenderUtils

class MyRenderer extends TreeViewRenderer {
    protected void renderTagContent(Map attrs, Closure body, MarkupBuilder builder) throws RenderException {
        if(!attrs?.id){
            attrs.id = "tree" + RenderUtils.getUniqueId()
        }

        builder.div(id: attrs?.id, "")
        builder.script(type: "text/javascript"){
            builder.yieldUnescaped "	var tree = new YAHOO.widget.TreeView(\"$attrs.id\");\n"
            builder.yieldUnescaped "	var root = tree.getRoot();\n"

            builder.yieldUnescaped "    function createNode(text, id, icon, pnode){\n"
            builder.yieldUnescaped "        var n = new YAHOO.widget.TextNode(text, pnode, false);\n"
            //builder.yieldUnescaped "        n.labelStyle=icon;\n"
            if(attrs?.onLabelClick){
                builder.yieldUnescaped "		n.additionalId = id;\n"
            }
            builder.yieldUnescaped "        return n;\n"
            builder.yieldUnescaped "    }\n\n"

            if(attrs?.onLabelClick){
                builder.yieldUnescaped "	tree.subscribe(\"labelClick\", function(node) {\n"
                builder.yieldUnescaped "		var id = node.additionalId;"
                builder.yieldUnescaped "		${attrs.onLabelClick}"
                builder.yieldUnescaped "	});\n"
            }

            if(attrs?.showRoot == "false") {
                createTree(attrs.xml.children(), "root", builder)
            } else {
                createTree(attrs.xml, "root", builder)
            }

            builder.yieldUnescaped "	tree.draw();\n"
        }
    }
}
