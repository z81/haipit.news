<template>
    <b-navbar toggleable="lg" type="light" variant="white" fixed="top" class="navbar-main">

        <div class="container">

            <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>

            <b-navbar-brand href="/">
                <img src="@/assets/img/logo-text-sm.png" class="d-inline-block align-top" style="height: 42px;"/>
            </b-navbar-brand>

            <b-collapse is-nav id="nav_collapse">

                <b-navbar-nav>
                    <b-nav-item to="/news">Новости</b-nav-item>
                    <b-nav-item to="/about">О проекте</b-nav-item>
                </b-navbar-nav>

                <b-navbar-nav class="ml-auto">

                    <b-nav-item target="_blank" href="https://github.com/haipit">GitHub</b-nav-item>
                    <b-nav-item target="_blank" href="https://api.haipit.news/docs/">API Docs</b-nav-item>

                    <search/>

                    <!--<b-nav-item-dropdown text="Lang" right>-->
                    <!--<b-dropdown-item href="#">EN</b-dropdown-item>-->
                    <!--<b-dropdown-item href="#">ES</b-dropdown-item>-->
                    <!--<b-dropdown-item href="#">RU</b-dropdown-item>-->
                    <!--<b-dropdown-item href="#">FA</b-dropdown-item>-->
                    <!--</b-nav-item-dropdown>-->

                    <!--<b-nav-item-dropdown right>-->
                    <!--<template slot="button-content">-->
                    <!--<em>User</em>-->
                    <!--</template>-->
                    <!--<b-dropdown-item href="#">Profile</b-dropdown-item>-->
                    <!--<b-dropdown-item href="#">Signout</b-dropdown-item>-->
                    <!--</b-nav-item-dropdown>-->
                </b-navbar-nav>

            </b-collapse>
        </div>
    </b-navbar>

</template>

<script>
    import Search from "./Search"

    export default {
        name: 'Navbar',
        components: {
            Search
        }
    }
</script>
