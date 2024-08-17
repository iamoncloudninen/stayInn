// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery　
//= require jquery_ujs

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import { start } from "@rails/activestorage"
import "channels"
import $ from 'jquery';

   window.$ = $;
   window.jQuery = $;   

Rails.start()
Turbolinks.start()
start()

$(document).ready(function() {
    $("#user-menu").click(function() {
        $("#menu").toggle();
    });
}); 
