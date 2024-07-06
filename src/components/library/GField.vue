<template>
  <template v-if="noField">
    <div class="column">
      <slot></slot>
    </div>
  </template>
  <q-field
    v-else
    dense
    square
    @focus="isSelected = true"
    borderless
    @blur="isSelected = false"
    v-bind="$attrs"
  >
    <div class="column full-width">
      <slot></slot>
    </div>
  </q-field>
</template>
<script setup>
import { ref, watch } from "vue";

const emit = defineEmits(["is-selected"]);

const isSelected = ref(false);

watch(isSelected, (newVal) => {
  emit("is-selected", newVal);
});

defineProps({
  noField: {
    type: Boolean,
    default: false,
  },
});
</script>
