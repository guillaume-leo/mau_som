<template>
  <g-field :no-field="noField" @is-selected="(val) => (selected = val)">
    <q-badge
      class="text-caption text-center bg-transparent text-black q-mx-auto"
      :class="{ 'bg-red': selected }"
    >
      {{ props.label }}
    </q-badge>
    <div class="q-mx-auto">
      <q-slider
        v-model="model"
        reverse
        thumb-size="0"
        track-size="10px"
        label
        vertical
        v-bind="$attrs"
        @update:model-value="(val) => console.log(val)"
      />
    </div>
  </g-field>
</template>
<script setup>
import { ref } from "vue";
const model = defineModel({ type: Number, default: 0 });
const selected = ref(false);

window.test = () => console.log(model.value);

const props = defineProps({
  label: {
    type: String,
    default: "",
  },
  noField: {
    type: Boolean,
    default: false,
  },
});
</script>
<style scoped lang="scss"></style>
