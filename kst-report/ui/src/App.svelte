<script>
	import VisibilityProvider from '@providers/VisibilityProvider.svelte'
	import { BROWSER_MODE, RESOURCE_NAME } from '@store/stores'
	import DebugBrowser from '@providers/DebugBrowser.svelte'
	import AlwaysListener from '@providers/AlwaysListener.svelte'
    import { scale } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
    import { SendNUI } from '@utils/SendNUI'
    let input

	$RESOURCE_NAME = 'Kst-report' // Change this to your resource name (case sensitive)
</script>

<VisibilityProvider>
 <div class="MainFrame" transition:scale={{ duration: 500, start: 0.5, easing: quintOut }}>
      <h1 style="font-family: sans-serif; font-size: x-large;">Report</h1>
      <div class="Inputs">
        <input bind:value={input} type="text" placeholder="Grund"/>
      </div>
      <button class="sendbutton" on:click={() => SendNUI('report', input)}>Send</button>
    </div>
</VisibilityProvider>


<AlwaysListener />
{#if $BROWSER_MODE}
	<DebugBrowser />
	<div class="absolute w-screen h-screen top-0 left-0 dev-image" />
{/if}


<style>
	.dev-image {
		background-image: url('https://cdn.discordapp.com/attachments/1068663854143389788/1074878298498281554/HUD_-_Target_Menu.png');
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;

	}

	.MainFrame {
    position: absolute;
    width: 500px;
    left: 1%;
    top: 1%;
    height: 175px;
    background-color: rgb(73, 73, 73);
    border-radius: 15px;
    border: 2px solid black;
    text-align: center;
    color: white;
    font-family: sans-serif;
    text-decoration: underline;
}

.Inputs input {
    transition: 0.5s;
    text-align: center;
    color: white;
    border-radius: 15px;
    border: 2px solid grey;
    background: rgb(58, 58, 58);
    width: 400px;
    height: 55px;
    font-size: x-large;
}

.Inputs input:focus {
    transition: 0.5s;
    border: 2px solid transparent;
    outline: transparent;
}

.sendbutton {
    transition: 0.5s;
    text-align: center;
    color: white;
    border-radius: 15px;
    border: 2px solid grey;
    background: rgb(58, 58, 58);
    width: 400px;
    height: 55px;
    font-size: x-large;
    margin: 10px;
}

.sendbutton:hover {
    transition: 0.5s;
    border: 2px solid transparent;
    outline: transparent;
}

</style>