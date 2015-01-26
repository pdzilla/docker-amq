keystone-amq
============

Docker image of ActiveMQ 7.0.47 with Keystone specific configurations pre-applied.


You can use this repo's container either by itself or as part of the Fig configuration in the keystone-fig repository.

TODO: The container has issues with the admin console on port 8161. It might be a Safari thing, because if I load the /admin endpoint, I get a 404, but if I browser back then forward, it's there. Not enough headspace to work through that; probably should submit an issue to fix it.

Please fork and contribute via PR.
