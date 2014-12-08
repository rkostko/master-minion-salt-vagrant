base:
  '*':
    - base.sanity
    - wheel
    - users
  'role:webserver':
    - match: grain
    - nginx
  'role:repo':
    - match: grain
    - git
