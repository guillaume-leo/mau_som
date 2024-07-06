<template>
  <q-field
    dense
    square
    @focus="isSelected = true"
    borderless
    @blur="isSelected = false"
    v-bind="$attrs"
  >
    <slot></slot>
  </q-field>
</template>
<script setup>
import { ref, watch } from "vue";

const emit = defineEmits(["selected"]);

const isSelected = ref(false);

watch(isSelected, (newVal) => {
  emit("is-selected", newVal);
});
</script>
