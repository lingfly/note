const demo = {
  data() {
    return {
      test: 1,
    }
  }
}

import post from '@/component/post.vue';

const app = Vue.createApp(demo);
app.component(post);
app.mount('#demo');
console.log(app.config)