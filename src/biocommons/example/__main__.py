"""biocommons.example.__main__"""

import logging
import time

from . import marvin

_logger = logging.getLogger(__name__)


def main() -> None:  # pragma: no cover
    """marvin.example main"""
    import coloredlogs  # noqa: PLC0415

    logging.Formatter.converter = time.gmtime
    coloredlogs.install(
        level="INFO",
        fmt="%(asctime)s [%(process)d] %(name)s:%(lineno)d %(levelname)s %(message)s",
        datefmt="%FT%T.%f%z",
    )

    quote = marvin.get_quote()
    _logger.warning("Got quote from Marvin (len=%s)", len(quote))

    print("Marvin says:")  # noqa: T201
    print(quote)  # noqa: T201


if __name__ == "__main__":
    main()
