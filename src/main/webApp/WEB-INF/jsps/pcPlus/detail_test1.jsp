<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贝睿科技-金融智能求职专家</title>
    <link rel="stylesheet" href="${path}/resources/pcPlus/css/style.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap.css">
    <link rel="stylesheet" href="${path}/resources/pcPlus/bootstrap-3.4.1/dist/css/bootstrap-theme.css">
    <script src="${path}/resources/pcPlus/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/pc/js/jquery-2.1.0.min.js"></script>
    <script src="${path}/resources/layui/layui.js"></script>
    <script src="${path}/resources/pcPlus/bootstrap-3.4.1/dist/js/bootstrap.js"></script>
    <script src="${path}/resources/pcPlus/js/main.js"></script>
    <%--swiper--%>
    <script src="${path}/resources/swiper/dist/js/swiper.min.js"></script>


</head>
<style type="text/css">
    .font_a a {
        font-weight: bold;
        display: inline-block;
        position: relative;
        left: 32px;
    }

    .header img {
        width: 100px;
        position: absolute;
        top: 8px;
        left: 7.8%;
    }

    .h_search {
        position: absolute;
        top: 3px;
        left: 69%;
        display: inline-block;
        width: 210px;
        height: 66px;
    }

    .h_search_text {
        outline: none;
        width: 253px;
        height: 34px;
        line-height: 34px;
        padding: 0 40px 0 10px;
        background: white;
        color: black;
    }

    .swiper-container {
        width: 100%;
        height: 100%;
    }


    .swiper-container {
        margin: 0 auto;
        position: relative;
        overflow: hidden;
        list-style: none;
        padding: 0;
        /* Fix of Webkit flickering */
        z-index: 1;
    }

    .swiper-container-no-flexbox .swiper-slide {
        float: left;
    }

    .swiper-container-vertical > .swiper-wrapper {
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
    }

    .swiper-wrapper {
        position: relative;
        width: 100%;
        height: 100%;
        z-index: 1;
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-transition-property: -webkit-transform;
        transition-property: -webkit-transform;
        -o-transition-property: transform;
        transition-property: transform;
        transition-property: transform, -webkit-transform;
        -webkit-box-sizing: content-box;
        box-sizing: content-box;
    }

    .swiper-container-android .swiper-slide,
    .swiper-wrapper {
        -webkit-transform: translate3d(0px, 0, 0);
        transform: translate3d(0px, 0, 0);
    }

    .swiper-container-multirow > .swiper-wrapper {
        -webkit-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
    }

    .swiper-container-free-mode > .swiper-wrapper {
        -webkit-transition-timing-function: ease-out;
        -o-transition-timing-function: ease-out;
        transition-timing-function: ease-out;
        margin: 0 auto;
    }

    .swiper-slide {
        -webkit-flex-shrink: 0;
        -ms-flex-negative: 0;
        flex-shrink: 0;
        width: 100%;
        height: 100%;
        position: relative;
        -webkit-transition-property: -webkit-transform;
        transition-property: -webkit-transform;
        -o-transition-property: transform;
        transition-property: transform;
        transition-property: transform, -webkit-transform;
    }

    .swiper-slide-invisible-blank {
        visibility: hidden;
    }

    /* Auto Height */
    .swiper-container-autoheight,
    .swiper-container-autoheight .swiper-slide {
        height: auto;
    }

    .swiper-container-autoheight .swiper-wrapper {
        -webkit-box-align: start;
        -webkit-align-items: flex-start;
        -ms-flex-align: start;
        align-items: flex-start;
        -webkit-transition-property: height, -webkit-transform;
        transition-property: height, -webkit-transform;
        -o-transition-property: transform, height;
        transition-property: transform, height;
        transition-property: transform, height, -webkit-transform;
    }

    /* 3D Effects */
    .swiper-container-3d {
        -webkit-perspective: 1200px;
        perspective: 1200px;
    }

    .swiper-container-3d .swiper-wrapper,
    .swiper-container-3d .swiper-slide,
    .swiper-container-3d .swiper-slide-shadow-left,
    .swiper-container-3d .swiper-slide-shadow-right,
    .swiper-container-3d .swiper-slide-shadow-top,
    .swiper-container-3d .swiper-slide-shadow-bottom,
    .swiper-container-3d .swiper-cube-shadow {
        -webkit-transform-style: preserve-3d;
        transform-style: preserve-3d;
    }

    .swiper-container-3d .swiper-slide-shadow-left,
    .swiper-container-3d .swiper-slide-shadow-right,
    .swiper-container-3d .swiper-slide-shadow-top,
    .swiper-container-3d .swiper-slide-shadow-bottom {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: 10;
    }

    .swiper-container-3d .swiper-slide-shadow-left {
        background-image: -webkit-gradient(linear, right top, left top, from(rgba(0, 0, 0, 0.5)), to(rgba(0, 0, 0, 0)));
        background-image: -webkit-linear-gradient(right, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
        background-image: -o-linear-gradient(right, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
        background-image: linear-gradient(to left, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
    }

    .swiper-container-3d .swiper-slide-shadow-right {
        background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, 0.5)), to(rgba(0, 0, 0, 0)));
        background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
        background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
        background-image: linear-gradient(to right, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
    }

    .swiper-container-3d .swiper-slide-shadow-top {
        background-image: -webkit-gradient(linear, left bottom, left top, from(rgba(0, 0, 0, 0.5)), to(rgba(0, 0, 0, 0)));
        background-image: -webkit-linear-gradient(bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
        background-image: -o-linear-gradient(bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
        background-image: linear-gradient(to top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
    }

    .swiper-container-3d .swiper-slide-shadow-bottom {
        background-image: -webkit-gradient(linear, left top, left bottom, from(rgba(0, 0, 0, 0.5)), to(rgba(0, 0, 0, 0)));
        background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
        background-image: -o-linear-gradient(top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
        background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0));
    }

    /* IE10 Windows Phone 8 Fixes */
    .swiper-container-wp8-horizontal,
    .swiper-container-wp8-horizontal > .swiper-wrapper {
        -ms-touch-action: pan-y;
        touch-action: pan-y;
    }

    .swiper-container-wp8-vertical,
    .swiper-container-wp8-vertical > .swiper-wrapper {
        -ms-touch-action: pan-x;
        touch-action: pan-x;
    }

    .swiper-button-prev,
    .swiper-button-next {
        position: absolute;
        top: 50%;
        width: 27px;
        height: 44px;
        margin-top: -22px;
        z-index: 10;
        cursor: pointer;
        background-size: 27px 44px;
        background-position: center;
        background-repeat: no-repeat;
    }

    .swiper-button-prev.swiper-button-disabled,
    .swiper-button-next.swiper-button-disabled {
        opacity: 0.35;
        cursor: auto;
        pointer-events: none;
    }

    .swiper-button-prev,
    .swiper-container-rtl .swiper-button-next {
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23007aff'%2F%3E%3C%2Fsvg%3E");
        left: 10px;
        right: auto;
    }

    .swiper-button-next,
    .swiper-container-rtl .swiper-button-prev {
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23007aff'%2F%3E%3C%2Fsvg%3E");
        right: 10px;
        left: auto;
    }

    .swiper-button-prev.swiper-button-white,
    .swiper-container-rtl .swiper-button-next.swiper-button-white {
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
    }

    .swiper-button-next.swiper-button-white,
    .swiper-container-rtl .swiper-button-prev.swiper-button-white {
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23ffffff'%2F%3E%3C%2Fsvg%3E");
    }

    .swiper-button-prev.swiper-button-black,
    .swiper-container-rtl .swiper-button-next.swiper-button-black {
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M0%2C22L22%2C0l2.1%2C2.1L4.2%2C22l19.9%2C19.9L22%2C44L0%2C22L0%2C22L0%2C22z'%20fill%3D'%23000000'%2F%3E%3C%2Fsvg%3E");
    }

    .swiper-button-next.swiper-button-black,
    .swiper-container-rtl .swiper-button-prev.swiper-button-black {
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20viewBox%3D'0%200%2027%2044'%3E%3Cpath%20d%3D'M27%2C22L27%2C22L5%2C44l-2.1-2.1L22.8%2C22L2.9%2C2.1L5%2C0L27%2C22L27%2C22z'%20fill%3D'%23000000'%2F%3E%3C%2Fsvg%3E");
    }

    .swiper-button-lock {
        display: none;
    }

    .swiper-pagination {
        position: absolute;
        text-align: center;
        -webkit-transition: 300ms opacity;
        -o-transition: 300ms opacity;
        transition: 300ms opacity;
        -webkit-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
        z-index: 10;
    }

    .swiper-pagination.swiper-pagination-hidden {
        opacity: 0;
    }

    /* Common Styles */
    .swiper-pagination-fraction,
    .swiper-pagination-custom,
    .swiper-container-horizontal > .swiper-pagination-bullets {
        bottom: 10px;
        left: 0;
        width: 100%;
    }

    /* Bullets */
    .swiper-pagination-bullets-dynamic {
        overflow: hidden;
        font-size: 0;
    }

    .swiper-pagination-bullets-dynamic .swiper-pagination-bullet {
        -webkit-transform: scale(0.33);
        -ms-transform: scale(0.33);
        transform: scale(0.33);
        position: relative;
    }

    .swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active {
        -webkit-transform: scale(1);
        -ms-transform: scale(1);
        transform: scale(1);
    }

    .swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-main {
        -webkit-transform: scale(1);
        -ms-transform: scale(1);
        transform: scale(1);
    }

    .swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-prev {
        -webkit-transform: scale(0.66);
        -ms-transform: scale(0.66);
        transform: scale(0.66);
    }

    .swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-prev-prev {
        -webkit-transform: scale(0.33);
        -ms-transform: scale(0.33);
        transform: scale(0.33);
    }

    .swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-next {
        -webkit-transform: scale(0.66);
        -ms-transform: scale(0.66);
        transform: scale(0.66);
    }

    .swiper-pagination-bullets-dynamic .swiper-pagination-bullet-active-next-next {
        -webkit-transform: scale(0.33);
        -ms-transform: scale(0.33);
        transform: scale(0.33);
    }

    .swiper-pagination-bullet {
        width: 8px;
        height: 8px;
        display: inline-block;
        border-radius: 100%;
        background: #000;
        opacity: 0.2;
    }

    button.swiper-pagination-bullet {
        border: none;
        margin: 0;
        padding: 0;
        -webkit-box-shadow: none;
        box-shadow: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }

    .swiper-pagination-clickable .swiper-pagination-bullet {
        cursor: pointer;
    }

    .swiper-pagination-bullet-active {
        opacity: 1;
        background: #007aff;
    }

    .swiper-container-vertical > .swiper-pagination-bullets {
        right: 10px;
        top: 50%;
        -webkit-transform: translate3d(0px, -50%, 0);
        transform: translate3d(0px, -50%, 0);
    }

    .swiper-container-vertical > .swiper-pagination-bullets .swiper-pagination-bullet {
        margin: 6px 0;
        display: block;
    }

    .swiper-container-vertical > .swiper-pagination-bullets.swiper-pagination-bullets-dynamic {
        top: 50%;
        -webkit-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        transform: translateY(-50%);
        width: 8px;
    }

    .swiper-container-vertical > .swiper-pagination-bullets.swiper-pagination-bullets-dynamic .swiper-pagination-bullet {
        display: inline-block;
        -webkit-transition: 200ms top, 200ms -webkit-transform;
        transition: 200ms top, 200ms -webkit-transform;
        -o-transition: 200ms transform, 200ms top;
        transition: 200ms transform, 200ms top;
        transition: 200ms transform, 200ms top, 200ms -webkit-transform;
    }

    .swiper-container-horizontal > .swiper-pagination-bullets .swiper-pagination-bullet {
        margin: 0 4px;
    }

    .swiper-container-horizontal > .swiper-pagination-bullets.swiper-pagination-bullets-dynamic {
        left: 50%;
        -webkit-transform: translateX(-50%);
        -ms-transform: translateX(-50%);
        transform: translateX(-50%);
        white-space: nowrap;
    }

    .swiper-container-horizontal > .swiper-pagination-bullets.swiper-pagination-bullets-dynamic .swiper-pagination-bullet {
        -webkit-transition: 200ms left, 200ms -webkit-transform;
        transition: 200ms left, 200ms -webkit-transform;
        -o-transition: 200ms transform, 200ms left;
        transition: 200ms transform, 200ms left;
        transition: 200ms transform, 200ms left, 200ms -webkit-transform;
    }

    .swiper-container-horizontal.swiper-container-rtl > .swiper-pagination-bullets-dynamic .swiper-pagination-bullet {
        -webkit-transition: 200ms right, 200ms -webkit-transform;
        transition: 200ms right, 200ms -webkit-transform;
        -o-transition: 200ms transform, 200ms right;
        transition: 200ms transform, 200ms right;
        transition: 200ms transform, 200ms right, 200ms -webkit-transform;
    }

    /* Progress */
    .swiper-pagination-progressbar {
        background: rgba(0, 0, 0, 0.25);
        position: absolute;
    }

    .swiper-pagination-progressbar .swiper-pagination-progressbar-fill {
        background: #007aff;
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        -webkit-transform: scale(0);
        -ms-transform: scale(0);
        transform: scale(0);
        -webkit-transform-origin: left top;
        -ms-transform-origin: left top;
        transform-origin: left top;
    }

    .swiper-container-rtl .swiper-pagination-progressbar .swiper-pagination-progressbar-fill {
        -webkit-transform-origin: right top;
        -ms-transform-origin: right top;
        transform-origin: right top;
    }

    .swiper-container-horizontal > .swiper-pagination-progressbar,
    .swiper-container-vertical > .swiper-pagination-progressbar.swiper-pagination-progressbar-opposite {
        width: 100%;
        height: 4px;
        left: 0;
        top: 0;
    }

    .swiper-container-vertical > .swiper-pagination-progressbar,
    .swiper-container-horizontal > .swiper-pagination-progressbar.swiper-pagination-progressbar-opposite {
        width: 4px;
        height: 100%;
        left: 0;
        top: 0;
    }

    .swiper-pagination-white .swiper-pagination-bullet-active {
        background: #ffffff;
    }

    .swiper-pagination-progressbar.swiper-pagination-white {
        background: rgba(255, 255, 255, 0.25);
    }

    .swiper-pagination-progressbar.swiper-pagination-white .swiper-pagination-progressbar-fill {
        background: #ffffff;
    }

    .swiper-pagination-black .swiper-pagination-bullet-active {
        background: #000000;
    }

    .swiper-pagination-progressbar.swiper-pagination-black {
        background: rgba(0, 0, 0, 0.25);
    }

    .swiper-pagination-progressbar.swiper-pagination-black .swiper-pagination-progressbar-fill {
        background: #000000;
    }

    .swiper-pagination-lock {
        display: none;
    }

    /* Scrollbar */
    .swiper-scrollbar {
        border-radius: 10px;
        position: relative;
        -ms-touch-action: none;
        background: rgba(0, 0, 0, 0.1);
    }

    .swiper-container-horizontal > .swiper-scrollbar {
        position: absolute;
        left: 1%;
        bottom: 3px;
        z-index: 50;
        height: 5px;
        width: 98%;
    }

    .swiper-container-vertical > .swiper-scrollbar {
        position: absolute;
        right: 3px;
        top: 1%;
        z-index: 50;
        width: 5px;
        height: 98%;
    }

    .swiper-scrollbar-drag {
        height: 100%;
        width: 100%;
        position: relative;
        background: rgba(0, 0, 0, 0.5);
        border-radius: 10px;
        left: 0;
        top: 0;
    }

    .swiper-scrollbar-cursor-drag {
        cursor: move;
    }

    .swiper-scrollbar-lock {
        display: none;
    }

    .swiper-zoom-container {
        width: 100%;
        height: 100%;
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: center;
        -webkit-justify-content: center;
        -ms-flex-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -ms-flex-align: center;
        align-items: center;
        text-align: center;
    }

    .swiper-zoom-container > img,
    .swiper-zoom-container > svg,
    .swiper-zoom-container > canvas {
        max-width: 100%;
        max-height: 100%;
        -o-object-fit: contain;
        object-fit: contain;
    }

    .swiper-slide-zoomed {
        cursor: move;
    }

    /* Preloader */
    .swiper-lazy-preloader {
        width: 42px;
        height: 42px;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -21px;
        margin-top: -21px;
        z-index: 10;
        -webkit-transform-origin: 50%;
        -ms-transform-origin: 50%;
        transform-origin: 50%;
        -webkit-animation: swiper-preloader-spin 1s steps(12, end) infinite;
        animation: swiper-preloader-spin 1s steps(12, end) infinite;
    }

    .swiper-lazy-preloader:after {
        display: block;
        content: '';
        width: 100%;
        height: 100%;
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%236c6c6c'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E");
        background-position: 50%;
        background-size: 100%;
        background-repeat: no-repeat;
    }

    .swiper-lazy-preloader-white:after {
        background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20viewBox%3D'0%200%20120%20120'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg'%20xmlns%3Axlink%3D'http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink'%3E%3Cdefs%3E%3Cline%20id%3D'l'%20x1%3D'60'%20x2%3D'60'%20y1%3D'7'%20y2%3D'27'%20stroke%3D'%23fff'%20stroke-width%3D'11'%20stroke-linecap%3D'round'%2F%3E%3C%2Fdefs%3E%3Cg%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(30%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(60%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(90%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(120%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.27'%20transform%3D'rotate(150%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.37'%20transform%3D'rotate(180%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.46'%20transform%3D'rotate(210%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.56'%20transform%3D'rotate(240%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.66'%20transform%3D'rotate(270%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.75'%20transform%3D'rotate(300%2060%2C60)'%2F%3E%3Cuse%20xlink%3Ahref%3D'%23l'%20opacity%3D'.85'%20transform%3D'rotate(330%2060%2C60)'%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E");
    }

    @-webkit-keyframes swiper-preloader-spin {
        100% {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }

    @keyframes swiper-preloader-spin {
        100% {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }

    /* a11y */
    .swiper-container .swiper-notification {
        position: absolute;
        left: 0;
        top: 0;
        pointer-events: none;
        opacity: 0;
        z-index: -1000;
    }

    .swiper-container-fade.swiper-container-free-mode .swiper-slide {
        -webkit-transition-timing-function: ease-out;
        -o-transition-timing-function: ease-out;
        transition-timing-function: ease-out;
    }

    .swiper-container-fade .swiper-slide {
        pointer-events: none;
        -webkit-transition-property: opacity;
        -o-transition-property: opacity;
        transition-property: opacity;
    }

    .swiper-container-fade .swiper-slide .swiper-slide {
        pointer-events: none;
    }

    .swiper-container-fade .swiper-slide-active,
    .swiper-container-fade .swiper-slide-active .swiper-slide-active {
        pointer-events: auto;
    }

    .swiper-container-cube {
        overflow: visible;
    }

    .swiper-container-cube .swiper-slide {
        pointer-events: none;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
        z-index: 1;
        visibility: hidden;
        -webkit-transform-origin: 0 0;
        -ms-transform-origin: 0 0;
        transform-origin: 0 0;
        width: 100%;
        height: 100%;
    }

    .swiper-container-cube .swiper-slide .swiper-slide {
        pointer-events: none;
    }

    .swiper-container-cube.swiper-container-rtl .swiper-slide {
        -webkit-transform-origin: 100% 0;
        -ms-transform-origin: 100% 0;
        transform-origin: 100% 0;
    }

    .swiper-container-cube .swiper-slide-active,
    .swiper-container-cube .swiper-slide-active .swiper-slide-active {
        pointer-events: auto;
    }

    .swiper-container-cube .swiper-slide-active,
    .swiper-container-cube .swiper-slide-next,
    .swiper-container-cube .swiper-slide-prev,
    .swiper-container-cube .swiper-slide-next + .swiper-slide {
        pointer-events: auto;
        visibility: visible;
    }

    .swiper-container-cube .swiper-slide-shadow-top,
    .swiper-container-cube .swiper-slide-shadow-bottom,
    .swiper-container-cube .swiper-slide-shadow-left,
    .swiper-container-cube .swiper-slide-shadow-right {
        z-index: 0;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .swiper-container-cube .swiper-cube-shadow {
        position: absolute;
        left: 0;
        bottom: 0px;
        width: 100%;
        height: 100%;
        background: #000;
        opacity: 0.6;
        -webkit-filter: blur(50px);
        filter: blur(50px);
        z-index: 0;
    }

    .swiper-container-flip {
        overflow: visible;
    }

    .swiper-container-flip .swiper-slide {
        pointer-events: none;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
        z-index: 1;
    }

    .swiper-container-flip .swiper-slide .swiper-slide {
        pointer-events: none;
    }

    .swiper-container-flip .swiper-slide-active,
    .swiper-container-flip .swiper-slide-active .swiper-slide-active {
        pointer-events: auto;
    }

    .swiper-container-flip .swiper-slide-shadow-top,
    .swiper-container-flip .swiper-slide-shadow-bottom,
    .swiper-container-flip .swiper-slide-shadow-left,
    .swiper-container-flip .swiper-slide-shadow-right {
        z-index: 0;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .swiper-container-coverflow .swiper-wrapper {
        /* Windows 8 IE 10 fix */
        -ms-perspective: 1200px;
    }

</style>

<body>
<div class="kj_a">
    <%@ include file="include_head.jsp" %>
    <div class="container" id="container" style="height: 670px;">
        <div class="wrapper">
            <section style="width: 720px" class="detail_con_m test1_r">
                <h2>贝睿性格测试</h2>
                <p>这是一份来自专业金融职前培训机构贝睿的一份基于性格色彩学的测试,它有助于测试者深入了解自己深层次性格,从而帮助自己得到更好的职业定位.</p>
                <p>[本测试共30道题目,请您根据第一感觉作答,现在就开始吧]</p>
                <div class="test_con_btn" style="width: 700px;">
                    <%-- <span id="last" class="glyphicon  glyphicon-chevron-left"></span>
                     <span id="next" class="glyphicon glyphicon-chevron-right"></span>--%>
                    <form action="" id="formTest" class="form-header-group_3">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">

                                    <ul>
                                        <li>
                                            <p>1.当我们还是孩子的时候,我:</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_1_1" name="item_1" value="更喜欢和熟悉的伙伴玩耍">更喜欢和熟悉的伙伴玩耍 <br>
                                        </li>
                                        <li><input type="radio" id="item_1_2" name="item_1" value="是孩子王，大家经常听我的决定">是孩子王，大家经常听我的决定<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_1_3" name="item_1" value="羞于见生人，会有意识地回避">羞于见生人，会有意识地回避<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_1_4" name="item_1" value="乐观积极、调皮可爱">乐观积极、调皮可爱<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>2. 如果我是父母，也许我是：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_2_1" name="item_2" value="对孩子宽容、可以听得进去孩子的意见和建议">对孩子宽容、可以听得进去孩子的意见和建议 <br>
                                        </li>
                                        <li><input type="radio" id="item_2_2" name="item_2" value="在孩子面前保持威严，说一不二">在孩子面前保持威严，说一不二<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_2_3" name="item_2" value="会对孩子有要求，同时会坚持自己的想法 ">会对孩子有要求，同时会坚持自己的想法<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_2_4" name="item_2" value="像个大孩子一样，融入到孩子中去">像个大孩子一样，融入到孩子中去<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>3. 面对他人对自己的赞美：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_3_1" name="item_3" value="无所谓，不会因为别人赞美而有情绪波动">无所谓，不会因为别人赞美而有情绪波动<br>
                                        </li>
                                        <li><input type="radio" id="item_3_2" name="item_3" value="我更在乎对方是否欣赏我的能力，不需要无关痛痒的赞美">我更在乎对方是否欣赏我的能力，不需要无关痛痒的赞美<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_3_3" name="item_3" value="怀疑赞美是否出自真心，或者会刻意逃避众人的注意 ">怀疑赞美是否出自真心，或者会刻意逃避众人的注意<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_3_4" name="item_3" value="很开心，溢美之词让人感到愉悦">很开心，溢美之词让人感到愉悦<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>4. 在帮助他人的问题上，我的内心想法是：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_4_1" name="item_4" value="无所谓，不会因为别人赞美而有情绪波动">无所谓，不会因为别人赞美而有情绪波动<br>
                                        </li>
                                        <li><input type="radio" id="item_4_2" name="item_4" value="我更在乎对方是否欣赏我的能力，不需要无关痛痒的赞美">我更在乎对方是否欣赏我的能力，不需要无关痛痒的赞美<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_4_3" name="item_4" value="怀疑赞美是否出自真心，或者会刻意逃避众人的注意 ">怀疑赞美是否出自真心，或者会刻意逃避众人的注意<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_4_4" name="item_4" value="很开心，溢美之词让人感到愉悦">很开心，溢美之词让人感到愉悦<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>5 . 对于规则，我内心的态度是：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_5_1" name="item_5" value="不愿违反规则，但可能因为松散而无法达到规则的要求">不愿违反规则，但可能因为松散而无法达到规则的要求 <br>
                                        </li>
                                        <li><input type="radio" id="item_5_2" name="item_5" value="倾向打破规则，希望由自己来制定规则而不是遵守规则">倾向打破规则，希望由自己来制定规则而不是遵守规则<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_5_3" name="item_5" value="严格遵守规则，并且竭尽全力做到规则内的最好 ">严格遵守规则，并且竭尽全力做到规则内的最好<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_5_4" name="item_5" value="不喜欢被规则约束，不按规则出牌会觉得新鲜有趣">不喜欢被规则约束，不按规则出牌会觉得新鲜有趣<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>6. 面对生活，我更像 ：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_6_1" name="item_6" value="平和派：我自己觉得不错就可以，不用考虑外面的世界如何">平和派：我自己觉得不错就可以，不用考虑外面的世界如何 <br>
                                        </li>
                                        <li><input type="radio" id="item_6_2" name="item_6" value="上进派：不进则退，必须保持进步">上进派：不进则退，必须保持进步<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_6_3" name="item_6" value="小心翼翼派：未雨绸缪，最好在问题未发生之前想好所有可能 ">小心翼翼派：未雨绸缪，最好在问题未发生之前想好所有可能<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_6_4" name="item_6" value="乐天派：活在当下、过好每一天最重要">乐天派：活在当下、过好每一天最重要<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>7. 我认为自己在行为上的基本特点是：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_7_1" name="item_7" value="慢条斯理，按部就班，能与周围的人协调一致">慢条斯理，按部就班，能与周围的人协调一致<br>
                                        </li>
                                        <li><input type="radio" id="item_7_2" name="item_7" value="目标明确，集中精力，为实现目标而努力，善于抓住核心要点">目标明确，集中精力，为实现目标而努力，善于抓住核心要点<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_7_3" name="item_7" value="慎重小心，为做好预防及善后，会不惜一切而尽心操劳 ">慎重小心，为做好预防及善后，会不惜一切而尽心操劳<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_7_4" name="item_7" value="丰富跃动，不喜欢制度和约束，倾向于快速反应">丰富跃动，不喜欢制度和约束，倾向于快速反应<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>8. 当我做错事时，我倾向于：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_8_1" name="item_8" value="害怕，但表面不露声色">害怕，但表面不露声色 <br>
                                        </li>
                                        <li><input type="radio" id="item_8_2" name="item_8" value="内心已经明白是自己的问题，但总是不愿承认、总是辩驳">内心已经明白是自己的问题，但总是不愿承认、总是辩驳<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_8_3" name="item_8" value="很长时间内都会感到愧疚、痛苦、压抑 ">很长时间内都会感到愧疚、痛苦、压抑<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_8_4" name="item_8" value="希望逃避批评，感到十分难为情">希望逃避批评，感到十分难为情<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>9. 当结束一段刻骨铭心的感情时，我会：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_9_1" name="item_9" value="很难过，只能靠时间治愈">很难过，只能靠时间治愈<br>
                                        </li>
                                        <li><input type="radio" id="item_9_2" name="item_9" value="即使很受伤，也要努力把过去的影子甩掉">即使很受伤，也要努力把过去的影子甩掉<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_9_3" name="item_9" value="深陷在悲伤的情绪中，在相当长的时期里难以自拔，也不愿再接受新的人">深陷在悲伤的情绪中，在相当长的时期里难以自拔，也不愿再接受新的人<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_9_4" name="item_9" value="痛不欲生，但可以通过倾诉或其他发泄渠道得以缓解">痛不欲生，但可以通过倾诉或其他发泄渠道得以缓解<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>10. 面对他人的倾诉，我基本上： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_10_1" name="item_10" value="比较有同理心，基本能够认同并理解对方的感受">比较有同理心，基本能够认同并理解对方的感受 <br>
                                        </li>
                                        <li><input type="radio" id="item_10_2" name="item_10" value="总是可以快速做出定论或判断">总是可以快速做出定论或判断<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_10_3" name="item_10" value="通过分析和推理，帮助对方厘清思路">通过分析和推理，帮助对方厘清思路<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_10_4" name="item_10" value="可能会随着他的情绪起伏而起伏，也会发表一些评论或意见">可能会随着他的情绪起伏而起伏，也会发表一些评论或意见<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>11. 我在以下哪个群体中交流较感满足？ </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_11_1" name="item_11" value="轻松惬意的氛围中，大家心平气和地达成共识，即便结论并不具有指导意义">轻松惬意的氛围中，大家心平气和地达成共识，即便结论并不具有指导意义
                                            <br>
                                        </li>
                                        <li><input type="radio" id="item_11_2" name="item_11" value="彼此展开充分激烈的辩论并有收获">彼此展开充分激烈的辩论并有收获<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_11_3" name="item_11" value="详细地探讨各种因素的影响和利弊">详细地探讨各种因素的影响和利弊<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_11_4" name="item_11" value="很开心并且随意无拘束地闲谈">很开心并且随意无拘束地闲谈<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>12. 在内心的真实想法里，我觉得工作: </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_12_1" name="item_12" value="做熟悉、有能力完成的工作就好，没必要搞太大压力">做熟悉、有能力完成的工作就好，没必要搞太大压力<br>
                                        </li>
                                        <li><input type="radio" id="item_12_2" name="item_12" value="应该以最快的速度完成，且争取去完成更多的任务">应该以最快的速度完成，且争取去完成更多的任务<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_12_3" name="item_12" value="只要决定做，必须做好，否则不如不做">只要决定做，必须做好，否则不如不做<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_12_4" name="item_12" value="工作必须好玩，做不喜欢的工作太痛苦了">工作必须好玩，做不喜欢的工作太痛苦了见<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>13. 如果我是领导，我希望下属这么评价我： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_13_1" name="item_13" value="可以亲近的、时常为下属着想的">可以亲近的、时常为下属着想的 <br>
                                        </li>
                                        <li><input type="radio" id="item_13_2" name="item_13" value="有很强的能力和富有领导力的">有很强的能力和富有领导力的<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_13_3" name="item_13" value="强调公平、公正对待员工、可信赖">强调公平、公正对待员工、可信赖<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_13_4" name="item_13" value="富有感染力，深受下属喜欢">富有感染力，深受下属喜欢<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>14. 我对认同的需求是： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_14_1" name="item_14" value="无论如何生活都将继续，与别人是否认同无关">无论如何生活都将继续，与别人是否认同无关 <br>
                                        </li>
                                        <li><input type="radio" id="item_14_2" name="item_14" value="英群体认同就好了，其他人群不重要">英群体认同就好了，其他人群不重要<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_14_3" name="item_14" value="我在乎的人认同就好，其他人的观点无所谓">我在乎的人认同就好，其他人的观点无所谓<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_14_4" name="item_14" value="希望所有人都能认同我">希望所有人都能认同我<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>15. 以下有四组格言，哪组整体上最符合我的感觉：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_15_1" name="item_15" value="最深刻的真理是最简单和最平凡的；知足是人生最大的幸福">最深刻的真理是最简单和最平凡的；知足是人生最大的幸福<br>
                                        </li>
                                        <li><input type="radio" id="item_15_2" name="item_15"
                                                   value="走自己的路，让人家去说吧；有所成就是人生唯一的真正的乐趣">走自己的路，让人家去说吧；有所成就是人生唯一的真正的乐趣<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_15_3" name="item_15" value="一个不注意小事情的人，永远不会成功大事业；谨慎比大胆要有力量得多">一个不注意小事情的人，永远不会成功大事业；谨慎比大胆要有力量得多<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_15_4" name="item_15"
                                                   value="幸福在于对生命的喜悦和激情；任何时候都要最真实地对待你自己，这比什么都重要">幸福在于对生命的喜悦和激情；任何时候都要最真实地对待你自己，这比什么都重要<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>16. 朋友一般倾向于这么评价我： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_16_1" name="item_16" value="喜欢与朋友交流、倾诉，也有一定的感染力">喜欢与朋友交流、倾诉，也有一定的感染力 <br>
                                        </li>
                                        <li><input type="radio" id="item_16_2" name="item_16" value="能够提出很多周全的问题，而且会提供精细的解说">能够提出很多周全的问题，而且会提供精细的解说<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_16_3" name="item_16" value="敢于直言，会直率而犀利地谈论不喜欢的人、事、物">敢于直言，会直率而犀利地谈论不喜欢的人、事、物<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_16_4" name="item_16" value="比较沉默，通常是倾听者">比较沉默，通常是倾听者<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>17. 我过往的老师最有可能这么评价我： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_17_1" name="item_17" value="善于表达和抒发感情，情绪波动较大">善于表达和抒发感情，情绪波动较大 <br>
                                        </li>
                                        <li><input type="radio" id="item_17_2" name="item_17" value="不够合群，注重自己的隐私，独来独往">不够合群，注重自己的隐私，独来独往<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_17_3" name="item_17" value="强调自己的兴趣，行为习惯敏捷独立">强调自己的兴趣，行为习惯敏捷独立<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_17_4" name="item_17" value="比较温和稳定、看起来反应较慢">比较温和稳定、看起来反应较慢<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>18. 在工作上，我表现出来更多的是： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_18_1" name="item_18" value="充满热情、创意，有很多想法，显得很机灵">充满热情、创意，有很多想法，显得很机灵 <br>
                                        </li>
                                        <li><input type="radio" id="item_18_2" name="item_18" value="为人可靠、心思细腻，细节的工作表现得更好">为人可靠、心思细腻，细节的工作表现得更好<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_18_3" name="item_18" value="有推动力，做事直截了当、干脆利落">有推动力，做事直截了当、干脆利落<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_18_4" name="item_18" value="擅于协调，有耐心、适应能力强">擅于协调，有耐心、适应能力强<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>19. 在人际关系上，我最在意的是： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_19_1" name="item_19" value="得到他人的赞美和欢迎">得到他人的赞美和欢迎 <br>
                                        </li>
                                        <li><input type="radio" id="item_19_2" name="item_19" value="得到他人的理解和欣赏">得到他人的理解和欣赏<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_19_3" name="item_19" value="得到他人的感激和尊敬">得到他人的感激和尊敬<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_19_4" name="item_19" value="得到他人的认可和接纳">得到他人的认可和接纳<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>20. 如果有人深深惹恼我时，我会：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_20_1" name="item_20" value="内心感到受伤，但最终很多时候还是会原谅对方">内心感到受伤，但最终很多时候还是会原谅对方 <br>
                                        </li>
                                        <li><input type="radio" id="item_20_2" name="item_20" value="深深感到愤怒，我会牢记、未来一定会远离那个家伙">深深感到愤怒，我会牢记、未来一定会远离那个家伙<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_20_3" name="item_20" value="会火冒三丈，并且内心期待有机会狠狠回应">会火冒三丈，并且内心期待有机会狠狠回应<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_20_4" name="item_20" value="避免摊牌，因为还不到那个地步或者自己再去找新朋友">避免摊牌，因为还不到那个地步或者自己再去找新朋友<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>21. 通常我完成任务的方式是： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_21_1" name="item_21" value="截止日代表生产力，我一般都拖到最后完成">截止日代表生产力，我一般都拖到最后完成 <br>
                                        </li>
                                        <li><input type="radio" id="item_21_2" name="item_21" value="按照自己的程序严格执行，注重细节，不愿意麻烦别人">按照自己的程序严格执行，注重细节，不愿意麻烦别人<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_21_3" name="item_21" value="先做，快速做">先做，快速做<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_21_4" name="item_21" value="使用传统的方法按部就班，需要时从他人处得到帮忙">使用传统的方法按部就班，需要时从他人处得到帮忙<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>22. 我做事情，经常： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_22_1" name="item_22" id="item_22_1" name="item_22" value="不喜欢长期重复做相同的事情，缺乏长性<">不喜欢长期重复做相同的事情，缺乏长性<
                                            <br>
                                        </li>
                                        <li><input type="radio" id="item_22_2" name="item_22" value="期待好的结果又总被不利因素干扰，有点纠结">期待好的结果又总被不利因素干扰，有点纠结<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_22_3" name="item_22" value="往往考虑简单，行事过于草率，缺少耐心">往往考虑简单，行事过于草率，缺少耐心<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_22_4" name="item_22" value="缺少紧迫，行动迟缓，难下决心">缺少紧迫，行动迟缓，难下决心<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>23. 在人际交往时，我：</p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_23_1" name="item_23" value="相比较独处，我更喜欢与他人一起">相比较独处，我更喜欢与他人一起 <br>
                                        </li>
                                        <li><input type="radio" id="item_23_2" name="item_23" value="比较慢热，往往让人觉得有距离感">比较慢热，往往让人觉得有距离感<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_23_3" name="item_23" value="希望在人际关系中占据主导地位">希望在人际关系中占据主导地位<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_23_4" name="item_23" value="顺其自然，不温不火，相对被动">顺其自然，不温不火，相对被动<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>24. 恋爱关系中，我最希望对方： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_24_1" name="item_24" value="经常赞美我，让我享受开心、被关怀且有一定自由">经常赞美我，让我享受开心、被关怀且有一定自由br>
                                        </li>
                                        <li><input type="radio" id="item_24_2" name="item_24" value="能够觉察到我细微的需求，可以与我保持默契">能够觉察到我细微的需求，可以与我保持默契断<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_24_3" name="item_24" value="得到对方的认可，我是正确的并且我对其是有价值的">得到对方的认可，我是正确的并且我对其是有价值的<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_24_4" name="item_24" value="尊重我，可以安静地相处">尊重我，可以安静地相处<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>25. 工作之外，我的控制欲最贴近： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_25_1" name="item_25" value="自控能力较弱、对他人没有控制欲，只有感染带动他人的欲望">自控能力较弱、对他人没有控制欲，只有感染带动他人的欲望
                                            <br>
                                        </li>
                                        <li><input type="radio" id="item_25_2" name="item_25" value="不会主动控制，倾向于用规则来保持对自己和他人的要求">不会主动控制，倾向于用规则来保持对自己和他人的要求<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_25_3" name="item_25"
                                                   value="内心是有控制欲的，希望别人服从于我，但不一定会表现出来">内心是有控制欲的，希望别人服从于我，但不一定会表现出来<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_25_4" name="item_25" value="没兴趣影响别人，也不愿别人来控制我">没兴趣影响别人，也不愿别人来控制我<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>26. 我认为自己在情感上的基本特点是： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_26_1" name="item_26" value="情绪多变，经常波动">情绪多变，经常波动<br>
                                        </li>
                                        <li><input type="radio" id="item_26_2" name="item_26" value="内心感情起伏大，一旦受伤难以平复，但外表总是自我抑制">内心感情起伏大，一旦受伤难以平复，但外表总是自我抑制<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_26_3" name="item_26" value="从不拖泥带水，如果感情不稳定，会比较容易发怒">从不拖泥带水，如果感情不稳定，会比较容易发怒<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_26_4" name="item_26" value="天性乐观，情绪总是四平八稳">天性乐观，情绪总是四平八稳<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>27. 在大多数时候，我的内心更想要： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_27_1" name="item_27" value="喜欢与众不同、挑战刺激，经常冒出新的主意和想法">喜欢与众不同、挑战刺激，经常冒出新的主意和想法 <br>
                                        </li>
                                        <li><input type="radio" id="item_27_2" name="item_27" value="平静、安全，保持头脑冷静，不易冲动">平静、安全，保持头脑冷静，不易冲动<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_27_3" name="item_27" value="有强烈的“赢”的欲望，生命中处处都是挑战和竞赛">有强烈的“赢”的欲望，生命中处处都是挑战和竞赛<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_27_4" name="item_27" value="对自己的现状很满足，觉得很稳定，很少真正羡慕他人">对自己的现状很满足，觉得很稳定，很少真正羡慕他人<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>28. 说话时，我更看重： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_28_1" name="item_28" value="感觉效果，有时可能略显夸张">感觉效果，有时可能略显夸张 <br>
                                        </li>
                                        <li><input type="radio" id="item_28_2" name="item_28" value="描述精确，有时可能过于冗长">描述精确，有时可能过于冗长<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_28_3" name="item_28"
                                                   value="能不能达成结果更重要，有时可能过于直接，会让别人不高兴">能不能达成结果更重要，有时可能过于直接，会让别人不高兴<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_28_4" name="item_28" value="看重对方的感受，如果对方接受不了，有时可能会隐藏真实的想法">看重对方的感受，如果对方接受不了，有时可能会隐藏真实的想法<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>29. 如果爬山旅游，大多数情况下，下山回来的路线会选择： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_29_1" name="item_29" value="新路线，因为好玩有趣">新路线，因为好玩有趣 <br>
                                        </li>
                                        <li><input type="radio" id="item_29_2" name="item_29" value="原路线，因为安全稳妥">原路线，因为安全稳妥<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_29_3" name="item_29" value="新路线，希望挑战困难">新路线，希望挑战困难<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_29_4" name="item_29" value="原路线，因为方便省心">原路线，因为方便省心见<br>
                                        </li>
                                    </ul>
                                </div>
                                <div class="swiper-slide">
                                    <ul>
                                        <li>
                                            <p>30. 关于人生观，我的内心想法是： </p>
                                        </li>
                                        <li>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_30_1" name="item_30" value="希望能有各种各样的人生体验，所以想法极其多样化">希望能有各种各样的人生体验，所以想法极其多样化 <br>
                                        </li>
                                        <li><input type="radio" id="item_30_2" name="item_30" value="总是可以快速做出定论或判断">总是可以快速做出定论或判断<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_30_3" name="item_30" value="更加在乎取得一切有可能的成就">更加在乎取得一切有可能的成就<br>
                                        </li>
                                        <li>
                                            <input type="radio" id="item_30_4" name="item_30" value="毫不喜欢风险，喜欢享受稳定或现状">毫不喜欢风险，喜欢享受稳定或现状<br>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Add Arrows -->
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                        <input type="button" value="提交" class="sub"
                               style="width:150px;height: 50px; margin-top:30px;background-color:#6d9c01;color:#fff;border:1px solid #6d9c01;border-radius:3px;">
                    </form>


                    <%--评估--%>
                    <div class="assess" style="display: none;">

                    </div>
                    <script>


                        var layer;
                        $(function () {
                            layui.use('layer', function () {
                                layer = layui.layer;
                                alreadAssess()
                            });

                            /*判断是否已经完成评估*/
                            var alreadAssess = function () {
                                $.ajax({
                                    url: '${path}/pcviews/alreadAssess',
                                    type: 'post',
                                    success: function (data) {
                                        if (data.code == 0) {
                                            $(".sub").attr("value", "评估结果")
                                        }
                                    }
                                })
                            };


                            $(".sub").on("click", function () {
                                var options = $(".form-header-group_3").find('input');
                                console.log(options);
                                var datas = [];
                                options.each(function () {
                                    if ($(this).prop('checked')) {
                                        var data = {};
                                        data.selector = $(this).attr('id');
                                        data.selectorContent = $(this).val();
                                        datas.push(data);
                                    }
                                });
                                var datasStr = JSON.stringify(datas);
                                console.log(datas);
                                $.ajax({
                                    url: '${path}/pcviews/docharacter',
                                    data: {"datas": datasStr},
                                    dataType: 'json',
                                    type: 'post',
                                    success: function (data) {
                                        if (data.code == -1) {
                                            layer.msg(data.msg);
                                        } else if (data.code == 0 || data.code == 2) {
                                            var msg1 = data.msg1;
                                            var msg2 = data.msg2;
                                            var msg3 = data.msg3;
                                            $(".assess").html("");
                                            var msg = " <p>" + msg1 + "</p><p>" + msg2 + "</p> <p>" + msg3 + "</p>";
                                            $(".assess").append(msg);
                                            layer.open({
                                                type: 1,
                                                content: $('.assess'),
                                                area: ['400px', '300px'],
                                                shade: 0.8,
                                                shadeClose: false, //点击遮罩关闭
                                                id: 'LAY_layuipro',
                                                btn: ['重新评估'],
                                                btnAlign: 'c',
                                                success: function (layero) {
                                                    var btn = layero.find('.layui-layer-btn');
                                                    btn.find('.layui-layer-btn0').on('click', function () {
                                                        $.ajax({
                                                            url: '${path}/pcviews/repeat',
                                                            dataType: 'json',
                                                            type: 'post',
                                                            success: function (data) {
                                                                if (data.code == 0) {
                                                                    $(".sub").attr("value", "提交")
                                                                }
                                                            }
                                                        })
                                                    });
                                                }
                                            });
                                        } else if (data.code == 1) {
                                            layer.msg(data.msg);
                                            $(".sub").attr("value", "评估结果")
                                        }
                                    }
                                });
                            });
                        })
                    </script>


                    <%--导航的标签内容切换--%>
                    <script>

                        var swiper = new Swiper('.swiper-container', {
                            navigation: {
                                nextEl: '.swiper-button-next',
                                prevEl: '.swiper-button-prev',
                            },
                        });

                    </script>
                </div>
            </section>
        </div>
    </div>
    <!--尾-->
    <footer>
        <div class="footer">
            <nav>
                <a href="javascript:;">关于我们</a>
                <a href="javascript:;">意见反馈</a>
                <a href="javascript:;">使用帮助</a>
                <a href="javascript:;">用户协议</a>
            </nav>
            <div class="foot_left">
                <p class="foot_ebeirui"><em>贝睿</em>教育</p>
                <p>
                    Copyright © 2019 ebeirui.com京ICP备#####
                    <span class="ml10">京公网安备############</span>
                </p>
                <p>ebeirui.com.保留所有版权. 使用这些服务遵守用户协议。</p>
            </div>
            <div class="foot_right">
                <img src="${path}resources/pcH5Plus/images/beirui_ma.jpg" alt="">
            </div>
        </div>
    </footer>
</div>
</body>
<script>
    $("#5").addClass("active");
</script>
</html>