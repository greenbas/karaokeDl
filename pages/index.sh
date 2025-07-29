
source config.sh

htmx_page << EOF
  <header><h1>${PROJECT_NAME}</h1><header>
  <main><form hx-post="/bg" hx-target="#target">
  <fieldset>
    <label>
      Video Url
      <input
        name="video_url"
        placeholder="Video Url"
      />
    </label>
    <label>
      Artist Name
      <input
        name="artist_name"
        placeholder="Artist Name"
      />
    </label>
    <label>
      Song Name
      <input
        name="song_name"
        placeholder="Song Name"
      />
    </label>
  </fieldset>

  <input
    type="submit"
    
    value="Run That Shit!"
  />
</form>
  <div id="target">Not Started</div>
  <h2>Events</h2>
  <output hx-ext="sse" sse-connect="/sse" sse-swap="update" hx-swap="beforeend">
  </output></main>
EOF
