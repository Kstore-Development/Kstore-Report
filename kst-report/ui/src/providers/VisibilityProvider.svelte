<script lang="ts">
	import { ReceiveNUI } from '../utils/ReceiveNUI'
	import { SendNUI } from '../utils/SendNUI'
	import { onMount } from 'svelte'
	import { BROWSER_MODE, VISIBILITY } from '../store/stores'
	import BackdropFix from './BackdropFix.svelte'

	$: isVisible = $VISIBILITY 
	$: isBrowser = $BROWSER_MODE

	ReceiveNUI<boolean>('setVisible', (visible: boolean) => {
		$VISIBILITY = visible
	})

	ReceiveNUI('setBrowserMode', (data: boolean) => {
		$BROWSER_MODE = data
		console.log('browser mode enabled')
	})

	onMount(() => {
		const keyHandler = (e: KeyboardEvent) => {
			if (isVisible && ['Escape'].includes(e.code)) {
				SendNUI('hideUI')
				$VISIBILITY = false
			}
			if (
				!isVisible &&
				['Escape'].includes(e.code) &&
				isBrowser === true
			) {
				$VISIBILITY = true
			}
		}

		window.addEventListener('keydown', keyHandler)

		return () => window.removeEventListener('keydown', keyHandler)
	})
</script>

{#if isVisible}

	<main>
		<slot />
	</main>
	<!-- <BackdropFix /> -->
{/if}

<style>
	main {
		position: absolute;
		left: 0;
		top: 0;
		z-index: 100;
		user-select: none;
		box-sizing: border-box;
		padding: 0;
		margin: 0;
		height: 100vh;
		width: 100vw;
	}
</style>
