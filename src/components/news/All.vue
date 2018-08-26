<template>
    <div class="row blocks">
        <post v-for="item in posts" v-bind:item="item"/>
        <div class="col-12" v-show="!found">
            <h2>No results were found. Try changing the keyword!</h2>
        </div>
        <nav class="navbar fixed-bottom">
            <div class="container">
                <div class="col-12 pt-4 text-xs-center">
                    <paginate
                            v-model="page"
                            :page-count="pages"
                            :page-range="3"
                            :margin-pages="2"
                            :click-handler="clickCallback"
                            :prev-text="'<<'"
                            :next-text="'>>'"
                            :container-class="'pagination pull-right shadow'"
                            :page-class="'page-item'"
                            :page-link-class="'page-link'"
                            :prev-link-class="'page-link'"
                            :next-link-class="'page-link'"
                    />
                </div>
            </div>
        </nav>
    </div>
</template>

<script>
    import Post from "./Post.vue"

    export default {
        name: 'News',
        data() {
            return {
                posts: [],
                found: true,
                // TODO: Alarm crapcode detected
                pages: 100,
                limit: 30,
                offset: 0,
                currentPage: 0
            };
        },
        props: {
            page: Number,
        },
        methods: {
            getNews: async function() {
                // Renew limit and offset by page number
                this.getLimits();
                const { data } = await this.$http.get(`${this.API}/news?limit=${this.limit}&offset=${this.offset}`)
                this.posts = data.result;
            },
            getLimits: function() {
                if (this.page !== undefined) this.currentPage = this.page;
                this.limit = 30;
                this.offset = this.currentPage * this.limit;
            },
            clickCallback: function(pageNum) {
                this.currentPage = pageNum;
                this.getNews();
            }
        },
        components: {
            Post
        },
        mounted() {
            this.getNews()
        },
    }
</script>
