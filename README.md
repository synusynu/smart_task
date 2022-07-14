### Smart pension interview task

The solution consists mainly of `WebpagesCollection` and `Webpage` classes, that takes care of sorting the data from log file and counting views and unique views.
`LogReader` is a supporting class for getting `url` and `ip_address` for each line in log file, `WebpagesSerializer`  extracts required attributes from webpage instance and `TerminalPresenter` is responsible for printing data in terminal in nice format.
