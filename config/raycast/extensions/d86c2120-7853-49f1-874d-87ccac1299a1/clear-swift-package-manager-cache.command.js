var p=Object.create;var t=Object.defineProperty;var f=Object.getOwnPropertyDescriptor;var w=Object.getOwnPropertyNames;var h=Object.getPrototypeOf,u=Object.prototype.hasOwnProperty;var l=e=>t(e,"__esModule",{value:!0});var y=(e,a)=>{l(e);for(var c in a)t(e,c,{get:a[c],enumerable:!0})},g=(e,a,c)=>{if(a&&typeof a=="object"||typeof a=="function")for(let i of w(a))!u.call(e,i)&&i!=="default"&&t(e,i,{get:()=>a[i],enumerable:!(c=f(a,i))||c.enumerable});return e},o=e=>g(l(t(e!=null?p(h(e)):{},"default",e&&e.__esModule&&"default"in e?{get:()=>e.default,enumerable:!0}:{value:e,enumerable:!0})),e);y(exports,{default:()=>v});var r=o(require("@raycast/api"));var d=o(require("child_process")),m=o(require("util")),s=(0,m.promisify)(d.exec);var n=class{clearDerivedData(){return s("rm -rf ~/Library/Developer/Xcode/DerivedData").then()}clearSwiftPackageManagerCache(){return s("rm -rf ~/Library/Caches/org.swift.swiftpm/repositories").then()}};var v=async()=>{let e=new n,a=await(0,r.showToast)(r.ToastStyle.Animated,"Please wait");try{await e.clearSwiftPackageManagerCache(),await a.hide(),await(0,r.showToast)(r.ToastStyle.Success,"Swift Package Manager cache successfully cleared")}catch(c){console.error(c),await a.hide(),await(0,r.showToast)(r.ToastStyle.Failure,"An error occurred while trying to clear the Swift Package Manager cache")}};0&&(module.exports={});
