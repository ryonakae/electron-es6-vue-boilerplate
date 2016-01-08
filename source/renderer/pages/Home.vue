<template lang='jade'>
.main
  h2 {{title}}

  a(v-link='{path:"/about"}') About

  p Here is home!

  ul
    li(v-for='item in data') {{item}}
</template>

<script>
  export default {
    data () {
      return {
        title: 'Home',
        data: ['data0', 'data1', 'data2']
      }
    }
  }
</script>

<style lang='stylus'>
</style>