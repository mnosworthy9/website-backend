import logger from "jet-logger";
import server from "./server";


// Constants
const serverStartMsg = "Express server started on port: ",
        port = (process.env.PORT || 4000);

// Start server
server.listen(port, () => {
    logger.info(serverStartMsg + port);
});
