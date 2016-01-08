<template lang='jade'>
.main
  h2 {{title}}

  a(v-link='{path:"/"}') Home

  p(v-text='text')
</template>

<script>
  export default {
    data () {
      return {
        title: 'About',
        text: 'Here is about!'
      }
    }
  }
</script>

<style lang='stylus'>
</style>