import { Directive ,ElementRef,HostListener} from '@angular/core';

@Directive({
  selector: '[appNext]'
})
export class NextDirective {

  constructor(private el:ElementRef) {
    console.log(this.el.nativeElement.parentElement.parentElement.className);
  }

  @HostListener('click')
  NextFunc(){
    // console.log(this.el.nativeElement);
    let parentName =this.el.nativeElement.parentElement.parentElement.className;

    let elm= this.el.nativeElement.parentElement.parentElement.children[1];
    let items;
    //vi phan trong home va single page khac nhau nen phai lam vay
    if(parentName === "sn-related") {  //nếu lớp cha của lớp cha nó tên là sn-related( ở single page)
      items = elm.getElementsByClassName("col-md-4");
    }else{ //nếu lớp cha của lớp cha nó tên là col-md-6( ở home)
      items = elm.getElementsByClassName("col-md-6");
    }
    elm.append(items[0]);
    console.log(items);
  }
}
