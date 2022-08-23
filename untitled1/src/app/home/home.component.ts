import { Component, OnInit } from '@angular/core';

// declare const myTest:any;
// import * as $ from "jquery";
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  homeSlider ={items:2, dots:true, nav:true};
  titleSlider={items:1, dots:true, nav:true};
  constructor() { }

  ngOnInit(): void {
    // let s = document.createElement("script");
    // s.type = "text/javascript";
    // s.src = "../path-to-your-js-or-external-URL";
    // this.body.nativeElement.appendChild(s);
    // myTest();
  }

}
