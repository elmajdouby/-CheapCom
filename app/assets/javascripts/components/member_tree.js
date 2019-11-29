
const inputTree = document.getElementById('tree');
if (inputTree){
window.onload = function () {
    var nodes =  gon.membersJson;
    arbre (nodes);
}
function arbre (nodes) {

    OrgChart.templates.neet = Object.assign({}, OrgChart.templates.base);
    OrgChart.templates.neet.svg = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="display:block;background-color: #F4F4F4;" width="{w}" height="{h}" viewBox="{viewBox}">{content}</svg>';
    OrgChart.templates.neet.plus = '';
    OrgChart.templates.neet.minus = '';
    OrgChart.templates.neet.link = '<path stroke="#aeaeae" stroke-width="1px" fill="none" d="M{xa},{ya} C{xb},{yb} {xc},{yc} {xd},{yd}"/>';

    OrgChart.templates.dot = Object.assign({}, OrgChart.templates.base);
    OrgChart.templates.dot.plus = '';
    OrgChart.templates.dot.minus = '';
    OrgChart.templates.dot.link = '';

    var colors = ['#FFCA28', '#F57C00', '#039BE5', '#757575'];

    var initialized = false;

    var chart = new OrgChart(document.getElementById("tree"), {
        template: 'neet',
        enableSearch: false,
        nodeMouseClick: OrgChart.action.expandCollapse,
        siblingSeparation: 6,
        nodeBinding: {
            img: "img"
        }
    });

    chart.on('ready', function(sender, tree){
        if (!initialized){
            for (var i = 0; i < tree.roots.length; i++) {
                first_walk(tree.roots[i]);
            }

            for (var id in tree.nodes) {
                second_walk(tree.nodes[id]);
            }
            initialized = true;
        }
    });

    chart.on('expcollclick', function(sender, state, id){
        var tags = chart._get(id).tags;
        if (isDot(tags)){
            var node = sender.getBGNode(id);
            chart._get(id).tags = ['neet_' + (node.level)];
        }
    });

    chart.on('redraw', function(sender){
        for(var id in chart.nodes){
            var node = chart.nodes[id];
            if (node.templateName.indexOf('dot') != -1){
                var dotEl = chart.getNodeElement(id);
                if (dotEl){
                    dotEl.addEventListener('mouseover', function(){
                        var nid = this.getAttribute('node-id');
                        var level = chart.getBGNode(nid).level;
                        var circle = this.querySelector('circle');
                        circle.setAttribute('fill', '#757575');
                    });

                    dotEl.addEventListener('mouseleave', function(){
                        var nid = this.getAttribute('node-id');
                        var level = chart.getBGNode(nid).level;
                        var circle = this.querySelector('circle');
                        circle.setAttribute('fill', colors[level]);
                    });
                }
            }
        }
    });


    chart.load(nodes);

    function first_walk(node){
        var childrenCount = node.children.length;
        if (childrenCount != 0){
            for (var i = 0; i < childrenCount; i++) {
                var cnode = node.children[i];
                if (childrenCount > 3 && i > 1 && i != childrenCount - 1){
                    var level = getLevel(cnode);
                    var t = createDotTemplate(level);
                    console.log(t.name);
                    cnode.templateName = t.name;
                    cnode.tags = [t.name];
                    cnode.w = 10;
                    cnode.h = t.heidth;
                    cnode.collapsedChildrenIds = cnode.childrenIds;
                    chart._get(cnode.id).tags = [t.name];
                    if (!chart.hasTag(t.name)){
                        chart.addTag(t.name, {template: t.name})
                    }
                }
                first_walk(cnode);
            }
        }
    }

    function second_walk(node){
        var level = getLevel(node);

        if (node.templateName.indexOf('dot') != -1){
            third_walk(node);
            node.children = [];
            node.collapsedChildrenIds = node.childrenIds;
        }
        else {
            var t = createTemplate(level);
            node.templateName = t.name;
            node.w = parseInt(t.size);
            node.h = parseInt(t.size);
            chart._get(node.id).tags = [t.name];
            if (!chart.hasTag(t.name)){
                chart.addTag(t.name, {template: t.name})
            }
        }
    }

    function third_walk(node){
        var childrenCount = node.children.length;
        if (childrenCount != 0){
            for (var i = 0; i < childrenCount; i++) {
                var cnode = node.children[i];
                cnode.state = OrgChart.COLLAPSE;
                third_walk(cnode);
            }
        }
    }

    function createTemplate(level){
        var name = 'neet_' + level;
        var size = (100 - (level * 10));

        if (!OrgChart.templates[name]){
            var radius = size / 2;
            OrgChart.templates[name] = Object.assign({}, OrgChart.templates.neet);
            OrgChart.templates[name].size = [size,size];
            OrgChart.templates[name].node = '<circle fill="' + colors[level] + '" cx="' + radius + '" cy="' + radius + '" r="' + radius + '"></circle>';

            OrgChart.templates[name].img = '<clipPath id="{randId}"><circle cx="' + (radius) +  '" cy="' + (radius) + '" r="' + (radius - 4) + '"></circle></clipPath><image preserveAspectRatio="xMidYMid slice" clip-path="url(#{randId})" xlink:href="{val}" x="4" y="4"  width="' +  (size - 8) + '" height="' + (size - 8) + '"></image>',
            OrgChart.templates[name].ripple = {
                radius: size,
                color: colors[level],
            };
        }

        return {
            name: name,
            size: size
        };
    }

    function createDotTemplate(level){
        var name = 'dot_' + level;
        var heidth = (100 - (level * 10));

        if (!OrgChart.templates[name]){
            OrgChart.templates[name] = Object.assign({}, OrgChart.templates.dot);
            OrgChart.templates[name].size = [10,heidth];
            OrgChart.templates[name].node = '<rect x="-3" y="0" fill="#F4F4F4" width="17" height="' + heidth + '"></rect><circle fill="' + colors[level] + '" cx="5" cy="' + (heidth / 2) + '" r="5"></circle>';
            OrgChart.templates[name].ripple = {
                radius: 0,
                color: 'none'
            };
        }

        return {
            name: name,
            heidth: heidth
        };
    }

    function getLevel(node){
        var pnode = node.parent;

        var level = 0;
        while(pnode){
            pnode = pnode.parent;
            level++;
        }

        return level;
    }

    function isDot(tags){
        if (!tags){
            return false;
        }
        for(var i = 0; i < tags.length; i++){
            var tag = tags[i];
            if (tag.indexOf('dot') != -1){
                return true;
            }
        }
        return false;
    }

};

}
