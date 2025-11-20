# data preparation

* uses a script available at `data_processing/run.xsl`
  * set input directory and static parameters in the script (or supply them at runtime)
  * run it e.g. like so: `java -jar /opt/Saxonica/SaxonHE12-9/saxon-he-12.9.jar -xsl:run.xsl -s:run.xsl cte-apparatus-export-method='old-style-precede' -it`
  * outputs are stored in `data_processing/output` (for the time being they need to be copied over to `src/lib/data`). 

---


# sv

Everything you need to build a Svelte project, powered by [`sv`](https://github.com/sveltejs/cli).

## Creating a project

If you're seeing this, you've probably already done this step. Congrats!

```bash
# create a new project in the current directory
npx sv create

# create a new project in my-app
npx sv create my-app
```

## Developing

Once you've created a project and installed dependencies with `npm install` (or `pnpm install` or `yarn`), start a development server:

```bash
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

## Building

To create a production version of your app:

```bash
npm run build
```

You can preview the production build with `npm run preview`.

> To deploy your app, you may need to install an [adapter](https://svelte.dev/docs/kit/adapters) for your target environment.
