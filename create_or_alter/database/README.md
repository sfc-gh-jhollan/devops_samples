# Running the sample

### Create a git integration with Snowflake

```
use role accountadmin;

create database shared;

CREATE OR REPLACE API INTEGRATION github_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com')
  ALLOWED_AUTHENTICATION_SECRETS = all
  ENABLED = TRUE;

CREATE OR REPLACE GIT REPOSITORY coa_repo
  API_INTEGRATION = github_integration
  ORIGIN = 'https://github.com/sfc-gh-jhollan/devops_samples';

grant read,write on git repository coa_repo to role <your-role>;

use role <your-role>;
```

### Create environments
You can create as many as you want

```
create database dev_database;
create database prod_database;
```

### Deploy templates
You can modify the database name or branch as needed

```
use database dev_database;
alter git repository shared.public.coa_repo fetch;

SET repo_path = '@shared.public.coa_repo/branches/main';

execute immediate from @shared.public.coa_repo/branches/main/create_or_alter/database/base.sql using ( snow_stock_name => 'snow_stock', dynamic_warehouse => 'xsmall', git_base => $repo_path);
```