<template>
    <div id="app">
        <navbar/>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <router-view></router-view>
                </div>
            </div>
        </div>
        <footer/>
    </div>
</template>

<style>
    body {
        background-color: #f5f5f5 !important;
        padding-top: 90px;
        padding-bottom: 40px;
    }
</style>

<script>
    import Navbar from "./components/layout/Navbar.vue"
    import Footer from "./components/layout/Footer.vue"

    export default {
        name: 'App',
        components: {
            Navbar, Footer
        },
    }
</script>
