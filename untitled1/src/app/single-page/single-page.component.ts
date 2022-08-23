import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-single-page',
  templateUrl: './single-page.component.html',
  styleUrls: ['./single-page.component.scss']
})
export class SinglePageComponent implements OnInit {

  homeSlider ={items:3, dots:true, nav:true};
  constructor() { }

  ngOnInit(): void {
  }

}
