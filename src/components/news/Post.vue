<template>
    <transition name="fade">
        <div class="col-12">
            <div class="card">
                <div class="card-block p-4 block-item">
                    <div class="card-title">
                        <h5 class="news-link">
                            <a target="_blank" class="last"
                               v-bind:href="decodeURIComponent(item.url)"
                               @click="stat(item._id)">
                                {{ item.title }}
                            </a>
                        </h5>
                    </div>
                    <div class="card-text hidden-md-down">
                        <span class="text-success">{{ decodeURIComponent(item.url) }}</span>
                    </div>
                    <div class="card-text news-text" v-if="item.description" v-html="decodeHtml(item.description)"></div>
                    <div class="card-text">
                        <table class="table table-sm table-bordered">
                            <tr>
                                <td>
                                    <span class="text-muted"><i class="fa fa-fw fa-eye"></i> {{
                                        (item.clicks !== undefined)
                                        ? decodeJson(item.clicks)
                                        : '0'
                                        }}
                                    </span>
                                </td>
                                <td>
                                    <router-link :to="{path: '/news?src=' + item.id_source}">
                                        {{ item.source_title }}
                                    </router-link>
                                </td>
                                <td>
                                    <span class="text-muted float-md-right">{{ DateFns.format(parseInt(item.timestamp) * 1000, 'YYYY/MM/DD HH:mm:ss') }}</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
    export default {
        name: 'Post',
        data() {
            return {
                today: this.DateFns.format(new Date(), "YYYY-MM-DD")
            };
        },
        props: {
            item: Object,
        },
        methods: {
            stat: function (id) {
                this.$http.post(`${this.API}/stats`, {id: id});
            },
            decodeHtml: function (html) {
                let txt = document.createElement("textarea");
                txt.innerHTML = html;
                return txt.value;
            },
            decodeJson: function (json) {
                return json.length;
            },
        },
        mounted() {
            console.log(this.item.clicks);
        }
    }
</script>
