const globals = require("globals");
const js = require("@eslint/js");
const pluginVue = require("eslint-plugin-vue");
const parser = require("vue-eslint-parser");

module.exports = [
  // Core configurations
  js.configs.recommended,
  // Base configuration for all files
  {
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: "module",
      globals: {
        ...globals.browser,
        ...globals.es2021,
        ...globals.node,
      },
    },
  },
  // Vue files configuration
  {
    files: ["**/*.vue"],
    languageOptions: {
      parser: parser,
      parserOptions: {
        ecmaVersion: 2022,
        sourceType: "module",
        ecmaFeatures: {
          jsx: true,
        },
        vueFeatures: {
          filter: true,
          interpolationAsNonHTML: false,
          styleStringParser: true,
        },
      },
    },
    plugins: {
      vue: pluginVue,
    },
    rules: {
      ...pluginVue.configs.base.rules,
      ...pluginVue.configs["vue3-recommended"].rules,
      "vue/html-indent": ["error", 2],
      "vue/html-self-closing": [
        "error",
        {
          html: {
            void: "always",
            normal: "always",
            component: "always",
          },
        },
      ],
      "vue/comment-directive": 0,
    },
  },
  // JavaScript/TypeScript files configuration
  {
    files: ["**/*.{js,mjs,cjs,ts,tsx,mts,cts}"],
    rules: {
      semi: ["error", "always"],
    },
  },
];
