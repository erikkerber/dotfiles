var E=Object.create;var f=Object.defineProperty;var N=Object.getOwnPropertyDescriptor;var X=Object.getOwnPropertyNames;var $=Object.getPrototypeOf,W=Object.prototype.hasOwnProperty;var P=o=>f(o,"__esModule",{value:!0});var H=(o,t)=>()=>(t||o((t={exports:{}}).exports,t),t.exports),M=(o,t)=>{P(o);for(var e in t)f(o,e,{get:t[e],enumerable:!0})},z=(o,t,e)=>{if(t&&typeof t=="object"||typeof t=="function")for(let r of X(t))!W.call(o,r)&&r!=="default"&&f(o,r,{get:()=>t[r],enumerable:!(e=N(t,r))||e.enumerable});return o},s=o=>z(P(f(o!=null?E($(o)):{},"default",o&&o.__esModule&&"default"in o?{get:()=>o.default,enumerable:!0}:{value:o,enumerable:!0})),o);var C=H((G,g)=>{"use strict";function R(o){var t=void 0;typeof o=="string"?t=[o]:t=o.raw;for(var e="",r=0;r<t.length;r++)e+=t[r].replace(/\\\n[ \t]*/g,"").replace(/\\`/g,"`"),r<(arguments.length<=1?0:arguments.length-1)&&(e+=arguments.length<=r+1?void 0:arguments[r+1]);var a=e.split(`
`),i=null;return a.forEach(function(p){var v=p.match(/^(\s+)\S+/);if(v){var S=v[1].length;i?i=Math.min(i,S):i=S}}),i!==null&&(e=a.map(function(p){return p[0]===" "?p.slice(i):p}).join(`
`)),e=e.trim(),e.replace(/\\n/g,`
`)}typeof g!="undefined"&&(g.exports=R)});M(exports,{default:()=>K});var F=s(require("child_process")),T=s(require("util")),w=(0,T.promisify)(F.exec);var O=s(require("os")),U=s(C());var l;(function(e){e.empty="empty",e.swiftUI="swiftUI"})(l||(l={}));var c=s(require("fs")),A=o=>c.default.promises.access(o,c.default.constants.F_OK).then(()=>!0).catch(()=>!1),Y=c.default.promises.readdir,x=c.default.promises.mkdir,k=c.default.promises.rm,D=c.default.promises.writeFile;var b=s(require("path"));function y(...o){return b.join(...o)}var m=class{constructor(){this.scaffoldTemplateFiles=[{name:"timeline",extension:"xctimeline",contents:`
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
      `}]}async createSwiftPlayground(t){let e=y(t.location.replace(/^~/,O.homedir()),`${t.name}.playground`);if(await A(e))return{name:t.name,path:e,alreadyExists:!0,open:()=>w(`open ${e}`).then()};await x(e);let r=[...this.scaffoldTemplateFiles,m.swiftSourceContentsTemplateFile(t.template),m.contentsTemplateFile(t.platform)];try{await Promise.all(r.map(async a=>{let i=e;a.path&&(i=y(i,a.path),await x(i)),i=y(i,[a.name,a.extension].join(".")),await D(i,(0,U.default)(a.contents))}))}catch(a){try{await k(e,{recursive:!0})}catch(i){console.error(i)}throw a}return{name:t.name,path:e,alreadyExists:!1,open:()=>w(`open ${e}`).then()}}static contentsTemplateFile(t){return{name:"contents",extension:"xcplayground",contents:`
      <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
      <playground version='5.0' 
                  target-platform='${t.toLocaleLowerCase()}' 
                  buildActiveScheme='true' 
                  executeOnSourceChanges='false' 
                  importAppTypes='true'>
          <timeline fileName='timeline.xctimeline'/>
      </playground>
      `}}static swiftSourceContentsTemplateFile(t){let e;switch(t){case l.empty:e=`import Foundation

`;break;case l.swiftUI:e=`
        import PlaygroundSupport
        import SwiftUI
        
        struct ContentView: View {
        
            var body: some View {
                Text("Hello World")
            }
            
        }
        
        PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
        `;break}return{name:"Contents",extension:"swift",contents:e}}};var L=s(require("@raycast/api"));var n=s(require("@raycast/api"));var d;(function(r){r.iOS="ios",r.macOS="macos",r.tvOS="tvos"})(d||(d={}));var u=s(require("path")),j=s(require("os")),I=j.default.homedir();function h(o){let t=u.default.normalize(o)+u.default.sep;return(t.startsWith(I)?t.replace(I+u.default.sep,`~${u.default.sep}`):t).slice(0,-1)}function V(o,t){return _jsx(n.Form,{actions:_jsx(n.ActionPanel,null,_jsx(n.SubmitFormAction,{title:"Create Swift Playground",onSubmit:e=>{J(e,o,t)}}))},_jsx(n.Form.TextField,{id:"name",title:"Name",defaultValue:"MyPlayground"}),_jsx(n.Form.TextField,{id:"location",title:"Location",defaultValue:"~/Desktop"}),_jsx(n.Form.Dropdown,{id:"platform",title:"Platform",defaultValue:d.iOS},Object.keys(d).map(e=>e.toLocaleLowerCase()).map(e=>_jsx(n.Form.Dropdown.Item,{key:e,value:e,title:e.replace("os","OS")}))),_jsx(n.Form.Dropdown,{id:"template",title:"Template",defaultValue:l.empty},Object.keys(l).map(e=>_jsx(n.Form.Dropdown.Item,{key:e,value:e,title:e.charAt(0).toUpperCase()+e.slice(1)}))),_jsx(n.Form.Checkbox,{id:"open",label:"Open in Xcode after creation",defaultValue:!0}))}async function J(o,t,e){let r;try{r=await t.createSwiftPlayground(o)}catch(i){console.log(i),await(0,n.showToast)(n.ToastStyle.Failure,"An error occurred while creating the Swift Playground");return}if(r.alreadyExists&&!o.open)return(0,n.showToast)(n.ToastStyle.Failure,"Swift Playground already exists");let a=["Swift Playground",r.alreadyExists?"opened":"created","at",h(r.path)].join(" ");if(o.open)try{await r.open(),await(0,n.showHUD)(a)}catch{await(0,n.showToast)(n.ToastStyle.Failure,"Swift Playground could not be opened")}else await(0,n.showToast)(n.ToastStyle.Success,a);e.pop()}var K=()=>{let o=new m,t=(0,L.useNavigation)();return V(o,t)};0&&(module.exports={});
