<template>
    <div class="row">
        <post v-for="item in posts" v-bind:item="item"/>
        <div class="col-12" v-show="!found">
            <h2>No results were found. Try changing the keyword!</h2>
        </div>
    </div>
</template>

<script>
    import {serverBus} from '../../main';
    import Post from "./Post.vue"

    export default {
        name: "Search",
        data() {
            return {
                all: [],
                posts: [],
                found: true
            };
        },
        props: {
            keyword: String,
        },
        methods: {
            getSearch: function () {
                serverBus.$emit('searchKeyword', this.keyword);
                this.$http.get(`${this.API}/news/search/${this.keyword}`)
                    .then(response => {
                        let self = this;
                        if (response.data.length < 1) self.found = false;
                        this.all = response.data;
                        this.posts = response.data.result;
                    })
            }
        },
        components: {
            Post
        },
        created() {
            this.getSearch()
        },
    }
</script>

<style scoped>

</style>
