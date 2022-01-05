var E=Object.create;var d=Object.defineProperty;var N=Object.getOwnPropertyDescriptor;var $=Object.getOwnPropertyNames;var W=Object.getPrototypeOf,H=Object.prototype.hasOwnProperty;var v=o=>d(o,"__esModule",{value:!0});var M=(o,t)=>()=>(t||o((t={exports:{}}).exports,t),t.exports),z=(o,t)=>{for(var e in t)d(o,e,{get:t[e],enumerable:!0})},F=(o,t,e,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let i of $(t))!H.call(o,i)&&(e||i!=="default")&&d(o,i,{get:()=>t[i],enumerable:!(n=N(t,i))||n.enumerable});return o},c=(o,t)=>F(v(d(o!=null?E(W(o)):{},"default",!t&&o&&o.__esModule?{get:()=>o.default,enumerable:!0}:{value:o,enumerable:!0})),o),R=(o=>(t,e)=>o&&o.get(t)||(e=F(v({}),t,1),o&&o.set(t,e),e))(typeof WeakMap!="undefined"?new WeakMap:0);var A=M((Y,g)=>{"use strict";function J(o){var t=void 0;typeof o=="string"?t=[o]:t=o.raw;for(var e="",n=0;n<t.length;n++)e+=t[n].replace(/\\\n[ \t]*/g,"").replace(/\\`/g,"`"),n<(arguments.length<=1?0:arguments.length-1)&&(e+=arguments.length<=n+1?void 0:arguments[n+1]);var i=e.split(`
`),a=null;return i.forEach(function(p){var P=p.match(/^(\s+)\S+/);if(P){var S=P[1].length;a?a=Math.min(a,S):a=S}}),a!==null&&(e=i.map(function(p){return p[0]===" "?p.slice(a):p}).join(`
`)),e=e.trim(),e.replace(/\\n/g,`
`)}typeof g!="undefined"&&(g.exports=J)});var B={};z(B,{default:()=>q});var T=require("child_process"),C=require("util"),w=(0,C.promisify)(T.exec);var O=c(require("os")),U=c(A());var s=(e=>(e.empty="empty",e.swiftUI="swiftUI",e))(s||{});var l=c(require("fs")),k=o=>l.default.promises.access(o,l.default.constants.F_OK).then(()=>!0).catch(()=>!1),_=l.default.promises.readdir,h=l.default.promises.mkdir,D=l.default.promises.rm,X=l.default.promises.writeFile;var b=c(require("path"));function f(...o){return b.join(...o)}var m=class{constructor(){this.scaffoldTemplateFiles=[{name:"timeline",extension:"xctimeline",contents:`
      <?xml version="1.0" encoding="UTF-8"?>
      <Timeline version="3.0">
         <TimelineItems>
         </TimelineItems>
      </Timeline>
      `},{path:"playground.xcworkspace",name:"contents",extension:"xcworkspacedata",contents:`
      <?xml version="1.0" encoding="UTF-8"?>
      <Workspace version="1.0">
        <FileRef location="group:self:">
        </FileRef>
      </Workspace>
      `}]}async createSwiftPlayground(t){let e=f(t.location.replace(/^~/,O.homedir()),`${t.name}.playground`);if(await k(e))return{name:t.name,path:e,alreadyExists:!0,open:()=>w(`open ${e}`).then()};await h(e);let n=[...this.scaffoldTemplateFiles,m.swiftSourceContentsTemplateFile(t.template),m.contentsTemplateFile(t.platform)];try{await Promise.all(n.map(async i=>{let a=e;i.path&&(a=f(a,i.path),await h(a)),a=f(a,[i.name,i.extension].join(".")),await X(a,(0,U.default)(i.contents))}))}catch(i){try{await D(e,{recursive:!0})}catch(a){console.error(a)}throw i}return{name:t.name,path:e,alreadyExists:!1,open:()=>w(`open ${e}`).then()}}static contentsTemplateFile(t){return{name:"contents",extension:"xcplayground",contents:`
      <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
      <playground version='5.0' 
                  target-platform='${t.toLocaleLowerCase()}' 
                  buildActiveScheme='true' 
                  executeOnSourceChanges='false' 
                  importAppTypes='true'>
          <timeline fileName='timeline.xctimeline'/>
      </playground>
      `}}static swiftSourceContentsTemplateFile(t){let e;switch(t){case"empty":e=`import Foundation

`;break;case"swiftUI":e=`
        import PlaygroundSupport
        import SwiftUI
        
        struct ContentView: View {
        
            var body: some View {
                Text("Hello World")
            }
            
        }
        
        PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
        `;break}return{name:"Contents",extension:"swift",contents:e}}};var L=require("@raycast/api");var r=require("@raycast/api");var y=(n=>(n.iOS="ios",n.macOS="macos",n.tvOS="tvos",n))(y||{});var u=c(require("path"),1),I=c(require("os"),1),V=I.default.homedir();function x(o){let t=u.default.normalize(o)+u.default.sep;return(t.startsWith(V)?t.replace(V+u.default.sep,`~${u.default.sep}`):t).slice(0,-1)}function j(o,t){return _jsx(r.Form,{actions:_jsx(r.ActionPanel,null,_jsx(r.SubmitFormAction,{title:"Create Swift Playground",onSubmit:e=>{K(e,o,t)}}))},_jsx(r.Form.TextField,{id:"name",title:"Name",defaultValue:"MyPlayground"}),_jsx(r.Form.TextField,{id:"location",title:"Location",defaultValue:"~/Desktop"}),_jsx(r.Form.Dropdown,{id:"platform",title:"Platform",defaultValue:"ios"},Object.keys(y).map(e=>e.toLocaleLowerCase()).map(e=>_jsx(r.Form.Dropdown.Item,{key:e,value:e,title:e.replace("os","OS")}))),_jsx(r.Form.Dropdown,{id:"template",title:"Template",defaultValue:"empty"},Object.keys(s).map(e=>_jsx(r.Form.Dropdown.Item,{key:e,value:e,title:e.charAt(0).toUpperCase()+e.slice(1)}))),_jsx(r.Form.Checkbox,{id:"open",label:"Open in Xcode after creation",defaultValue:!0}))}async function K(o,t,e){let n;try{n=await t.createSwiftPlayground(o)}catch(a){console.log(a),await(0,r.showToast)(r.ToastStyle.Failure,"An error occurred while creating the Swift Playground");return}if(n.alreadyExists&&!o.open)return(0,r.showToast)(r.ToastStyle.Failure,"Swift Playground already exists");let i=["Swift Playground",n.alreadyExists?"opened":"created","at",x(n.path)].join(" ");if(o.open)try{await n.open(),await(0,r.showHUD)(i)}catch{await(0,r.showToast)(r.ToastStyle.Failure,"Swift Playground could not be opened")}else await(0,r.showToast)(r.ToastStyle.Success,i);e.pop()}var q=()=>{let o=new m,t=(0,L.useNavigation)();return j(o,t)};module.exports=R(B);0&&(module.exports={});
