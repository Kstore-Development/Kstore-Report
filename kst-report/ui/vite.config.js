import { svelte } from '@sveltejs/vite-plugin-svelte';
import { defineConfig } from 'vite';
import { resolve } from 'path';

export default defineConfig({
	plugins: [svelte()],
	resolve: {
		alias: {
			"@assets": resolve("./src/assets"),
			"@components": resolve("./src/components"),
			"@providers": resolve("./src/providers"),
			"@store": resolve("./src/store"),
			"@utils": resolve("./src/utils"),
			"@typings": resolve("./src/typings"),
		}
	},
	base: "./",
	build: {
		emptyOutDir: true,
		outDir: '../html',
		assetsDir: './',
		rollupOptions: {
			output: {
				// By not having hashes in the name, you don't have to update the manifest, yay!
				entryFileNames: `[name].js`,
				chunkFileNames: `[name].js`,
				assetFileNames: `[name].[ext]`
			}
		}
	}
});
