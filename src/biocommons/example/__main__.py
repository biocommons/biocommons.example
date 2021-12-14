import logging
import time

from . import marvin

_logger = logging.getLogger(__name__)


def main():
    import coloredlogs

    logging.Formatter.converter = time.gmtime
    coloredlogs.install(
        level="INFO",
        fmt="%(asctime)s [%(process)d] %(name)s:%(lineno)d %(levelname)s %(message)s",
        datefmt="%FT%T.%f%z",
    )

    quote = marvin.get_quote()
    _logger.warning(f"Got quote from Marvin (len={len(quote)})")

    print("Marvin says:")
    print(quote)


if __name__ == "__main__":
    main()
