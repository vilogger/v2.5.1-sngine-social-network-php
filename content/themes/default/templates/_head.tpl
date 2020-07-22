<!DOCTYPE html>

<!--[if IE 8]><html class="ie8"> <![endif]-->
<!--[if IE 9]><html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="gt-ie8 gt-ie9 not-ie" lang="{$system['language']['code']}" {if $system['language']['dir'] == "RTL"} dir="RTL" {/if}>
<!--<![endif]-->

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="generator" content="Sngine">
    <meta name="version" content="{$system['system_version']}">

    <!-- Title -->
    <title>{$page_title}</title>
    <!-- Title -->

    <!-- Meta -->
    <meta name="description" content="{$system['system_description']}">
    <meta name="keywords" content="{$system['system_keywords']}">
    <!-- Meta -->

    <!-- OG-Meta -->
    <meta property="og:title" content="{$page_title}"/>
    <meta property="og:description" content="{$system['system_description']}"/>
    <meta property="og:url" content="{$system['system_url']}"/>
    <meta property="og:site_name" content="{$system['system_title']}"/>
    <!-- OG-Meta -->

    <!-- OG-Image -->
    {if $system['system_ogimage']}
        <meta property="og:image" content="{$system['system_uploads']}/{$system['system_ogimage']}"/>
    {elseif $system['system_ogimage_default']}
        <meta property="og:image" content="{$system['system_url']}/content/themes/{$system['theme']}/images/og-image.jpg"/>
    {/if}
    <!-- OG-Image -->

    <!-- Favicon -->
    {if $system['system_favicon_default']}
        <link rel="shortcut icon" href="{$system['system_url']}/content/themes/{$system['theme']}/images/favicon.png" />
    {elseif $system['system_favicon']}
        <link rel="shortcut icon" href="{$system['system_uploads']}/{$system['system_favicon']}" />
    {/if}
    <!-- Favicon -->

    <!-- Dependencies CSS [Bootstrap|Font-Awesome] -->
    <style type="text/css">{include file="../../../../includes/assets/css/bootstrap/css/bootstrap+social.css" caching}</style>
    {if $user->_logged_in}
    <link rel="stylesheet" href="{$system['system_url']}/includes/assets/css/font-awesome/css/font-awesome.min.css">
    {/if}
    <!-- Dependencies CSS [Bootstrap|Font-Awesome] -->
    
    <!-- CSS -->
    {if $system['language']['dir'] == "LTR"}
        <style type="text/css">{include file="../css/style.css" caching}</style>
    {else}
        <link rel="stylesheet" type='text/css' href="{$system['system_url']}/includes/assets/css/bootstrap/css/bootstrap-rtl.min.css">
        <style type="text/css">{include file="../css/style.rtl.css" caching}</style>
    {/if}
    <!-- CSS -->

    <!-- CSS Customized -->
    {include file='_head.css.tpl'}
    <!-- CSS Customized -->

</head>