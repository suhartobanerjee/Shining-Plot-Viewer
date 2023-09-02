# A Shining Plot Viewer

This plot viewer is built with Shiny framework to display plots. This app opens on a specific port (`2700`) and can be accessed from any device in the local network. There is a list of plots which is kept under the hood so that various plots plotted can be navigated with `previous` and `next` buttons.

# Development Roadmap

- [x] Start the server with a predefined plot list.
- [x] Navigate the plot list with next or previous.
- [x] Communicate a plot to the server *before* the server starts from a separate R script.
- [ ] Handle POST requests (with brochure) to continuously update the plot viewer with new plots.
- [ ] Implement hover and click functions to make plots interactive.
