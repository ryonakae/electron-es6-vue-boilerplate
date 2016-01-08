<template lang='jade'>
.main
  h2 {{title}}

  a(v-link='{path:"/"}') Home

  p {{text}}
</template>

<script>
  export default {
    data () {
      return {
        title: 'Home',
        text: 'Here is about!'
      }
    }
  }
</script>

<style lang='stylus'>
</style>