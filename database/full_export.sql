--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.12 (Homebrew)

-- Started on 2025-05-28 13:41:51 EEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 17 (class 2615 OID 16481)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- TOC entry 12 (class 2615 OID 16388)
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- TOC entry 15 (class 2615 OID 16611)
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- TOC entry 14 (class 2615 OID 16600)
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- TOC entry 10 (class 2615 OID 16386)
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- TOC entry 18 (class 2615 OID 16592)
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- TOC entry 16 (class 2615 OID 16529)
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- TOC entry 13 (class 2615 OID 16638)
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- TOC entry 6 (class 3079 OID 16666)
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- TOC entry 2 (class 3079 OID 16389)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 4 (class 3079 OID 16434)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 5 (class 3079 OID 16639)
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- TOC entry 3 (class 3079 OID 16423)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 1041 (class 1247 OID 16756)
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- TOC entry 1065 (class 1247 OID 16897)
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- TOC entry 1038 (class 1247 OID 16750)
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1035 (class 1247 OID 16744)
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1071 (class 1247 OID 16939)
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1110 (class 1247 OID 17244)
-- Name: bug_severity; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.bug_severity AS ENUM (
    'Critical',
    'High',
    'Medium',
    'Low',
    'Informational'
);


ALTER TYPE public.bug_severity OWNER TO postgres;

--
-- TOC entry 1113 (class 1247 OID 17256)
-- Name: bug_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.bug_status AS ENUM (
    'Draft',
    'Submitted',
    'Triaged',
    'Accepted',
    'Duplicate',
    'Not Applicable',
    'Resolved',
    'Bounty Awarded'
);


ALTER TYPE public.bug_status OWNER TO postgres;

--
-- TOC entry 1116 (class 1247 OID 17274)
-- Name: platform_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.platform_type AS ENUM (
    'bug_bounty',
    'vdp',
    'private',
    'ctf'
);


ALTER TYPE public.platform_type OWNER TO postgres;

--
-- TOC entry 1095 (class 1247 OID 17106)
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- TOC entry 1086 (class 1247 OID 17067)
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- TOC entry 1089 (class 1247 OID 17081)
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- TOC entry 1101 (class 1247 OID 17152)
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- TOC entry 1098 (class 1247 OID 17119)
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- TOC entry 300 (class 1255 OID 16527)
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 300
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- TOC entry 358 (class 1255 OID 16726)
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- TOC entry 299 (class 1255 OID 16526)
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 299
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- TOC entry 298 (class 1255 OID 16525)
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 298
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- TOC entry 357 (class 1255 OID 16584)
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- TOC entry 4113 (class 0 OID 0)
-- Dependencies: 357
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- TOC entry 327 (class 1255 OID 16605)
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- TOC entry 4115 (class 0 OID 0)
-- Dependencies: 327
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- TOC entry 325 (class 1255 OID 16586)
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- TOC entry 4117 (class 0 OID 0)
-- Dependencies: 325
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- TOC entry 326 (class 1255 OID 16596)
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- TOC entry 322 (class 1255 OID 16597)
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- TOC entry 356 (class 1255 OID 16607)
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- TOC entry 4146 (class 0 OID 0)
-- Dependencies: 356
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- TOC entry 276 (class 1255 OID 16387)
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- TOC entry 381 (class 1255 OID 17527)
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $$
BEGIN
  INSERT INTO public.profiles (id, first_name, last_name)
  VALUES (
    new.id,
    new.raw_user_meta_data ->> 'first_name',
    new.raw_user_meta_data ->> 'last_name'
  );
  RETURN new;
END;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- TOC entry 374 (class 1255 OID 17141)
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 380 (class 1255 OID 17224)
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- TOC entry 373 (class 1255 OID 17157)
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- TOC entry 370 (class 1255 OID 17103)
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- TOC entry 371 (class 1255 OID 17098)
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- TOC entry 376 (class 1255 OID 17153)
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- TOC entry 377 (class 1255 OID 17164)
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 369 (class 1255 OID 17097)
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- TOC entry 379 (class 1255 OID 17223)
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- TOC entry 375 (class 1255 OID 17095)
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- TOC entry 372 (class 1255 OID 17130)
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- TOC entry 378 (class 1255 OID 17217)
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- TOC entry 365 (class 1255 OID 17010)
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- TOC entry 361 (class 1255 OID 16984)
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 360 (class 1255 OID 16983)
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 359 (class 1255 OID 16982)
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 363 (class 1255 OID 16996)
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- TOC entry 366 (class 1255 OID 17049)
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 362 (class 1255 OID 17012)
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 368 (class 1255 OID 17065)
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- TOC entry 367 (class 1255 OID 16999)
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 364 (class 1255 OID 17000)
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 16512)
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- TOC entry 250 (class 1259 OID 16901)
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- TOC entry 241 (class 1259 OID 16698)
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- TOC entry 232 (class 1259 OID 16505)
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- TOC entry 245 (class 1259 OID 16788)
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- TOC entry 244 (class 1259 OID 16776)
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- TOC entry 243 (class 1259 OID 16763)
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- TOC entry 251 (class 1259 OID 16951)
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 231 (class 1259 OID 16494)
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- TOC entry 230 (class 1259 OID 16493)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 230
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- TOC entry 248 (class 1259 OID 16830)
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- TOC entry 249 (class 1259 OID 16848)
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- TOC entry 234 (class 1259 OID 16520)
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- TOC entry 242 (class 1259 OID 16728)
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- TOC entry 247 (class 1259 OID 16815)
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- TOC entry 246 (class 1259 OID 16806)
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- TOC entry 229 (class 1259 OID 16482)
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- TOC entry 264 (class 1259 OID 17331)
-- Name: bugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bugs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    program_id uuid,
    title text NOT NULL,
    description text,
    severity public.bug_severity NOT NULL,
    status public.bug_status DEFAULT 'Draft'::public.bug_status NOT NULL,
    bounty_amount numeric(10,2),
    submission_date date,
    resolution_date date,
    vulnerability_type text,
    poc_steps text,
    impact_description text,
    remediation_suggestion text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.bugs OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17357)
-- Name: checklist_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.checklist_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    checklist_id uuid,
    text text NOT NULL,
    is_completed boolean DEFAULT false,
    order_index integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.checklist_items OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17422)
-- Name: link_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.link_categories OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 17407)
-- Name: personal_notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_notes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    content text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.personal_notes OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 17283)
-- Name: platforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platforms (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    url text,
    platform_type public.platform_type DEFAULT 'bug_bounty'::public.platform_type NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.platforms OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 17463)
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    first_name text,
    last_name text,
    username text,
    avatar_url text,
    updated_at timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 17315)
-- Name: programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    platform_id uuid,
    name text NOT NULL,
    company text NOT NULL,
    scope text NOT NULL,
    max_bounty numeric(10,2),
    min_bounty numeric(10,2),
    program_url text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.programs OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17383)
-- Name: reading_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reading_list (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    url text NOT NULL,
    description text,
    category text,
    is_read boolean DEFAULT false,
    priority integer DEFAULT 1,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.reading_list OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 17490)
-- Name: rss_articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rss_articles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    feed_id uuid,
    title text NOT NULL,
    description text,
    link text NOT NULL,
    pub_date timestamp with time zone,
    guid text,
    author text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.rss_articles OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 17480)
-- Name: rss_feeds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rss_feeds (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    url text NOT NULL,
    category text NOT NULL,
    description text,
    is_default boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.rss_feeds OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 17347)
-- Name: security_checklists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.security_checklists (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    name text NOT NULL,
    checklist_type text NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.security_checklists OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 17373)
-- Name: security_tips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.security_tips (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    category text,
    tags text[],
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.security_tips OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 17436)
-- Name: useful_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.useful_links (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    url text NOT NULL,
    description text,
    category text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.useful_links OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17294)
-- Name: user_platform_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_platform_profiles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    platform_id uuid,
    username text NOT NULL,
    profile_url text,
    reputation_points integer DEFAULT 0,
    rank_position text,
    total_bounties_earned numeric(10,2) DEFAULT 0,
    bugs_submitted integer DEFAULT 0,
    bugs_accepted integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_platform_profiles OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 17506)
-- Name: user_rss_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_rss_subscriptions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    feed_id uuid,
    subscribed_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_rss_subscriptions OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 17227)
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- TOC entry 252 (class 1259 OID 16976)
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- TOC entry 257 (class 1259 OID 17083)
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- TOC entry 256 (class 1259 OID 17082)
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 16533)
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 237 (class 1259 OID 16575)
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- TOC entry 236 (class 1259 OID 16548)
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 253 (class 1259 OID 17014)
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- TOC entry 254 (class 1259 OID 17028)
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- TOC entry 3560 (class 2604 OID 16497)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 4040 (class 0 OID 16512)
-- Dependencies: 233
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	ce0586b7-c2b2-441c-b796-766e1c11ace9	{"action":"user_confirmation_requested","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-05-28 09:10:43.229873+00	
00000000-0000-0000-0000-000000000000	ef87fb3c-497f-4073-af91-09e51dfb1358	{"action":"user_signedup","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"team"}	2025-05-28 09:11:15.85766+00	
00000000-0000-0000-0000-000000000000	cab67037-04e8-46d7-bb37-9550a56c15cf	{"action":"login","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 09:11:39.333866+00	
00000000-0000-0000-0000-000000000000	b65f9e5c-ccda-4860-b721-6b3ca8de3743	{"action":"login","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 09:28:36.647626+00	
00000000-0000-0000-0000-000000000000	c0d1e699-ee7c-4d4f-950a-e99588d485e7	{"action":"login","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 09:45:55.579736+00	
00000000-0000-0000-0000-000000000000	718752e2-37db-4f36-b855-863db53733cd	{"action":"token_refreshed","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-28 10:09:49.475149+00	
00000000-0000-0000-0000-000000000000	74d0211b-f792-459d-8a16-049f401561ef	{"action":"token_revoked","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-28 10:09:49.475918+00	
00000000-0000-0000-0000-000000000000	8a162357-68c2-4c7d-b751-f52b206d7b74	{"action":"token_refreshed","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-28 10:32:14.72575+00	
00000000-0000-0000-0000-000000000000	600af383-b50f-4597-8786-25f4d20a364d	{"action":"token_revoked","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-05-28 10:32:14.7287+00	
00000000-0000-0000-0000-000000000000	1df91537-ee1b-44c5-be73-f0e7c898923f	{"action":"user_repeated_signup","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-05-28 10:33:09.662126+00	
00000000-0000-0000-0000-000000000000	ab1c119c-0385-4317-8a9e-4b7c4dfe1522	{"action":"login","actor_id":"d01d56c1-141c-4153-b368-8e8b6e204ca5","actor_username":"secfathy@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-05-28 10:33:16.279152+00	
\.


--
-- TOC entry 4054 (class 0 OID 16901)
-- Dependencies: 250
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- TOC entry 4045 (class 0 OID 16698)
-- Dependencies: 241
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
d01d56c1-141c-4153-b368-8e8b6e204ca5	d01d56c1-141c-4153-b368-8e8b6e204ca5	{"sub": "d01d56c1-141c-4153-b368-8e8b6e204ca5", "email": "secfathy@gmail.com", "email_verified": true, "phone_verified": false}	email	2025-05-28 09:10:43.221696+00	2025-05-28 09:10:43.222556+00	2025-05-28 09:10:43.222556+00	25586fd1-e904-4a1f-ae19-03fed6b59c0e
\.


--
-- TOC entry 4039 (class 0 OID 16505)
-- Dependencies: 232
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4049 (class 0 OID 16788)
-- Dependencies: 245
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
9c054204-b2a8-4eda-b2d7-a40b583d1c18	2025-05-28 09:11:15.870668+00	2025-05-28 09:11:15.870668+00	otp	b10f2b11-262e-4c56-9ebb-e03b444c32f9
1e8f3762-4fa9-415c-8048-80d2cae8af5c	2025-05-28 09:11:39.337355+00	2025-05-28 09:11:39.337355+00	password	013f5908-6403-4f53-bdcb-eb342ae5211f
68f1f09f-f4b9-4dc3-9ecc-1950d2d042a4	2025-05-28 09:28:36.653+00	2025-05-28 09:28:36.653+00	password	421449f9-a369-46ee-ad76-1567d7174a83
0d3391cf-2973-4bf0-a2b7-6874a3815e1a	2025-05-28 09:45:55.586013+00	2025-05-28 09:45:55.586013+00	password	5caab4ac-492f-48d4-8e5c-5ac8f63389d2
8363bfce-b44b-43e7-847a-2742015f6e0b	2025-05-28 10:33:16.282486+00	2025-05-28 10:33:16.282486+00	password	639a1228-6799-4101-8694-e3254f313633
\.


--
-- TOC entry 4048 (class 0 OID 16776)
-- Dependencies: 244
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- TOC entry 4047 (class 0 OID 16763)
-- Dependencies: 243
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- TOC entry 4055 (class 0 OID 16951)
-- Dependencies: 251
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4038 (class 0 OID 16494)
-- Dependencies: 231
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	1	qonbe6emo45c	d01d56c1-141c-4153-b368-8e8b6e204ca5	f	2025-05-28 09:11:15.865554+00	2025-05-28 09:11:15.865554+00	\N	9c054204-b2a8-4eda-b2d7-a40b583d1c18
00000000-0000-0000-0000-000000000000	4	y7agf24qn5vm	d01d56c1-141c-4153-b368-8e8b6e204ca5	f	2025-05-28 09:45:55.582651+00	2025-05-28 09:45:55.582651+00	\N	0d3391cf-2973-4bf0-a2b7-6874a3815e1a
00000000-0000-0000-0000-000000000000	2	mntmzmfpgnrh	d01d56c1-141c-4153-b368-8e8b6e204ca5	t	2025-05-28 09:11:39.335407+00	2025-05-28 10:09:49.476388+00	\N	1e8f3762-4fa9-415c-8048-80d2cae8af5c
00000000-0000-0000-0000-000000000000	5	hxj36hay2ax5	d01d56c1-141c-4153-b368-8e8b6e204ca5	f	2025-05-28 10:09:49.478897+00	2025-05-28 10:09:49.478897+00	mntmzmfpgnrh	1e8f3762-4fa9-415c-8048-80d2cae8af5c
00000000-0000-0000-0000-000000000000	3	fc734ab453qp	d01d56c1-141c-4153-b368-8e8b6e204ca5	t	2025-05-28 09:28:36.650353+00	2025-05-28 10:32:14.729244+00	\N	68f1f09f-f4b9-4dc3-9ecc-1950d2d042a4
00000000-0000-0000-0000-000000000000	6	sfab7qooh2vj	d01d56c1-141c-4153-b368-8e8b6e204ca5	f	2025-05-28 10:32:14.731283+00	2025-05-28 10:32:14.731283+00	fc734ab453qp	68f1f09f-f4b9-4dc3-9ecc-1950d2d042a4
00000000-0000-0000-0000-000000000000	7	kk322nd5idzk	d01d56c1-141c-4153-b368-8e8b6e204ca5	f	2025-05-28 10:33:16.28064+00	2025-05-28 10:33:16.28064+00	\N	8363bfce-b44b-43e7-847a-2742015f6e0b
\.


--
-- TOC entry 4052 (class 0 OID 16830)
-- Dependencies: 248
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- TOC entry 4053 (class 0 OID 16848)
-- Dependencies: 249
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- TOC entry 4041 (class 0 OID 16520)
-- Dependencies: 234
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
\.


--
-- TOC entry 4046 (class 0 OID 16728)
-- Dependencies: 242
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
9c054204-b2a8-4eda-b2d7-a40b583d1c18	d01d56c1-141c-4153-b368-8e8b6e204ca5	2025-05-28 09:11:15.861778+00	2025-05-28 09:11:15.861778+00	\N	aal1	\N	\N	Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1	105.93.73.6	\N
0d3391cf-2973-4bf0-a2b7-6874a3815e1a	d01d56c1-141c-4153-b368-8e8b6e204ca5	2025-05-28 09:45:55.58091+00	2025-05-28 09:45:55.58091+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36	156.174.5.92	\N
1e8f3762-4fa9-415c-8048-80d2cae8af5c	d01d56c1-141c-4153-b368-8e8b6e204ca5	2025-05-28 09:11:39.334596+00	2025-05-28 10:09:49.482+00	\N	aal1	\N	2025-05-28 10:09:49.481919	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36	156.174.5.92	\N
68f1f09f-f4b9-4dc3-9ecc-1950d2d042a4	d01d56c1-141c-4153-b368-8e8b6e204ca5	2025-05-28 09:28:36.648701+00	2025-05-28 10:32:14.734952+00	\N	aal1	\N	2025-05-28 10:32:14.734883	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36	156.174.5.92	\N
8363bfce-b44b-43e7-847a-2742015f6e0b	d01d56c1-141c-4153-b368-8e8b6e204ca5	2025-05-28 10:33:16.279866+00	2025-05-28 10:33:16.279866+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36	156.174.5.92	\N
\.


--
-- TOC entry 4051 (class 0 OID 16815)
-- Dependencies: 247
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4050 (class 0 OID 16806)
-- Dependencies: 246
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4036 (class 0 OID 16482)
-- Dependencies: 229
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	d01d56c1-141c-4153-b368-8e8b6e204ca5	authenticated	authenticated	secfathy@gmail.com	$2a$10$MOzfCS.qmWoJaXUquOBQouJGM6ocLrvoSFd29bgpCIgMUzl3tYi5O	2025-05-28 09:11:15.858685+00	\N		2025-05-28 09:10:43.235183+00		\N			\N	2025-05-28 10:33:16.279788+00	{"provider": "email", "providers": ["email"]}	{"sub": "d01d56c1-141c-4153-b368-8e8b6e204ca5", "email": "secfathy@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-05-28 09:10:43.194862+00	2025-05-28 10:33:16.281496+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- TOC entry 4064 (class 0 OID 17331)
-- Dependencies: 264
-- Data for Name: bugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bugs (id, user_id, program_id, title, description, severity, status, bounty_amount, submission_date, resolution_date, vulnerability_type, poc_steps, impact_description, remediation_suggestion, created_at, updated_at) FROM stdin;
544bd076-1a1d-4ff2-8860-af3108969950	d01d56c1-141c-4153-b368-8e8b6e204ca5	8f6d4039-c640-466c-937d-2cb0cc72f429	XXSS	SSS	Medium	Draft	0.00	2025-05-28	\N	XSS	sdas	dasda	asdsad	2025-05-28 09:14:09.414154+00	2025-05-28 09:14:09.414154+00
\.


--
-- TOC entry 4066 (class 0 OID 17357)
-- Dependencies: 266
-- Data for Name: checklist_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.checklist_items (id, checklist_id, text, is_completed, order_index, created_at) FROM stdin;
\.


--
-- TOC entry 4070 (class 0 OID 17422)
-- Dependencies: 270
-- Data for Name: link_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.link_categories (id, user_id, name, created_at) FROM stdin;
5f8261af-4601-4751-9899-baa7ca1b99d4	d01d56c1-141c-4153-b368-8e8b6e204ca5	Hacking	2025-05-28 09:46:37.295206+00
\.


--
-- TOC entry 4069 (class 0 OID 17407)
-- Dependencies: 269
-- Data for Name: personal_notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_notes (id, user_id, title, content, created_at, updated_at) FROM stdin;
24bd8ea1-90c2-42f4-af4e-1badf5dc031b	d01d56c1-141c-4153-b368-8e8b6e204ca5	Quick Note	fgdgdf	2025-05-28 09:46:06.310849+00	2025-05-28 09:46:06.310849+00
\.


--
-- TOC entry 4061 (class 0 OID 17283)
-- Dependencies: 261
-- Data for Name: platforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.platforms (id, name, url, platform_type, description, created_at, updated_at) FROM stdin;
2327b4c1-cfd4-4717-a78b-8d6e52fc6f52	HackerOne	https://hackerone.com	bug_bounty	Leading bug bounty platform	2025-05-28 09:04:53.013748+00	2025-05-28 09:04:53.013748+00
c371c852-f8a4-449d-85f8-b6309e20044a	Bugcrowd	https://bugcrowd.com	bug_bounty	Crowdsourced security platform	2025-05-28 09:04:53.013748+00	2025-05-28 09:04:53.013748+00
7456337b-53ec-4e0a-9141-db014565f711	Intigriti	https://intigriti.com	bug_bounty	European bug bounty platform	2025-05-28 09:04:53.013748+00	2025-05-28 09:04:53.013748+00
20d8a017-b373-4fb0-a293-ea4cb634aca0	YesWeHack	https://yeswehack.com	bug_bounty	Global bug bounty platform	2025-05-28 09:04:53.013748+00	2025-05-28 09:04:53.013748+00
0db40a4f-7961-4191-af47-b0f3a83324d6	Synack	https://synack.com	bug_bounty	Invite-only bug bounty platform	2025-05-28 09:04:53.013748+00	2025-05-28 09:04:53.013748+00
\.


--
-- TOC entry 4072 (class 0 OID 17463)
-- Dependencies: 272
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, first_name, last_name, username, avatar_url, updated_at, created_at) FROM stdin;
d01d56c1-141c-4153-b368-8e8b6e204ca5	Mohamed	Khaled	secfathy	\N	2025-05-28 10:07:19.514+00	2025-05-28 09:56:00.487271+00
\.


--
-- TOC entry 4063 (class 0 OID 17315)
-- Dependencies: 263
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programs (id, platform_id, name, company, scope, max_bounty, min_bounty, program_url, is_active, created_at, updated_at) FROM stdin;
8f6d4039-c640-466c-937d-2cb0cc72f429	c371c852-f8a4-449d-85f8-b6309e20044a	Zipy	Zipy	34324	0.00	132.00	https://lovable.dev/projects/11897fab-ee63-44b9-ae9c-3015262aff19	t	2025-05-28 09:13:49.299736+00	2025-05-28 09:13:49.299736+00
\.


--
-- TOC entry 4068 (class 0 OID 17383)
-- Dependencies: 268
-- Data for Name: reading_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reading_list (id, user_id, title, url, description, category, is_read, priority, created_at, updated_at) FROM stdin;
8fb947de-6c95-42e5-8690-2db7f28216db	d01d56c1-141c-4153-b368-8e8b6e204ca5	Vulnerabilities in CISA KEV Are Not Equally Critical: Report	https://www.securityweek.com/vulnerabilities-in-cisa-kev-are-not-equally-critical-report/		Security News	t	1	2025-05-28 10:08:11.292659+00	2025-05-28 10:08:11.292659+00
3a0acf7e-070f-4745-a69d-c891ec1da62f	d01d56c1-141c-4153-b368-8e8b6e204ca5	Adidas Customer Data Stolen in Third-Party Attack	https://www.infosecurity-magazine.com/news/adidas-customer-data-third-party/	Adidas revealed that customer contact information, including names, emails and phone numbers were accessed by an unauthorized party	Security News	t	1	2025-05-28 10:07:58.955156+00	2025-05-28 10:07:58.955156+00
95609921-f13e-4b9a-a03c-72e436eb182e	d01d56c1-141c-4153-b368-8e8b6e204ca5	Adidas Customer Data Stolen in Third-Party Attack	https://www.infosecurity-magazine.com/news/adidas-customer-data-third-party/	Adidas revealed that customer contact information, including names, emails and phone numbers were accessed by an unauthorized party	Security News	t	1	2025-05-28 10:07:45.182178+00	2025-05-28 10:07:45.182178+00
\.


--
-- TOC entry 4074 (class 0 OID 17490)
-- Dependencies: 274
-- Data for Name: rss_articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rss_articles (id, feed_id, title, description, link, pub_date, guid, author, created_at) FROM stdin;
490c0fff-e63e-4d5c-8277-6b701cf7232c	9a804079-c854-4cf5-aa20-9068714f9b64	Oops: DanaBot Malware Devs Infected Their Own PCs	The U.S. government today unsealed criminal charges against 16 individuals accused of operating and selling DanaBot, a prolific strain of information-stealing malware that has been sold on Russian cybercrime forums since 2018. The FBI says a newer version of DanaBot was used for espionage, and that many of the defendants exposed their real-life identities after accidentally infecting their own systems with the malware.	https://krebsonsecurity.com/2025/05/oops-danabot-malware-devs-infected-their-own-pcs/	2025-05-22 21:53:21+00	https://krebsonsecurity.com/?p=71351	BrianKrebs	2025-05-28 10:07:33.091125+00
494fe9bd-b466-49f9-9d49-5b828d891120	9a804079-c854-4cf5-aa20-9068714f9b64	KrebsOnSecurity Hit With Near-Record 6.3 Tbps DDoS	KrebsOnSecurity last week was hit by a near record distributed denial-of-service (DDoS) attack that clocked in at more than 6.3 terabits of data per second (a terabit is one trillion bits of data). The brief attack appears to have been a test run for a massive new Internet of Things (IoT) botnet capable of launching crippling digital assaults that few web destinations can withstand. Read on for more about the botnet, the attack, and the apparent creator of this global menace.	https://krebsonsecurity.com/2025/05/krebsonsecurity-hit-with-near-record-6-3-tbps-ddos/	2025-05-20 21:30:30+00	https://krebsonsecurity.com/?p=71303	BrianKrebs	2025-05-28 10:07:33.132816+00
388069d0-9378-4523-ae8d-480fec70cc5b	9a804079-c854-4cf5-aa20-9068714f9b64	Breachforums Boss to Pay $700k in Healthcare Breach	In what experts are calling a novel legal outcome, the 22-year-old former administrator of the cybercrime community Breachforums will forfeit nearly $700,000 to settle a civil lawsuit from a health insurance company whose customer data was posted for sale on the forum in 2023. Conor Brian Fitzpatrick, a.k.a. "Pompompurin," is slated for resentencing next month after pleading guilty to access device fraud and possession of child sexual abuse material (CSAM).	https://krebsonsecurity.com/2025/05/breachforums-boss-to-pay-700k-in-healthcare-breach/	2025-05-15 19:56:51+00	https://krebsonsecurity.com/?p=71263	BrianKrebs	2025-05-28 10:07:33.165858+00
1f76109b-e6d0-483e-b98a-1d2a67935cd5	8e59e816-a809-4a26-a41f-7707e923932f	Apple Blocks $9 Billion in Fraud Over 5 Years Amid Rising App Store Threats		https://thehackernews.com/2025/05/apple-blocks-9-billion-in-fraud-over-5.html	2025-05-28 06:11:00+00	https://thehackernews.com/2025/05/apple-blocks-9-billion-in-fraud-over-5.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.18404+00
429719cb-a582-42b0-8416-e6dda534263e	9a804079-c854-4cf5-aa20-9068714f9b64	Patch Tuesday, May 2025 Edition	Microsoft on Tuesday released software updates to fix at least 70 vulnerabilities in Windows and related products, including five zero-day flaws that are already seeing active exploitation. Adding to the sense of urgency with this month's patch batch from Redmond are fixes for two other weaknesses that now have public proof-of-concept exploits available.	https://krebsonsecurity.com/2025/05/patch-tuesday-may-2025-edition/	2025-05-14 11:57:48+00	https://krebsonsecurity.com/?p=71250	BrianKrebs	2025-05-28 10:07:33.185837+00
b8b65b6b-b47a-4e6e-8b29-23438489c9f1	8e59e816-a809-4a26-a41f-7707e923932f	New Self-Spreading Malware Infects Docker Containers to Mine Dero Cryptocurrency		https://thehackernews.com/2025/05/new-self-spreading-malware-infects.html	2025-05-27 16:23:00+00	https://thehackernews.com/2025/05/new-self-spreading-malware-infects.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.218423+00
8d82de76-16ab-423a-92be-c89de0d18eff	9a804079-c854-4cf5-aa20-9068714f9b64	Pakistani Firm Shipped Fentanyl Analogs, Scams to US	A Texas firm recently charged with conspiring to distribute synthetic opioids in the United States is at the center of a vast network of companies in the U.S. and Pakistan whose employees are accused of using online ads to scam westerners seeking help with trademarks, book writing, mobile app development and logo designs, a new investigation reveals.	https://krebsonsecurity.com/2025/05/pakistani-firm-shipped-fentanyl-analogs-scams-to-us/	2025-05-07 22:22:48+00	https://krebsonsecurity.com/?p=70782	BrianKrebs	2025-05-28 10:07:33.21998+00
0c3818a7-cc24-4379-a50d-681f7ef7fdee	9a804079-c854-4cf5-aa20-9068714f9b64	xAI Dev Leaks API Key for Private SpaceX, Tesla LLMs	A employee at Elon Musk's artificial intelligence company xAI leaked a private key on GitHub that for the past two months could have allowed anyone to query private xAI large language models (LLMs) which appear to have been custom made for working with internal data from Musk's companies, including SpaceX, Tesla and Twitter/X, KrebsOnSecurity has learned.	https://krebsonsecurity.com/2025/05/xai-dev-leaks-api-key-for-private-spacex-tesla-llms/	2025-05-02 00:52:00+00	https://krebsonsecurity.com/?p=71165	BrianKrebs	2025-05-28 10:07:33.248729+00
2208dc69-b5bd-4a8c-9ff9-3a64b13b04a7	8e59e816-a809-4a26-a41f-7707e923932f	Cybercriminals Clone Antivirus Site to Spread Venom RAT and Steal Crypto Wallets		https://thehackernews.com/2025/05/cybercriminals-clone-antivirus-site-to_4.html	2025-05-27 14:10:00+00	https://thehackernews.com/2025/05/cybercriminals-clone-antivirus-site-to_4.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.256287+00
dac3cc92-412e-4301-816d-77699c3d0e0b	8e59e816-a809-4a26-a41f-7707e923932f	Russian Hackers Breach 20+ NGOs Using Evilginx Phishing via Fake Microsoft Entra Pages		https://thehackernews.com/2025/05/russian-hackers-breach-20-ngos-using.html	2025-05-27 11:51:00+00	https://thehackernews.com/2025/05/russian-hackers-breach-20-ngos-using.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.277172+00
08df4911-e54d-4a8a-bdc1-299ffeb9e1e6	9a804079-c854-4cf5-aa20-9068714f9b64	Alleged &#8216;Scattered Spider&#8217; Member Extradited to U.S.	A 23-year-old Scottish man thought to be a member of the prolific Scattered Spider cybercrime group was extradited last week from Spain to the United States, where he is facing charges of wire fraud, conspiracy and identity theft. U.S. prosecutors allege Tyler Robert Buchanan and co-conspirators hacked into dozens of companies in the United States and abroad, and that he personally controlled more than $26 million stolen from victims.	https://krebsonsecurity.com/2025/04/alleged-scattered-spider-member-extradited-to-u-s/	2025-04-30 21:54:59+00	https://krebsonsecurity.com/?p=71147	BrianKrebs	2025-05-28 10:07:33.284054+00
655ee600-0639-41ee-b556-32aeec7e08ad	8e59e816-a809-4a26-a41f-7707e923932f	AI Agents and the Non‑Human Identity Crisis: How to Deploy AI More Securely at Scale		https://thehackernews.com/2025/05/ai-agents-and-nonhuman-identity-crisis.html	2025-05-27 11:00:00+00	https://thehackernews.com/2025/05/ai-agents-and-nonhuman-identity-crisis.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.308761+00
0ffc5a42-58df-4a61-a2ab-a7ee815bc381	9a804079-c854-4cf5-aa20-9068714f9b64	DOGE Worker&#8217;s Code Supports NLRB Whistleblower	A whistleblower at the National Labor Relations Board (NLRB) alleged last week that denizens of Elon Musk's Department of Government Efficiency (DOGE) siphoned gigabytes of data from the agency's sensitive case files in early March. The whistleblower said accounts created for DOGE at the NLRB downloaded three code repositories from GitHub. Further investigation into one of those code bundles shows it is remarkably similar to a program published in January 2025 by Marko Elez, a 25-year-old DOGE e	https://krebsonsecurity.com/2025/04/doge-workers-code-supports-nlrb-whistleblower/	2025-04-23 20:45:04+00	https://krebsonsecurity.com/?p=71075	BrianKrebs	2025-05-28 10:07:33.316277+00
0abe8fc3-f536-4667-aca2-f34bfc46a9d6	8e59e816-a809-4a26-a41f-7707e923932f	Employees Searching Payroll Portals on Google Tricked Into Sending Paychecks to Hackers		https://thehackernews.com/2025/05/employees-searching-payroll-portals-on.html	2025-05-27 09:52:00+00	https://thehackernews.com/2025/05/employees-searching-payroll-portals-on.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.332352+00
7a5a7d8c-df5b-4c1f-bc49-abd016c3e898	8e59e816-a809-4a26-a41f-7707e923932f	Hackers Are Calling Your Office: FBI Alerts Law Firms to Luna Moth’s Stealth Phishing Campaign		https://thehackernews.com/2025/05/hackers-are-calling-your-office-fbi.html	2025-05-27 07:11:00+00	https://thehackernews.com/2025/05/hackers-are-calling-your-office-fbi.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.366168+00
da086624-d04c-4b0f-b254-140680c1a7f8	9a804079-c854-4cf5-aa20-9068714f9b64	Whistleblower: DOGE Siphoned NLRB Case Data	A security architect with the National Labor Relations Board (NLRB) alleges that employees from Elon Musk's Department of Government Efficiency (DOGE) transferred gigabytes of sensitive data from agency case files in early March, using short-lived accounts configured to leave few traces of network activity. The NLRB whistleblower said the unusual large data outflows coincided with multiple blocked login attempts from an Internet address in Russia that tried to use valid credentials for a newly-c	https://krebsonsecurity.com/2025/04/whistleblower-doge-siphoned-nlrb-case-data/	2025-04-22 01:48:27+00	https://krebsonsecurity.com/?p=71035	BrianKrebs	2025-05-28 10:07:33.339817+00
5e7e747a-99fb-46aa-8e1f-f6584e28007f	9a804079-c854-4cf5-aa20-9068714f9b64	Funding Expires for Key Cyber Vulnerability Database	A critical resource that cybersecurity professionals worldwide rely on to identify, mitigate and fix security vulnerabilities in software and hardware is in danger of breaking down. The federally funded, non-profit research and development organization MITRE warned today that its contract to maintain the Common Vulnerabilities and Exposures (CVE) program -- which is traditionally funded each year by the Department of Homeland Security -- expires on April 16.	https://krebsonsecurity.com/2025/04/funding-expires-for-key-cyber-vulnerability-database/	2025-04-16 03:59:18+00	https://krebsonsecurity.com/?p=71010	BrianKrebs	2025-05-28 10:07:33.371356+00
b6ea9642-2d9a-46af-826b-5202a1dfd0d7	8e59e816-a809-4a26-a41f-7707e923932f	Over 70 Malicious npm and VS Code Packages Found Stealing Data and Crypto		https://thehackernews.com/2025/05/over-70-malicious-npm-and-vs-code.html	2025-05-26 14:17:00+00	https://thehackernews.com/2025/05/over-70-malicious-npm-and-vs-code.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.433675+00
34779db1-dad3-4ae8-9939-d242ce5315e5	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	Drag and Pwnd: Leverage ASCII characters to exploit VS Code	Control characters like SOH, STX, EOT and ETX were never meant to run your code - but in the world of modern terminal emulators, they sometimes do. In this post, I'll dive into the forgotten mechanics	https://portswigger.net/research/drag-and-pwnd-leverage-ascii-characters-to-exploit-vs-code	2025-04-30 12:37:11+00	drag-and-pwnd-leverage-ascii-characters-to-exploit-vs-code		2025-05-28 10:07:34.618994+00
942f88b0-68e9-479b-ac67-f0f7974c94ed	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	SAML roulette: the hacker always wins	Introduction In this post, we’ll show precisely how to chain round-trip attacks and namespace confusion to achieve unauthenticated admin access on GitLab Enterprise by exploiting the ruby-saml library	https://portswigger.net/research/saml-roulette-the-hacker-always-wins	2025-03-18 14:55:43+00	saml-roulette-the-hacker-always-wins		2025-05-28 10:07:34.662838+00
4a40a31f-d491-47d4-a42f-400b9f0139d3	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	Top 10 web hacking techniques of 2024	Welcome to the Top 10 Web Hacking Techniques of 2024, the 18th edition of our annual community-powered effort to identify the most innovative must-read web security research published in the last year	https://portswigger.net/research/top-10-web-hacking-techniques-of-2024	2025-02-04 15:01:48+00	top-10-web-hacking-techniques-of-2024		2025-05-28 10:07:34.73105+00
e7e747d8-5a2f-48d4-9678-1e6cc8af21c9	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	Bypassing character blocklists with unicode overflows	Unicode codepoint truncation - also called a Unicode overflow attack - happens when a server tries to store a Unicode character in a single byte. Because the maximum value of a byte is 255, an overflo	https://portswigger.net/research/bypassing-character-blocklists-with-unicode-overflows	2025-01-28 13:58:28+00	bypassing-character-blocklists-with-unicode-overflows		2025-05-28 10:07:34.760264+00
2763ebdd-18cb-4b99-b4c4-49789952805a	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	Stealing HttpOnly cookies with the cookie sandwich technique	In this post, I will introduce the "cookie sandwich" technique which lets you bypass the HttpOnly flag on certain servers. This research follows on from Bypassing WAFs with the phantom $Version cookie	https://portswigger.net/research/stealing-httponly-cookies-with-the-cookie-sandwich-technique	2025-01-22 14:45:11+00	stealing-httponly-cookies-with-the-cookie-sandwich-technique		2025-05-28 10:07:34.785452+00
b05da523-cc0e-4682-8c9e-506b10f84a22	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	Top 10 web hacking techniques of 2024: nominations open	Nominations are now open for the top 10 new web hacking techniques of 2024! Every year, security researchers from all over the world share their latest findings via blog posts, presentations, PoCs, an	https://portswigger.net/research/top-10-web-hacking-techniques-of-2024-nominations-open	2025-01-08 14:07:27+00	top-10-web-hacking-techniques-of-2024-nominations-open		2025-05-28 10:07:34.810282+00
a06f35e3-e9ce-4be0-82ef-6346087561db	25ac0693-284f-4de6-83b1-b906498ff48a	Hacking Insights: Gaining Access to University of Hyderabad Ganglia Dashboard		https://infosecwriteups.com/hacking-insights-gaining-access-to-university-of-hyderabad-ganglia-dashboard-bdc15f3a82fe?source=rss----7b722bfd1b8d---4	2025-05-28 04:53:55+00	https://medium.com/p/bdc15f3a82fe	ARoy	2025-05-28 10:07:34.831519+00
3e675a9e-d407-4754-9244-b8eb02cf6b0f	25ac0693-284f-4de6-83b1-b906498ff48a	Part 3: How to Become a Pentester in 2025: Programming & Scripting Foundations for pentester		https://infosecwriteups.com/part-3-how-to-become-a-pentester-in-2025-programming-scripting-foundations-for-pentester-c57334e7a8fe?source=rss----7b722bfd1b8d---4	2025-05-28 04:53:18+00	https://medium.com/p/c57334e7a8fe	Anezaneo	2025-05-28 10:07:34.855843+00
c24dace5-04c0-4cca-ba89-afb46bd68650	25ac0693-284f-4de6-83b1-b906498ff48a	Day 5: DOM XSS in jQuery anchor href attribute sink using location.search		https://infosecwriteups.com/day-5-dom-xss-in-jquery-anchor-href-attribute-sink-using-location-search-afc598397e24?source=rss----7b722bfd1b8d---4	2025-05-28 04:51:12+00	https://medium.com/p/afc598397e24	RayofHope	2025-05-28 10:07:34.903872+00
98e48af3-3d70-4a74-9b42-2d0d87d59cc8	25ac0693-284f-4de6-83b1-b906498ff48a	Header Injection to Hero: How I Hijacked Emails and Made the Server Sing	Hey there!&#x1F601;Continue reading on InfoSec Write-ups »	https://infosecwriteups.com/header-injection-to-hero-how-i-hijacked-emails-and-made-the-server-sing-7b8817e3736c?source=rss----7b722bfd1b8d---4	2025-05-28 04:50:31+00	https://medium.com/p/7b8817e3736c	Iski	2025-05-28 10:07:34.945479+00
225bdde1-1653-4fc5-a9f7-b18428cdca06	04ba3390-d8a5-4a26-8c80-88e7b589a303	Indian Police Arrest Cybercrime Gang Copycats of Myanmar Biz Model	The region offers attractive conditions: a large pool of tech workers, economic disparity, and weak enforcement of cybercrime laws — all of which attract businesses legitimate and shady.	<![CDATA[https://www.darkreading.com/cyberattacks-data-breaches/indian-police-arrest-cybercrime-gang-copycats-myanmar-biz-model]]>	2025-05-28 03:30:00+00	<![CDATA[https://www.darkreading.com/cyberattacks-data-breaches/indian-police-arrest-cybercrime-gang-copycats-myanmar-biz-model]]>	Robert Lemos, Contributing Writer	2025-05-28 10:07:35.052316+00
b5f21f3e-8847-4051-8fa6-656f8a2bfbb8	04ba3390-d8a5-4a26-8c80-88e7b589a303	CISA Warns of Attacks Targeting Commvault SaaS Environment	A threat actor has gained access to Microsoft 365 environments of a small number of customers of Commvault's Metallic service.	<![CDATA[https://www.darkreading.com/cloud-security/cisa-warns-attacks-commvault-saas-environment]]>	2025-05-27 21:22:27+00	<![CDATA[https://www.darkreading.com/cloud-security/cisa-warns-attacks-commvault-saas-environment]]>	Jai Vijayan, Contributing Writer	2025-05-28 10:07:35.095653+00
fb2ba4f7-912b-49ea-9f96-f667567ae6fc	04ba3390-d8a5-4a26-8c80-88e7b589a303	MathWorks, Creator of MATLAB, Confirms Ransomware Attack	The attack dirsupted MathWorks' systems and online applications, but it remains unclear which ransomware group targeted the software company and whether they stole any data.	<![CDATA[https://www.darkreading.com/vulnerabilities-threats/mathworks-confirms-ransomware-attack]]>	2025-05-27 17:27:19+00	<![CDATA[https://www.darkreading.com/vulnerabilities-threats/mathworks-confirms-ransomware-attack]]>	Kristina Beek, Associate Editor, Dark Reading	2025-05-28 10:07:35.140881+00
5d591627-8ab9-4209-8d13-cfd1aede5124	8e59e816-a809-4a26-a41f-7707e923932f	Russia-Linked Hackers Target Tajikistan Government with Weaponized Word Documents		https://thehackernews.com/2025/05/russia-linked-hackers-target-tajikistan.html	2025-05-27 06:54:00+00	https://thehackernews.com/2025/05/russia-linked-hackers-target-tajikistan.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.396004+00
d64c16a4-73bb-4f4a-a31a-575287a64d48	8e59e816-a809-4a26-a41f-7707e923932f	CISO's Guide To Web Privacy Validation And Why It's Important		https://thehackernews.com/2025/05/cisos-guide-to-web-privacy-validation.html	2025-05-26 11:25:00+00	https://thehackernews.com/2025/05/cisos-guide-to-web-privacy-validation.html	info@thehackernews.com (The Hacker News)	2025-05-28 10:07:33.464558+00
9647e507-00a7-4172-a164-abe6299fef47	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	Document My Pentest: you hack, the AI writes it up!	Tired of repeating yourself? Automate your web security audit trail. In this post I'll introduce a new Burp AI extension that takes the boring bits out of your pen test. Web security testing can be a	https://portswigger.net/research/document-my-pentest	2025-04-23 13:17:24+00	document-my-pentest		2025-05-28 10:07:34.639909+00
d733d86c-54de-455c-8c65-75e30a6e5536	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	Shadow Repeater:AI-enhanced manual testing	Have you ever wondered how many vulnerabilities you've missed by a hair's breadth, due to a single flawed choice? We've just released Shadow Repeater, which enhances your manual testing with AI-powere	https://portswigger.net/research/shadow-repeater-ai-enhanced-manual-testing	2025-02-20 13:20:19+00	shadow-repeater-ai-enhanced-manual-testing		2025-05-28 10:07:34.710662+00
a9656438-77eb-410f-80e5-068c17461621	25ac0693-284f-4de6-83b1-b906498ff48a	$500 Bounty: Shopify Referrer Leak: Hijacking Storefront Access with a Single Token	Referrer Header Leaks + Iframe Injection = Storefront Password BypassContinue reading on InfoSec Write-ups »	https://infosecwriteups.com/500-bounty-shopify-referrer-leak-hijacking-storefront-access-with-a-single-token-4edc0de09cff?source=rss----7b722bfd1b8d---4	2025-05-28 04:55:38+00	https://medium.com/p/4edc0de09cff	Monika sharma	2025-05-28 10:07:34.758977+00
2b043dcc-7123-4ebd-90e7-9b1da5a2e4e3	25ac0693-284f-4de6-83b1-b906498ff48a	Extracting saved passwords in Chrome using python		https://infosecwriteups.com/extracting-saved-passwords-in-chrome-using-python-554c789ab00d?source=rss----7b722bfd1b8d---4	2025-05-28 04:54:45+00	https://medium.com/p/554c789ab00d	Aleksa Zatezalo	2025-05-28 10:07:34.782488+00
e71b18bb-2c61-4ded-9128-826910512bc0	25ac0693-284f-4de6-83b1-b906498ff48a	Profiler: Your Digital Detective Platform		https://infosecwriteups.com/profiler-your-digital-detective-platform-70c7383fab50?source=rss----7b722bfd1b8d---4	2025-05-28 04:54:26+00	https://medium.com/p/70c7383fab50	Aayush anand	2025-05-28 10:07:34.802448+00
5add87e4-9807-47ce-bd31-47f6c83d9a64	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	Bypassing WAFs with the phantom $Version cookie	HTTP cookies often control critical website features, but their long and convoluted history exposes them to parser discrepancy vulnerabilities. In this post, I'll explore some dangerous, lesser-known	https://portswigger.net/research/bypassing-wafs-with-the-phantom-version-cookie	2024-12-04 15:03:35+00	bypassing-wafs-with-the-phantom-version-cookie		2025-05-28 10:07:34.831216+00
f791420d-8f67-4e5d-bf61-9e0c071eb85d	5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	New crazy payloads in the URL Validation Bypass Cheat Sheet	The strength of our URL Validation Bypass Cheat Sheet lies in the contributions from the web security community, and today’s update is no exception. We are excited to introduce a new and improved IP a	https://portswigger.net/research/new-crazy-payloads-in-the-url-validation-bypass-cheat-sheet	2024-10-29 13:59:13+00	new-crazy-payloads-in-the-url-validation-bypass-cheat-sheet		2025-05-28 10:07:34.852572+00
69d5f6a3-b80c-4927-b6b7-3ef67c72d398	25ac0693-284f-4de6-83b1-b906498ff48a	$750 Bounty: for HTTP Reset Password Link in Mattermost	How an Unsecured Protocol in a Critical Workflow Opened the Door for Network-Based Account TakeoversContinue reading on InfoSec Write-ups »	https://infosecwriteups.com/750-bounty-for-http-reset-password-link-in-mattermost-3cc3acdb0f85?source=rss----7b722bfd1b8d---4	2025-05-28 04:51:27+00	https://medium.com/p/3cc3acdb0f85	Monika sharma	2025-05-28 10:07:34.879956+00
b8ad87fb-7578-4932-957e-58acd5e9f221	25ac0693-284f-4de6-83b1-b906498ff48a	Exploiting Web Cache Poisoning with X-Host Header Using Param Miner	[Write-up] Web Cache Poisoning Using an Unknown Header.Continue reading on InfoSec Write-ups »	https://infosecwriteups.com/exploiting-web-cache-poisoning-with-x-host-header-using-param-miner-f1b7b06bf5b8?source=rss----7b722bfd1b8d---4	2025-05-28 04:50:53+00	https://medium.com/p/f1b7b06bf5b8	Bash Overflow	2025-05-28 10:07:34.925806+00
b56de8f3-0db7-4a14-9a19-537933b3d5a4	25ac0693-284f-4de6-83b1-b906498ff48a	Beyond best practices: Using OWASP ASVS to bake security into your delivery pipeline for 2025	How to turn a community-driven checklist into a living part of your SDLC.Continue reading on InfoSec Write-ups »	https://infosecwriteups.com/beyond-best-practices-using-owasp-asvs-to-bake-security-into-your-delivery-pipeline-for-2025-36ff24c06960?source=rss----7b722bfd1b8d---4	2025-05-27 07:06:05+00	https://medium.com/p/36ff24c06960	Roman Huliak	2025-05-28 10:07:34.964183+00
97f0b8fa-b4c4-4c33-a503-2e46db701bdd	04ba3390-d8a5-4a26-8c80-88e7b589a303	Adidas Falls Victim to Third-Party Data Breach	Though Adidas said that no payment or financial information was affected in the breach, individuals who contacted the compamy's customer service help desk were impacted.	<![CDATA[https://www.darkreading.com/vulnerabilities-threats/adidas-victim-third-party-data-breach]]>	2025-05-27 21:38:05+00	<![CDATA[https://www.darkreading.com/vulnerabilities-threats/adidas-victim-third-party-data-breach]]>	Kristina Beek, Associate Editor, Dark Reading	2025-05-28 10:07:35.075529+00
6db6c641-2447-4297-a91e-ed57afe84eaf	04ba3390-d8a5-4a26-8c80-88e7b589a303	DragonForce Ransomware Strikes MSP in Supply Chain Attack	DragonForce, a ransomware &quot;cartel&quot; that has gained significant popularity since its debut in 2023, attacked an MSP as part of a recent supply chain attack, via known SimpleHelp bugs.	<![CDATA[https://www.darkreading.com/application-security/dragonforce-ransomware-msp-supply-chain-attack]]>	2025-05-27 20:15:31+00	<![CDATA[https://www.darkreading.com/application-security/dragonforce-ransomware-msp-supply-chain-attack]]>	Alexander Culafi, Senior News Writer, Dark Reading	2025-05-28 10:07:35.115869+00
9ffe1f69-2ae6-4813-9b54-0edd35945a80	04ba3390-d8a5-4a26-8c80-88e7b589a303	FBI: Silent Ransom Group Adopts Vishing Campaign Against Law Firms	The non-ransomware extortion group has switched up tactics and victimology in a deliberate and focused campaign similar to those of other attackers focused on stealing sensitive data.	<![CDATA[https://www.darkreading.com/endpoint-security/fbi-silent-ransom-group-vishing-law-firms]]>	2025-05-27 16:58:22+00	<![CDATA[https://www.darkreading.com/endpoint-security/fbi-silent-ransom-group-vishing-law-firms]]>	Elizabeth Montalbano, Contributing Writer	2025-05-28 10:07:35.161313+00
8791a91e-46f6-4a5a-8295-9bea710e94ef	04ba3390-d8a5-4a26-8c80-88e7b589a303	Danabot Takedown Deals Blow to Russian Cybercrime	A multiyear investigation by a public-private partnership has resulted in the seizure of the botnet's US-based infrastructure and indictments for its key players, significantly disrupting a vast cybercriminal enterprise.	<![CDATA[https://www.darkreading.com/threat-intelligence/danabot-takedown-russian-cybercrime]]>	2025-05-27 15:53:00+00	<![CDATA[https://www.darkreading.com/threat-intelligence/danabot-takedown-russian-cybercrime]]>	Elizabeth Montalbano, Contributing Writer	2025-05-28 10:07:35.203587+00
32702ac0-aee2-488e-afa8-248b7de4e0d7	04ba3390-d8a5-4a26-8c80-88e7b589a303	3 Critical Pillars of Cyber-Resilience	Encryption, collaboration, and AI can help organizations build up essential protection against ransomware.	<![CDATA[https://www.darkreading.com/cyber-risk/three-critical-pillars-of-cyber-resilience]]>	2025-05-23 16:33:26+00	<![CDATA[https://www.darkreading.com/cyber-risk/three-critical-pillars-of-cyber-resilience]]>	Tiago Henriques	2025-05-28 10:07:35.280165+00
c76ce427-00e7-46c6-878d-60f5e506053a	04ba3390-d8a5-4a26-8c80-88e7b589a303	How the New Hacker Millionaire Class Was Built	Once dismissed as Internet miscreants in hoodies, ethical hackers have hit the big time, earning millions from blue-chip firms. And they say it's their diverse backgrounds that make them top-tier bug hunters.	<![CDATA[https://www.darkreading.com/remote-workforce/hacker-millionaire-class-built]]>	2025-05-27 16:12:00+00	<![CDATA[https://www.darkreading.com/remote-workforce/hacker-millionaire-class-built]]>	Becky Bracken	2025-05-28 10:07:35.183475+00
7edba40e-054b-458f-ba95-c1122a63d572	04ba3390-d8a5-4a26-8c80-88e7b589a303	CVE Uncertainty Underlines Importance of Cyber Resilience	Organizations need to broaden their strategy to manage vulnerabilities more effectively and strengthen network cyber resilience.	<![CDATA[https://www.darkreading.com/vulnerabilities-threats/cve-uncertainty-underlines-importance-cyber-resilience]]>	2025-05-27 14:00:00+00	<![CDATA[https://www.darkreading.com/vulnerabilities-threats/cve-uncertainty-underlines-importance-cyber-resilience]]>	Amar Ramakrishnan	2025-05-28 10:07:35.251828+00
8441e683-5355-4627-9be5-54289fb3919e	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	Adidas Customer Data Stolen in Third-Party Attack	Adidas revealed that customer contact information, including names, emails and phone numbers were accessed by an unauthorized party	https://www.infosecurity-magazine.com/news/adidas-customer-data-third-party/	2025-05-28 10:00:00+00	https://www.infosecurity-magazine.com/news/adidas-customer-data-third-party/		2025-05-28 10:07:36.367445+00
f5067af6-6fea-40cf-aa68-52b5320f1f18	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	New Russian State Hacking Group Hits Europe and North America	A newly-discovered Russian group, Void Blizzard, has successfully compromised organizations in critical industries, Microsoft warned	https://www.infosecurity-magazine.com/news/russian-state-group-europe-america/	2025-05-28 08:15:00+00	https://www.infosecurity-magazine.com/news/russian-state-group-europe-america/		2025-05-28 10:07:36.40761+00
f08cff61-6281-48f0-b71a-2c103c8b3163	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	Malicious Machine Learning Model Attack Discovered on PyPI	A novel attack exploited machine learning models on PyPI, using zipped Pickle files to deliver infostealer malware	https://www.infosecurity-magazine.com/news/malicious-machine-learning-model/	2025-05-27 13:00:00+00	https://www.infosecurity-magazine.com/news/malicious-machine-learning-model/		2025-05-28 10:07:36.47597+00
9b3b302d-1ddc-490b-a8f2-d1d4712124c4	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	#Infosec2025: Rory Stewart and Paul Chichester to Headline at Infosecurity Europe 2025	Former UK government minister Rory Stewart and NCSC Director of Operations Paul Chichester will explore the growing link between geopolitics and cybersecurity	https://www.infosecurity-magazine.com/news/rory-stewart-paul-chichester/	2025-05-27 12:00:00+00	https://www.infosecurity-magazine.com/news/rory-stewart-paul-chichester/		2025-05-28 10:07:36.500401+00
ec40e3ef-6fea-4d0b-8fac-15eb0fa74680	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	US Government Launches Audit of NIST’s National Vulnerability Database	The audit of the NVD will be conducted by the US Department of Commerce’s Office of Inspector General	https://www.infosecurity-magazine.com/news/us-government-launches-audit-nist/	2025-05-27 11:00:00+00	https://www.infosecurity-magazine.com/news/us-government-launches-audit-nist/		2025-05-28 10:07:36.521538+00
cda29874-0e45-46f5-bc8d-b2be3d7dc733	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	Governments Urge Organizations to Prioritize SIEM/SOAR Adoption	A joint advisory from the US, UK, Australia and others highlights the importance of SIEM/SOAR platforms and overcoming implementation challenges	https://www.infosecurity-magazine.com/news/governments-prioritize-siem-soar/	2025-05-27 10:00:00+00	https://www.infosecurity-magazine.com/news/governments-prioritize-siem-soar/		2025-05-28 10:07:36.54128+00
c4dd143a-f49d-48d9-a786-3c33d1e795c6	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	Chinese Hackers Exploit Cityworks Flaw to Target US Local Governments	Cisco Talos reported that a Chinese group has deployed web shells and malware in local government networks post-exploitation	https://www.infosecurity-magazine.com/news/chinese-hackers-cityworks-local/	2025-05-26 11:00:00+00	https://www.infosecurity-magazine.com/news/chinese-hackers-cityworks-local/		2025-05-28 10:07:36.562676+00
d431fd1c-82d1-4587-931d-242c9143ab15	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	NIST Introduces New Metric to Measure Likelihood of Vulnerability Exploits	The US National Institute of Standards and Technology (NIST) published a white paper introducing a new metric called Likely Exploited Vulnerabilities (LEV)	https://www.infosecurity-magazine.com/news/nist-metric-lev-likelihood/	2025-05-26 09:00:00+00	https://www.infosecurity-magazine.com/news/nist-metric-lev-likelihood/		2025-05-28 10:07:36.58445+00
7b3f8423-3aec-4c3c-99a8-9bbfe60a8051	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Firewall Bug Under Active Attack Triggers CISA Warning	CISA is warning that Palo Alto Networks’ PAN-OS is under active attack and needs to be patched ASAP.	https://threatpost.com/firewall-bug-under-active-attack-cisa-warning/180467/	2022-08-23 13:19:58+00	https://kasperskycontenthub.com/threatpost-global/?p=180467	Threatpost	2025-05-28 10:07:36.620714+00
9f75c26a-3fc5-426e-9624-8b4e8ee7e695	1d78806d-2c90-45a9-ad47-2a61a05e87e3	iPhone Users Urged to Update to Patch 2 Zero-Days	Separate fixes to macOS and iOS patch respective flaws in the kernel and WebKit that can allow threat actors to take over devices and are under attack.	https://threatpost.com/iphone-users-urged-to-update-to-patch-2-zero-days-under-attack/180448/	2022-08-19 15:25:56+00	https://kasperskycontenthub.com/threatpost-global/?p=180448	Elizabeth Montalbano	2025-05-28 10:07:36.674371+00
859b8e79-dab2-4064-b5c0-3c4f4dedfc19	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	Vulnerabilities in CISA KEV Are Not Equally Critical: Report		https://www.securityweek.com/vulnerabilities-in-cisa-kev-are-not-equally-critical-report/	2025-05-28 10:00:00+00	https://www.securityweek.com/?p=42407	Ionut Arghire	2025-05-28 10:07:37.037684+00
b356ac65-2909-48f4-908f-0df74759a938	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	$223 Million Stolen in Cetus Protocol Hack		https://www.securityweek.com/223-million-stolen-in-cetus-protocol-hack/	2025-05-28 09:23:48+00	https://www.securityweek.com/?p=42412	Ionut Arghire	2025-05-28 10:07:37.078434+00
93e174db-d3d0-47f4-af9e-c4c4c65cf80a	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	Iranian Man Pleads Guilty to Role in Baltimore Ransomware Attack		https://www.securityweek.com/iranian-man-pleads-guilty-to-role-in-baltimore-ransomware-attack/	2025-05-27 18:27:02+00	https://www.securityweek.com/?p=42405	SecurityWeek News	2025-05-28 10:07:37.124044+00
6c65e3f9-9d89-4d44-be41-5049e9892c7f	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	Russian Government Hackers Caught Buying Passwords from Cybercriminals		https://www.securityweek.com/russian-government-hackers-caught-buying-passwords-from-cybercriminals/	2025-05-27 14:52:07+00	https://www.securityweek.com/?p=42401	Ryan Naraine	2025-05-28 10:07:37.167236+00
b9bf89b4-944d-46af-a47e-4d851990e00f	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	Dutch Intelligence Agencies Say Russian Hackers Stole Police Data in Cyberattack		https://www.securityweek.com/dutch-intelligence-agencies-say-russian-hackers-stole-police-data-in-cyberattack/	2025-05-27 13:44:36+00	https://www.securityweek.com/?p=42398	Associated Press	2025-05-28 10:07:37.316326+00
6fc1d168-a85f-4d1c-b101-d1e4afad038b	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	Vietnam-Nexus Hackers Distribute Malware Via Fake AI Video Generator Websites	A Vietnam-nexus hacking group distributes infostealers and backdoors via social media ads promoting fake AI generator websites	https://www.infosecurity-magazine.com/news/vietnam-hackers-malware-fake-ai/	2025-05-28 09:00:00+00	https://www.infosecurity-magazine.com/news/vietnam-hackers-malware-fake-ai/		2025-05-28 10:07:36.388253+00
9ace0493-d9ab-4e23-b1c7-70412dbbc1a7	e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	DragonForce Ransomware Leveraged in MSP Attack Using RMM Tool	A targeted cyber-attack on an MSP exploited flaws in remote management tools, resulting in ransomware deployment and data theft	https://www.infosecurity-magazine.com/news/dragonforce-ransomware-msp-attack/	2025-05-27 15:00:00+00	https://www.infosecurity-magazine.com/news/dragonforce-ransomware-msp-attack/		2025-05-28 10:07:36.435603+00
4df8212d-382e-4f76-8baf-92bf76a1d55f	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Student Loan Breach Exposes 2.5M Records	2.5 million people were affected, in a breach that could spell more trouble down the line.	https://threatpost.com/student-loan-breach-exposes-2-5m-records/180492/	2022-08-31 12:57:48+00	https://kasperskycontenthub.com/threatpost-global/?p=180492	Nate Nelson	2025-05-28 10:07:36.486921+00
e1e2800c-fc62-45fa-a4dd-15718cbc6437	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Watering Hole Attacks Push ScanBox Keylogger	Researchers uncover a watering hole attack likely carried out by APT TA423, which attempts to plant the ScanBox JavaScript-based reconnaissance tool.	https://threatpost.com/watering-hole-attacks-push-scanbox-keylogger/180490/	2022-08-30 16:00:43+00	https://kasperskycontenthub.com/threatpost-global/?p=180490	Nate Nelson	2025-05-28 10:07:36.507764+00
743b56c7-6bf9-44f2-800c-4ffcaaa7ecaa	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Tentacles of &#8216;0ktapus&#8217; Threat Group Victimize 130 Firms	Over 130 companies tangled in sprawling phishing campaign that spoofed a multi-factor authentication system.	https://threatpost.com/0ktapus-victimize-130-firms/180487/	2022-08-29 14:56:19+00	https://kasperskycontenthub.com/threatpost-global/?p=180487	Nate Nelson	2025-05-28 10:07:36.531386+00
0fc8b5f9-97d5-4e5a-8409-42d0ff24bf28	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Ransomware Attacks are on the Rise	Lockbit is by far this summer’s most prolific ransomware group, trailed by two offshoots of the Conti group.	https://threatpost.com/ransomware-attacks-are-on-the-rise/180481/	2022-08-26 16:44:27+00	https://kasperskycontenthub.com/threatpost-global/?p=180481	Nate Nelson	2025-05-28 10:07:36.555524+00
29f8f395-2039-4c84-b72b-83aea4fbe05e	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Cybercriminals Are Selling Access to Chinese Surveillance Cameras	Tens of thousands of cameras have failed to patch a critical, 11-month-old CVE, leaving thousands of organizations exposed.	https://threatpost.com/cybercriminals-are-selling-access-to-chinese-surveillance-cameras/180478/	2022-08-25 18:47:15+00	https://kasperskycontenthub.com/threatpost-global/?p=180478	Nate Nelson	2025-05-28 10:07:36.579306+00
2d7b81b8-6825-4e45-8e08-d13d61172af7	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Twitter Whistleblower Complaint: The TL;DR Version	Twitter is blasted for security and privacy lapses by the company’s former head of security who alleges the social media giant’s actions amount to a national security risk.	https://threatpost.com/twitter-whistleblower-tldr-version/180472/	2022-08-24 14:17:04+00	https://kasperskycontenthub.com/threatpost-global/?p=180472	Threatpost	2025-05-28 10:07:36.599976+00
a4511b1d-cc43-4723-8b05-afe5fdf5397c	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Fake Reservation Links Prey on Weary Travelers	Fake travel reservations are exacting more pain from the travel weary, already dealing with the misery of canceled flights and overbooked hotels.	https://threatpost.com/reservation-links-prey-on-travelers/180462/	2022-08-22 13:59:06+00	https://kasperskycontenthub.com/threatpost-global/?p=180462	Nate Nelson	2025-05-28 10:07:36.642683+00
dfaceeb6-11ee-4635-b4da-8e1cd3a35142	1d78806d-2c90-45a9-ad47-2a61a05e87e3	Google Patches Chrome&#8217;s Fifth Zero-Day of the Year	An insufficient validation input flaw, one of 11 patched in an update this week, could allow for arbitrary code execution and is under active attack.	https://threatpost.com/google-patches-chromes-fifth-zero-day-of-the-year/180432/	2022-08-18 14:31:38+00	https://kasperskycontenthub.com/threatpost-global/?p=180432	Elizabeth Montalbano	2025-05-28 10:07:36.693512+00
fa62e444-9067-4b1a-be72-e8b059067b7f	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	The Root of AI Hallucinations: Physics Theory Digs Into the &#8216;Attention&#8217; Flaw		https://www.securityweek.com/the-root-of-ai-hallucinations-physics-theory-digs-into-the-attention-flaw/	2025-05-28 09:51:29+00	https://www.securityweek.com/?p=42413	Kevin Townsend	2025-05-28 10:07:37.058484+00
1d3caa85-22bc-4b5b-ac7f-fdef2df725a7	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	Zscaler to Acquire MDR Specialist Red Canary		https://www.securityweek.com/zscaler-to-acquire-mdr-specialist-red-canary/	2025-05-27 21:31:16+00	https://www.securityweek.com/?p=42410	SecurityWeek News	2025-05-28 10:07:37.100454+00
feb907e5-a5ac-4b0c-b6be-2e70711affe8	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	DragonForce Ransomware Hackers Exploiting SimpleHelp Vulnerabilities		https://www.securityweek.com/dragonforce-ransomware-hackers-exploiting-simplehelp-vulnerabilities/	2025-05-27 15:06:45+00	https://www.securityweek.com/?p=42404	Ionut Arghire	2025-05-28 10:07:37.146925+00
89b2a8b3-ecd4-4cfb-8097-207e545c7781	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	Ongoing Campaign Uses 60 NPM Packages to Steal Data		https://www.securityweek.com/ongoing-campaign-uses-60-npm-packages-to-steal-data/	2025-05-27 14:12:14+00	https://www.securityweek.com/?p=42399	Ionut Arghire	2025-05-28 10:07:37.295801+00
ae5b71c1-a26c-4f49-bd80-d1e923e759fd	7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	Inside the $111 Billion Cloud Security Market: Acquisition, Expansion, and Where to Aim Next		https://www.securityweek.com/inside-the-111-billion-cloud-security-market-acquisition-expansion-and-where-to-aim-next/	2025-05-27 12:57:18+00	https://www.securityweek.com/?p=42397	Kevin Townsend	2025-05-28 10:07:37.346506+00
\.


--
-- TOC entry 4073 (class 0 OID 17480)
-- Dependencies: 273
-- Data for Name: rss_feeds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rss_feeds (id, name, url, category, description, is_default, created_at) FROM stdin;
9a804079-c854-4cf5-aa20-9068714f9b64	KrebsOnSecurity	https://krebsonsecurity.com/feed/	Security News	In-depth security news and investigation	t	2025-05-28 09:52:43.168252+00
8e59e816-a809-4a26-a41f-7707e923932f	The Hacker News	https://feeds.feedburner.com/TheHackersNews	Security News	Latest cybersecurity news and threats	t	2025-05-28 09:52:43.168252+00
e8c673a4-f772-4226-b19d-5eebe469378c	CVE Details	https://www.cvedetails.com/rss.php	CVE	Latest Common Vulnerabilities and Exposures	t	2025-05-28 09:52:43.168252+00
25ac0693-284f-4de6-83b1-b906498ff48a	Bug Bounty POC	https://medium.com/feed/bugbountywriteup	Bug Bounty	Bug bounty writeups and methodologies	t	2025-05-28 09:52:43.168252+00
5bee577a-f14d-47ea-bd7f-d19ff97e5e3b	PortSwigger Research	https://portswigger.net/research/rss	Research	Latest web security research from PortSwigger	t	2025-05-28 09:52:43.168252+00
04ba3390-d8a5-4a26-8c80-88e7b589a303	Dark Reading	https://www.darkreading.com/rss.xml	Security News	Enterprise security news and analysis	t	2025-05-28 09:59:03.725178+00
e4dcfe59-16a0-40ef-8c40-fb9e38bba4cd	InfoSec Magazine	https://www.infosecurity-magazine.com/rss/news/	Security News	Information security news and insights	t	2025-05-28 09:59:03.725178+00
7e63f1b5-8d04-4eef-8b93-aa3354bb40ed	SecurityWeek	https://feeds.feedburner.com/securityweek	Security News	Cybersecurity news for information security professionals	t	2025-05-28 09:59:03.725178+00
1d78806d-2c90-45a9-ad47-2a61a05e87e3	Threatpost	https://threatpost.com/feed/	Security News	Independent news site dedicated to information security	t	2025-05-28 09:59:03.725178+00
93a06c90-a259-4841-8d71-d1db1c7081c9	SC Magazine	https://www.scmagazine.com/rss.xml	Security News	Cybersecurity news and analysis	t	2025-05-28 09:59:03.725178+00
67d36495-ad8e-4063-80dd-3fa536039654	Cyber Security Hub	https://www.cshub.com/rss/categories/attacks	Security News	Cybersecurity attacks and threats news	t	2025-05-28 09:59:03.725178+00
098a6e85-866f-450a-be9f-fe7c82615671	NIST NVD	https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml	CVE	National Vulnerability Database RSS feed	t	2025-05-28 09:59:03.725178+00
0d64273c-0982-4d9c-b9fa-8b1065dde213	MITRE CVE	https://cve.mitre.org/data/downloads/allitems-cvrf.xml	CVE	MITRE CVE database updates	t	2025-05-28 09:59:03.725178+00
65c63865-fc11-43f9-8ee8-ff95d9be659b	Zero Day Initiative	https://www.zerodayinitiative.com/rss/upcoming/	CVE	Zero Day Initiative vulnerability disclosures	t	2025-05-28 09:59:03.725178+00
300069c4-eb39-4e0e-9e0a-9614750c3385	Vulnerability Lab	https://www.vulnerability-lab.com/rss.php	CVE	Vulnerability research and disclosure	t	2025-05-28 09:59:03.725178+00
b093a334-fa90-4192-8309-7b3afaa12c73	HackerOne Hacktivity	https://hackerone.com/hacktivity.rss	Bug Bounty	Latest disclosed bug bounty reports	t	2025-05-28 09:59:03.725178+00
bc17ce9e-028b-43f3-9f99-516968db06b8	Bugcrowd Blog	https://www.bugcrowd.com/feed/	Bug Bounty	Bug bounty insights and research	t	2025-05-28 09:59:03.725178+00
5275deb5-1569-489e-9cde-b4905b95cc63	Intigriti Blog	https://blog.intigriti.com/feed/	Bug Bounty	Bug bounty tips and writeups	t	2025-05-28 09:59:03.725178+00
625fd8bf-3252-4084-bd36-47809fc8af9b	Bug Bounty Notes	https://www.bugbountynotes.com/rss/	Bug Bounty	Bug bounty methodologies and notes	t	2025-05-28 09:59:03.725178+00
2f732e9d-38f2-4d35-86c8-c0b36b097753	Google Project Zero	https://googleprojectzero.blogspot.com/feeds/posts/default	Research	Google Project Zero vulnerability research	t	2025-05-28 09:59:03.725178+00
2d464038-fb94-4561-aeda-024bbba5de6f	Microsoft Security Response Center	https://msrc-blog.microsoft.com/feed/	Research	Microsoft security updates and research	t	2025-05-28 09:59:03.725178+00
73a84c5f-65d6-4817-ab0e-fe8b1222a453	Cisco Talos	https://blog.talosintelligence.com/feeds/posts/default	Research	Cisco Talos threat intelligence	t	2025-05-28 09:59:03.725178+00
03f15369-7b5c-4464-aa0b-77cffa81e51f	FireEye Threat Research	https://www.fireeye.com/blog/threat-research/_jcr_content.feed	Research	FireEye threat research and analysis	t	2025-05-28 09:59:03.725178+00
82e49365-b131-4dc3-9328-89a35394d83d	CrowdStrike Blog	https://www.crowdstrike.com/blog/feed/	Research	CrowdStrike threat intelligence	t	2025-05-28 09:59:03.725178+00
e1b4ca06-5822-4f45-92d6-9cfc33f413b7	OWASP Blog	https://owasp.org/blog/feed.xml	Tools	OWASP security tools and methodologies	t	2025-05-28 09:59:03.725178+00
621e741f-ceca-4cbf-b1f2-f8bdae14fbaa	Rapid7 Blog	https://blog.rapid7.com/rss/	Tools	Rapid7 security tools and research	t	2025-05-28 09:59:03.725178+00
9d6eba84-ce31-445c-b6cc-36cdd66b624d	Nessus Blog	https://www.tenable.com/blog/feed	Tools	Tenable Nessus vulnerability scanning insights	t	2025-05-28 09:59:03.725178+00
8196e066-d016-4a2c-aec0-818da17e47e5	Metasploit Blog	https://blog.rapid7.com/tag/metasploit/rss/	Tools	Metasploit framework updates and techniques	t	2025-05-28 09:59:03.725178+00
0690e72b-bcd7-4025-995e-cc72d39a3c07	Malwarebytes Labs	https://blog.malwarebytes.com/feed/	Malware	Malware analysis and threat research	t	2025-05-28 09:59:03.725178+00
9124fdfa-6326-4cea-a044-3477b7a0cc61	Kaspersky Securelist	https://securelist.com/feed/	Malware	Kaspersky malware research and analysis	t	2025-05-28 09:59:03.725178+00
32cc24a8-a00f-418a-a7db-458d051360e8	Symantec Security Response	https://www.symantec.com/connect/item-feeds/blog/2261/feed/all/en/all	Malware	Symantec threat intelligence	t	2025-05-28 09:59:03.725178+00
56fb85b1-ee2e-4c68-8a5f-430acabcb608	SANS Internet Storm Center	https://isc.sans.edu/rssfeed.xml	Incident Response	SANS Internet Storm Center daily network security podcast	t	2025-05-28 09:59:03.725178+00
77998c3c-efaa-4102-a722-4771f646eddd	US-CERT Alerts	https://www.us-cert.gov/ncas/alerts.xml	Incident Response	US-CERT security alerts	t	2025-05-28 09:59:03.725178+00
c4aaba9b-da53-4280-9a95-e06b54168e94	CISA Advisories	https://www.cisa.gov/uscert/ncas/alerts.xml	Incident Response	CISA cybersecurity advisories	t	2025-05-28 09:59:03.725178+00
d12cafcf-44c9-4ac9-b11f-9209bab89f13	Offensive Security Blog	https://www.offensive-security.com/feed/	Penetration Testing	Offensive Security insights and updates	t	2025-05-28 09:59:03.725178+00
058ed804-00e0-4e71-adc0-8eb33e920f44	PentestLab Blog	https://pentestlab.blog/feed/	Penetration Testing	Penetration testing techniques and methodologies	t	2025-05-28 09:59:03.725178+00
27119eb5-7014-4b7d-90f8-b860cf0354fb	NetSPI Blog	https://blog.netspi.com/feed/	Penetration Testing	NetSPI penetration testing insights	t	2025-05-28 09:59:03.725178+00
c39b5124-4745-4d22-97a5-e8b12efd1a1f	Privacy International	https://privacyinternational.org/rss.xml	Privacy	Privacy rights and digital surveillance news	t	2025-05-28 09:59:03.725178+00
0ca72c1a-a957-4ed3-ab0a-d60aae5e1ab6	Electronic Frontier Foundation	https://www.eff.org/rss/updates.xml	Privacy	EFF digital rights and privacy news	t	2025-05-28 09:59:03.725178+00
213336e0-fa4f-4628-bc37-80bb762c2ee4	CSO Online	https://www.csoonline.com/index.rss	Industry News	Chief Security Officer insights and news	t	2025-05-28 09:59:03.725178+00
1628a413-85d0-4362-aa46-257a1bf682f6	Help Net Security	https://www.helpnetsecurity.com/feed/	Industry News	Information security news and resources	t	2025-05-28 09:59:03.725178+00
ad3d8524-ae47-4800-8a75-9bf4b388bbe7	Security Boulevard	https://securityboulevard.com/feed/	Industry News	DevSecOps and application security news	t	2025-05-28 09:59:03.725178+00
\.


--
-- TOC entry 4065 (class 0 OID 17347)
-- Dependencies: 265
-- Data for Name: security_checklists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.security_checklists (id, user_id, name, checklist_type, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4067 (class 0 OID 17373)
-- Dependencies: 267
-- Data for Name: security_tips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.security_tips (id, user_id, title, content, category, tags, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4071 (class 0 OID 17436)
-- Dependencies: 271
-- Data for Name: useful_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.useful_links (id, user_id, title, url, description, category, created_at, updated_at) FROM stdin;
5e54df73-c39b-427f-b246-fb85178a0810	d01d56c1-141c-4153-b368-8e8b6e204ca5	dsd	sdsd	sdsd	Hacking	2025-05-28 09:46:43.84449+00	2025-05-28 09:46:43.84449+00
\.


--
-- TOC entry 4062 (class 0 OID 17294)
-- Dependencies: 262
-- Data for Name: user_platform_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_platform_profiles (id, user_id, platform_id, username, profile_url, reputation_points, rank_position, total_bounties_earned, bugs_submitted, bugs_accepted, created_at, updated_at) FROM stdin;
5c3ccd74-5e65-46e5-9b09-46868920791c	d01d56c1-141c-4153-b368-8e8b6e204ca5	c371c852-f8a4-449d-85f8-b6309e20044a	secfathy		333		0.00	0	0	2025-05-28 09:11:59.256492+00	2025-05-28 09:11:59.256492+00
\.


--
-- TOC entry 4075 (class 0 OID 17506)
-- Dependencies: 275
-- Data for Name: user_rss_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_rss_subscriptions (id, user_id, feed_id, subscribed_at) FROM stdin;
\.


--
-- TOC entry 4056 (class 0 OID 16976)
-- Dependencies: 252
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-05-28 08:46:56
20211116045059	2025-05-28 08:46:58
20211116050929	2025-05-28 08:47:00
20211116051442	2025-05-28 08:47:02
20211116212300	2025-05-28 08:47:04
20211116213355	2025-05-28 08:47:05
20211116213934	2025-05-28 08:47:07
20211116214523	2025-05-28 08:47:09
20211122062447	2025-05-28 08:47:11
20211124070109	2025-05-28 08:47:12
20211202204204	2025-05-28 08:47:14
20211202204605	2025-05-28 08:47:15
20211210212804	2025-05-28 08:47:20
20211228014915	2025-05-28 08:47:22
20220107221237	2025-05-28 08:47:24
20220228202821	2025-05-28 08:47:25
20220312004840	2025-05-28 08:47:27
20220603231003	2025-05-28 08:47:29
20220603232444	2025-05-28 08:47:31
20220615214548	2025-05-28 08:47:33
20220712093339	2025-05-28 08:47:34
20220908172859	2025-05-28 08:47:36
20220916233421	2025-05-28 08:47:37
20230119133233	2025-05-28 08:47:39
20230128025114	2025-05-28 08:47:41
20230128025212	2025-05-28 08:47:43
20230227211149	2025-05-28 08:47:44
20230228184745	2025-05-28 08:47:46
20230308225145	2025-05-28 08:47:48
20230328144023	2025-05-28 08:47:49
20231018144023	2025-05-28 08:47:51
20231204144023	2025-05-28 08:47:54
20231204144024	2025-05-28 08:47:55
20231204144025	2025-05-28 08:47:57
20240108234812	2025-05-28 08:47:58
20240109165339	2025-05-28 08:48:00
20240227174441	2025-05-28 08:48:03
20240311171622	2025-05-28 08:48:05
20240321100241	2025-05-28 08:48:08
20240401105812	2025-05-28 08:48:13
20240418121054	2025-05-28 08:48:15
20240523004032	2025-05-28 08:48:21
20240618124746	2025-05-28 08:48:22
20240801235015	2025-05-28 08:48:24
20240805133720	2025-05-28 08:48:26
20240827160934	2025-05-28 08:48:27
20240919163303	2025-05-28 08:48:29
20240919163305	2025-05-28 08:48:31
20241019105805	2025-05-28 08:48:32
20241030150047	2025-05-28 08:48:38
20241108114728	2025-05-28 08:48:41
20241121104152	2025-05-28 08:48:42
20241130184212	2025-05-28 08:48:44
20241220035512	2025-05-28 08:48:46
20241220123912	2025-05-28 08:48:47
20241224161212	2025-05-28 08:48:49
20250107150512	2025-05-28 08:48:50
20250110162412	2025-05-28 08:48:52
20250123174212	2025-05-28 08:48:54
20250128220012	2025-05-28 08:48:55
20250506224012	2025-05-28 08:48:56
20250523164012	2025-05-28 10:29:56
\.


--
-- TOC entry 4060 (class 0 OID 17083)
-- Dependencies: 257
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- TOC entry 4042 (class 0 OID 16533)
-- Dependencies: 235
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- TOC entry 4044 (class 0 OID 16575)
-- Dependencies: 237
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-05-28 08:46:55.178717
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-05-28 08:46:55.18324
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-05-28 08:46:55.186066
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-05-28 08:46:55.198374
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-05-28 08:46:55.221011
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-05-28 08:46:55.22461
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-05-28 08:46:55.228467
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-05-28 08:46:55.232258
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-05-28 08:46:55.235984
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-05-28 08:46:55.23961
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-05-28 08:46:55.243639
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-05-28 08:46:55.248298
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-05-28 08:46:55.254307
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-05-28 08:46:55.25827
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-05-28 08:46:55.262378
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-05-28 08:46:55.287765
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-05-28 08:46:55.29142
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-05-28 08:46:55.294884
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-05-28 08:46:55.298757
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-05-28 08:46:55.303276
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-05-28 08:46:55.307216
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-05-28 08:46:55.316969
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-05-28 08:46:55.34305
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-05-28 08:46:55.368138
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-05-28 08:46:55.371477
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-05-28 08:46:55.375119
\.


--
-- TOC entry 4043 (class 0 OID 16548)
-- Dependencies: 236
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- TOC entry 4057 (class 0 OID 17014)
-- Dependencies: 253
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- TOC entry 4058 (class 0 OID 17028)
-- Dependencies: 254
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- TOC entry 3550 (class 0 OID 16643)
-- Dependencies: 238
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 230
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 7, true);


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 256
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- TOC entry 3719 (class 2606 OID 16801)
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- TOC entry 3677 (class 2606 OID 16518)
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3741 (class 2606 OID 16907)
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- TOC entry 3698 (class 2606 OID 16925)
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 16935)
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- TOC entry 3675 (class 2606 OID 16511)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 3721 (class 2606 OID 16794)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- TOC entry 3717 (class 2606 OID 16782)
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 3709 (class 2606 OID 16975)
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- TOC entry 3711 (class 2606 OID 16769)
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- TOC entry 3745 (class 2606 OID 16960)
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3669 (class 2606 OID 16501)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3672 (class 2606 OID 16711)
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3730 (class 2606 OID 16841)
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- TOC entry 3732 (class 2606 OID 16839)
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3737 (class 2606 OID 16855)
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3680 (class 2606 OID 16524)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3704 (class 2606 OID 16732)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3727 (class 2606 OID 16822)
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 3723 (class 2606 OID 16813)
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3662 (class 2606 OID 16895)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 3664 (class 2606 OID 16488)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3771 (class 2606 OID 17341)
-- Name: bugs bugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bugs
    ADD CONSTRAINT bugs_pkey PRIMARY KEY (id);


--
-- TOC entry 3775 (class 2606 OID 17367)
-- Name: checklist_items checklist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checklist_items
    ADD CONSTRAINT checklist_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3783 (class 2606 OID 17430)
-- Name: link_categories link_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_categories
    ADD CONSTRAINT link_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 17416)
-- Name: personal_notes personal_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_notes
    ADD CONSTRAINT personal_notes_pkey PRIMARY KEY (id);


--
-- TOC entry 3763 (class 2606 OID 17293)
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);


--
-- TOC entry 3787 (class 2606 OID 17471)
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 3769 (class 2606 OID 17325)
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- TOC entry 3779 (class 2606 OID 17394)
-- Name: reading_list reading_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reading_list
    ADD CONSTRAINT reading_list_pkey PRIMARY KEY (id);


--
-- TOC entry 3791 (class 2606 OID 17500)
-- Name: rss_articles rss_articles_feed_id_guid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rss_articles
    ADD CONSTRAINT rss_articles_feed_id_guid_key UNIQUE (feed_id, guid);


--
-- TOC entry 3793 (class 2606 OID 17498)
-- Name: rss_articles rss_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rss_articles
    ADD CONSTRAINT rss_articles_pkey PRIMARY KEY (id);


--
-- TOC entry 3789 (class 2606 OID 17489)
-- Name: rss_feeds rss_feeds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rss_feeds
    ADD CONSTRAINT rss_feeds_pkey PRIMARY KEY (id);


--
-- TOC entry 3773 (class 2606 OID 17356)
-- Name: security_checklists security_checklists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.security_checklists
    ADD CONSTRAINT security_checklists_pkey PRIMARY KEY (id);


--
-- TOC entry 3777 (class 2606 OID 17382)
-- Name: security_tips security_tips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.security_tips
    ADD CONSTRAINT security_tips_pkey PRIMARY KEY (id);


--
-- TOC entry 3785 (class 2606 OID 17445)
-- Name: useful_links useful_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useful_links
    ADD CONSTRAINT useful_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3765 (class 2606 OID 17307)
-- Name: user_platform_profiles user_platform_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_platform_profiles
    ADD CONSTRAINT user_platform_profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 3767 (class 2606 OID 17309)
-- Name: user_platform_profiles user_platform_profiles_user_id_platform_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_platform_profiles
    ADD CONSTRAINT user_platform_profiles_user_id_platform_id_key UNIQUE (user_id, platform_id);


--
-- TOC entry 3795 (class 2606 OID 17512)
-- Name: user_rss_subscriptions user_rss_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_rss_subscriptions
    ADD CONSTRAINT user_rss_subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 3797 (class 2606 OID 17514)
-- Name: user_rss_subscriptions user_rss_subscriptions_user_id_feed_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_rss_subscriptions
    ADD CONSTRAINT user_rss_subscriptions_user_id_feed_id_key UNIQUE (user_id, feed_id);


--
-- TOC entry 3761 (class 2606 OID 17241)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3758 (class 2606 OID 17091)
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- TOC entry 3750 (class 2606 OID 16980)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3683 (class 2606 OID 16541)
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- TOC entry 3690 (class 2606 OID 16582)
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- TOC entry 3692 (class 2606 OID 16580)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3688 (class 2606 OID 16558)
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- TOC entry 3755 (class 2606 OID 17037)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- TOC entry 3753 (class 2606 OID 17022)
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 3678 (class 1259 OID 16519)
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- TOC entry 3652 (class 1259 OID 16721)
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3653 (class 1259 OID 16723)
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3654 (class 1259 OID 16724)
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3707 (class 1259 OID 16803)
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- TOC entry 3739 (class 1259 OID 16911)
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- TOC entry 3696 (class 1259 OID 16891)
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 3696
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- TOC entry 3701 (class 1259 OID 16718)
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- TOC entry 3742 (class 1259 OID 16908)
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- TOC entry 3743 (class 1259 OID 16909)
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- TOC entry 3715 (class 1259 OID 16914)
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- TOC entry 3712 (class 1259 OID 16775)
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- TOC entry 3713 (class 1259 OID 16920)
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- TOC entry 3746 (class 1259 OID 16967)
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- TOC entry 3747 (class 1259 OID 16966)
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- TOC entry 3748 (class 1259 OID 16968)
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- TOC entry 3655 (class 1259 OID 16725)
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3656 (class 1259 OID 16722)
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3665 (class 1259 OID 16502)
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- TOC entry 3666 (class 1259 OID 16503)
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- TOC entry 3667 (class 1259 OID 16717)
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- TOC entry 3670 (class 1259 OID 16805)
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- TOC entry 3673 (class 1259 OID 16910)
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- TOC entry 3733 (class 1259 OID 16847)
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- TOC entry 3734 (class 1259 OID 16912)
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- TOC entry 3735 (class 1259 OID 16862)
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- TOC entry 3738 (class 1259 OID 16861)
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- TOC entry 3702 (class 1259 OID 16913)
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- TOC entry 3705 (class 1259 OID 16804)
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- TOC entry 3725 (class 1259 OID 16829)
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- TOC entry 3728 (class 1259 OID 16828)
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- TOC entry 3724 (class 1259 OID 16814)
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- TOC entry 3714 (class 1259 OID 16973)
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- TOC entry 3706 (class 1259 OID 16802)
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- TOC entry 3657 (class 1259 OID 16882)
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 3657
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- TOC entry 3658 (class 1259 OID 16719)
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- TOC entry 3659 (class 1259 OID 16492)
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- TOC entry 3660 (class 1259 OID 16937)
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- TOC entry 3756 (class 1259 OID 17242)
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- TOC entry 3759 (class 1259 OID 17140)
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- TOC entry 3681 (class 1259 OID 16547)
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- TOC entry 3684 (class 1259 OID 16569)
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- TOC entry 3751 (class 1259 OID 17048)
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- TOC entry 3685 (class 1259 OID 17013)
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- TOC entry 3686 (class 1259 OID 16570)
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- TOC entry 3824 (class 2620 OID 17528)
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- TOC entry 3826 (class 2620 OID 17096)
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- TOC entry 3825 (class 2620 OID 17001)
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- TOC entry 3800 (class 2606 OID 16705)
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3804 (class 2606 OID 16795)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 3803 (class 2606 OID 16783)
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- TOC entry 3802 (class 2606 OID 16770)
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3809 (class 2606 OID 16961)
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3798 (class 2606 OID 16738)
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 3806 (class 2606 OID 16842)
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3807 (class 2606 OID 16915)
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- TOC entry 3808 (class 2606 OID 16856)
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3801 (class 2606 OID 16733)
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3805 (class 2606 OID 16823)
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3815 (class 2606 OID 17342)
-- Name: bugs bugs_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bugs
    ADD CONSTRAINT bugs_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.programs(id) ON DELETE CASCADE;


--
-- TOC entry 3816 (class 2606 OID 17368)
-- Name: checklist_items checklist_items_checklist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.checklist_items
    ADD CONSTRAINT checklist_items_checklist_id_fkey FOREIGN KEY (checklist_id) REFERENCES public.security_checklists(id) ON DELETE CASCADE;


--
-- TOC entry 3818 (class 2606 OID 17431)
-- Name: link_categories link_categories_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_categories
    ADD CONSTRAINT link_categories_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- TOC entry 3817 (class 2606 OID 17417)
-- Name: personal_notes personal_notes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_notes
    ADD CONSTRAINT personal_notes_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- TOC entry 3820 (class 2606 OID 17472)
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3814 (class 2606 OID 17326)
-- Name: programs programs_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(id) ON DELETE CASCADE;


--
-- TOC entry 3821 (class 2606 OID 17501)
-- Name: rss_articles rss_articles_feed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rss_articles
    ADD CONSTRAINT rss_articles_feed_id_fkey FOREIGN KEY (feed_id) REFERENCES public.rss_feeds(id) ON DELETE CASCADE;


--
-- TOC entry 3819 (class 2606 OID 17446)
-- Name: useful_links useful_links_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.useful_links
    ADD CONSTRAINT useful_links_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- TOC entry 3813 (class 2606 OID 17310)
-- Name: user_platform_profiles user_platform_profiles_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_platform_profiles
    ADD CONSTRAINT user_platform_profiles_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(id) ON DELETE CASCADE;


--
-- TOC entry 3822 (class 2606 OID 17520)
-- Name: user_rss_subscriptions user_rss_subscriptions_feed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_rss_subscriptions
    ADD CONSTRAINT user_rss_subscriptions_feed_id_fkey FOREIGN KEY (feed_id) REFERENCES public.rss_feeds(id) ON DELETE CASCADE;


--
-- TOC entry 3823 (class 2606 OID 17515)
-- Name: user_rss_subscriptions user_rss_subscriptions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_rss_subscriptions
    ADD CONSTRAINT user_rss_subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3799 (class 2606 OID 16559)
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3810 (class 2606 OID 17023)
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3811 (class 2606 OID 17043)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3812 (class 2606 OID 17038)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- TOC entry 3975 (class 0 OID 16512)
-- Dependencies: 233
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3989 (class 0 OID 16901)
-- Dependencies: 250
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3980 (class 0 OID 16698)
-- Dependencies: 241
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3974 (class 0 OID 16505)
-- Dependencies: 232
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3984 (class 0 OID 16788)
-- Dependencies: 245
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3983 (class 0 OID 16776)
-- Dependencies: 244
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3982 (class 0 OID 16763)
-- Dependencies: 243
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3990 (class 0 OID 16951)
-- Dependencies: 251
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3973 (class 0 OID 16494)
-- Dependencies: 231
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3987 (class 0 OID 16830)
-- Dependencies: 248
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3988 (class 0 OID 16848)
-- Dependencies: 249
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3976 (class 0 OID 16520)
-- Dependencies: 234
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3981 (class 0 OID 16728)
-- Dependencies: 242
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3986 (class 0 OID 16815)
-- Dependencies: 247
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3985 (class 0 OID 16806)
-- Dependencies: 246
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3972 (class 0 OID 16482)
-- Dependencies: 229
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4007 (class 3256 OID 17395)
-- Name: platforms Anyone can view platforms; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can view platforms" ON public.platforms FOR SELECT USING (true);


--
-- TOC entry 4009 (class 3256 OID 17397)
-- Name: programs Anyone can view programs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can view programs" ON public.programs FOR SELECT USING (true);


--
-- TOC entry 4015 (class 3256 OID 17404)
-- Name: programs Authenticated users can create programs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can create programs" ON public.programs FOR INSERT TO authenticated WITH CHECK (true);


--
-- TOC entry 4017 (class 3256 OID 17406)
-- Name: programs Authenticated users can delete programs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can delete programs" ON public.programs FOR DELETE TO authenticated USING (true);


--
-- TOC entry 4016 (class 3256 OID 17405)
-- Name: programs Authenticated users can update programs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can update programs" ON public.programs FOR UPDATE TO authenticated USING (true);


--
-- TOC entry 4023 (class 3256 OID 17456)
-- Name: link_categories Users can create their own categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create their own categories" ON public.link_categories FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- TOC entry 4027 (class 3256 OID 17460)
-- Name: useful_links Users can create their own links; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create their own links" ON public.useful_links FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- TOC entry 4019 (class 3256 OID 17452)
-- Name: personal_notes Users can create their own notes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create their own notes" ON public.personal_notes FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- TOC entry 4025 (class 3256 OID 17458)
-- Name: link_categories Users can delete their own categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own categories" ON public.link_categories FOR DELETE USING ((auth.uid() = user_id));


--
-- TOC entry 4029 (class 3256 OID 17462)
-- Name: useful_links Users can delete their own links; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own links" ON public.useful_links FOR DELETE USING ((auth.uid() = user_id));


--
-- TOC entry 4021 (class 3256 OID 17454)
-- Name: personal_notes Users can delete their own notes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete their own notes" ON public.personal_notes FOR DELETE USING ((auth.uid() = user_id));


--
-- TOC entry 4032 (class 3256 OID 17479)
-- Name: profiles Users can insert their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own profile" ON public.profiles FOR INSERT WITH CHECK ((auth.uid() = id));


--
-- TOC entry 4010 (class 3256 OID 17398)
-- Name: bugs Users can manage their own bugs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own bugs" ON public.bugs USING (((auth.uid())::text = (user_id)::text));


--
-- TOC entry 4012 (class 3256 OID 17400)
-- Name: checklist_items Users can manage their own checklist items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own checklist items" ON public.checklist_items USING ((EXISTS ( SELECT 1
   FROM public.security_checklists
  WHERE ((security_checklists.id = checklist_items.checklist_id) AND ((auth.uid())::text = (security_checklists.user_id)::text)))));


--
-- TOC entry 4011 (class 3256 OID 17399)
-- Name: security_checklists Users can manage their own checklists; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own checklists" ON public.security_checklists USING (((auth.uid())::text = (user_id)::text));


--
-- TOC entry 4008 (class 3256 OID 17396)
-- Name: user_platform_profiles Users can manage their own platform profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own platform profiles" ON public.user_platform_profiles USING (((auth.uid())::text = (user_id)::text));


--
-- TOC entry 4014 (class 3256 OID 17402)
-- Name: reading_list Users can manage their own reading list; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own reading list" ON public.reading_list USING (((auth.uid())::text = (user_id)::text));


--
-- TOC entry 4034 (class 3256 OID 17526)
-- Name: user_rss_subscriptions Users can manage their own subscriptions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own subscriptions" ON public.user_rss_subscriptions USING ((auth.uid() = user_id));


--
-- TOC entry 4013 (class 3256 OID 17401)
-- Name: security_tips Users can manage their own tips; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own tips" ON public.security_tips USING (((auth.uid())::text = (user_id)::text));


--
-- TOC entry 4024 (class 3256 OID 17457)
-- Name: link_categories Users can update their own categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own categories" ON public.link_categories FOR UPDATE USING ((auth.uid() = user_id));


--
-- TOC entry 4028 (class 3256 OID 17461)
-- Name: useful_links Users can update their own links; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own links" ON public.useful_links FOR UPDATE USING ((auth.uid() = user_id));


--
-- TOC entry 4020 (class 3256 OID 17453)
-- Name: personal_notes Users can update their own notes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own notes" ON public.personal_notes FOR UPDATE USING ((auth.uid() = user_id));


--
-- TOC entry 4031 (class 3256 OID 17478)
-- Name: profiles Users can update their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own profile" ON public.profiles FOR UPDATE USING ((auth.uid() = id));


--
-- TOC entry 4022 (class 3256 OID 17455)
-- Name: link_categories Users can view their own categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own categories" ON public.link_categories FOR SELECT USING ((auth.uid() = user_id));


--
-- TOC entry 4026 (class 3256 OID 17459)
-- Name: useful_links Users can view their own links; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own links" ON public.useful_links FOR SELECT USING ((auth.uid() = user_id));


--
-- TOC entry 4018 (class 3256 OID 17451)
-- Name: personal_notes Users can view their own notes; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own notes" ON public.personal_notes FOR SELECT USING ((auth.uid() = user_id));


--
-- TOC entry 4030 (class 3256 OID 17477)
-- Name: profiles Users can view their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own profile" ON public.profiles FOR SELECT USING ((auth.uid() = id));


--
-- TOC entry 4033 (class 3256 OID 17525)
-- Name: user_rss_subscriptions Users can view their own subscriptions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own subscriptions" ON public.user_rss_subscriptions FOR SELECT USING ((auth.uid() = user_id));


--
-- TOC entry 3997 (class 0 OID 17331)
-- Dependencies: 264
-- Name: bugs; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.bugs ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3999 (class 0 OID 17357)
-- Dependencies: 266
-- Name: checklist_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.checklist_items ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4003 (class 0 OID 17422)
-- Dependencies: 270
-- Name: link_categories; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.link_categories ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4002 (class 0 OID 17407)
-- Dependencies: 269
-- Name: personal_notes; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.personal_notes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3994 (class 0 OID 17283)
-- Dependencies: 261
-- Name: platforms; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.platforms ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4005 (class 0 OID 17463)
-- Dependencies: 272
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3996 (class 0 OID 17315)
-- Dependencies: 263
-- Name: programs; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.programs ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4001 (class 0 OID 17383)
-- Dependencies: 268
-- Name: reading_list; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.reading_list ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3998 (class 0 OID 17347)
-- Dependencies: 265
-- Name: security_checklists; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.security_checklists ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4000 (class 0 OID 17373)
-- Dependencies: 267
-- Name: security_tips; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.security_tips ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4004 (class 0 OID 17436)
-- Dependencies: 271
-- Name: useful_links; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.useful_links ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3995 (class 0 OID 17294)
-- Dependencies: 262
-- Name: user_platform_profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_platform_profiles ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4006 (class 0 OID 17506)
-- Dependencies: 275
-- Name: user_rss_subscriptions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_rss_subscriptions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3993 (class 0 OID 17227)
-- Dependencies: 260
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3977 (class 0 OID 16533)
-- Dependencies: 235
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3979 (class 0 OID 16575)
-- Dependencies: 237
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3978 (class 0 OID 16548)
-- Dependencies: 236
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3991 (class 0 OID 17014)
-- Dependencies: 253
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 3992 (class 0 OID 17028)
-- Dependencies: 254
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4035 (class 6104 OID 16420)
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 17
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 12
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 11
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 18
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 16
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 13
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 300
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 358
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 299
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 298
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- TOC entry 4099 (class 0 OID 0)
-- Dependencies: 349
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- TOC entry 4100 (class 0 OID 0)
-- Dependencies: 350
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- TOC entry 4101 (class 0 OID 0)
-- Dependencies: 315
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- TOC entry 4102 (class 0 OID 0)
-- Dependencies: 351
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- TOC entry 4103 (class 0 OID 0)
-- Dependencies: 319
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 305
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4105 (class 0 OID 0)
-- Dependencies: 312
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- TOC entry 4106 (class 0 OID 0)
-- Dependencies: 311
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- TOC entry 4107 (class 0 OID 0)
-- Dependencies: 318
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4108 (class 0 OID 0)
-- Dependencies: 320
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4109 (class 0 OID 0)
-- Dependencies: 292
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- TOC entry 4110 (class 0 OID 0)
-- Dependencies: 293
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- TOC entry 4111 (class 0 OID 0)
-- Dependencies: 316
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- TOC entry 4112 (class 0 OID 0)
-- Dependencies: 317
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- TOC entry 4114 (class 0 OID 0)
-- Dependencies: 357
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- TOC entry 4116 (class 0 OID 0)
-- Dependencies: 327
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4118 (class 0 OID 0)
-- Dependencies: 325
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- TOC entry 4119 (class 0 OID 0)
-- Dependencies: 314
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4120 (class 0 OID 0)
-- Dependencies: 313
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- TOC entry 4121 (class 0 OID 0)
-- Dependencies: 355
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- TOC entry 4122 (class 0 OID 0)
-- Dependencies: 354
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- TOC entry 4123 (class 0 OID 0)
-- Dependencies: 353
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- TOC entry 4124 (class 0 OID 0)
-- Dependencies: 352
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- TOC entry 4125 (class 0 OID 0)
-- Dependencies: 348
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- TOC entry 4126 (class 0 OID 0)
-- Dependencies: 342
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4127 (class 0 OID 0)
-- Dependencies: 344
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4128 (class 0 OID 0)
-- Dependencies: 346
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4129 (class 0 OID 0)
-- Dependencies: 343
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4130 (class 0 OID 0)
-- Dependencies: 345
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4131 (class 0 OID 0)
-- Dependencies: 347
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4132 (class 0 OID 0)
-- Dependencies: 338
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- TOC entry 4133 (class 0 OID 0)
-- Dependencies: 340
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- TOC entry 4134 (class 0 OID 0)
-- Dependencies: 339
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4135 (class 0 OID 0)
-- Dependencies: 341
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4136 (class 0 OID 0)
-- Dependencies: 306
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- TOC entry 4137 (class 0 OID 0)
-- Dependencies: 308
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4138 (class 0 OID 0)
-- Dependencies: 307
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4139 (class 0 OID 0)
-- Dependencies: 321
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4140 (class 0 OID 0)
-- Dependencies: 294
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- TOC entry 4141 (class 0 OID 0)
-- Dependencies: 290
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- TOC entry 4142 (class 0 OID 0)
-- Dependencies: 289
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4143 (class 0 OID 0)
-- Dependencies: 291
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4144 (class 0 OID 0)
-- Dependencies: 326
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4145 (class 0 OID 0)
-- Dependencies: 322
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4147 (class 0 OID 0)
-- Dependencies: 356
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4148 (class 0 OID 0)
-- Dependencies: 304
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- TOC entry 4149 (class 0 OID 0)
-- Dependencies: 295
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- TOC entry 4150 (class 0 OID 0)
-- Dependencies: 309
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4151 (class 0 OID 0)
-- Dependencies: 277
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- TOC entry 4152 (class 0 OID 0)
-- Dependencies: 310
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4153 (class 0 OID 0)
-- Dependencies: 296
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- TOC entry 4154 (class 0 OID 0)
-- Dependencies: 297
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- TOC entry 4155 (class 0 OID 0)
-- Dependencies: 302
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- TOC entry 4156 (class 0 OID 0)
-- Dependencies: 301
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- TOC entry 4157 (class 0 OID 0)
-- Dependencies: 303
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- TOC entry 4158 (class 0 OID 0)
-- Dependencies: 323
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- TOC entry 4159 (class 0 OID 0)
-- Dependencies: 276
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- TOC entry 4160 (class 0 OID 0)
-- Dependencies: 381
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- TOC entry 4161 (class 0 OID 0)
-- Dependencies: 374
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4162 (class 0 OID 0)
-- Dependencies: 380
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- TOC entry 4163 (class 0 OID 0)
-- Dependencies: 373
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- TOC entry 4164 (class 0 OID 0)
-- Dependencies: 370
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- TOC entry 4165 (class 0 OID 0)
-- Dependencies: 371
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- TOC entry 4166 (class 0 OID 0)
-- Dependencies: 376
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 377
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 369
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 379
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 375
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 372
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 378
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 333
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 336
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 337
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 230
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE bugs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.bugs TO anon;
GRANT ALL ON TABLE public.bugs TO authenticated;
GRANT ALL ON TABLE public.bugs TO service_role;


--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE checklist_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.checklist_items TO anon;
GRANT ALL ON TABLE public.checklist_items TO authenticated;
GRANT ALL ON TABLE public.checklist_items TO service_role;


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE link_categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.link_categories TO anon;
GRANT ALL ON TABLE public.link_categories TO authenticated;
GRANT ALL ON TABLE public.link_categories TO service_role;


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE personal_notes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.personal_notes TO anon;
GRANT ALL ON TABLE public.personal_notes TO authenticated;
GRANT ALL ON TABLE public.personal_notes TO service_role;


--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE platforms; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.platforms TO anon;
GRANT ALL ON TABLE public.platforms TO authenticated;
GRANT ALL ON TABLE public.platforms TO service_role;


--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE programs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.programs TO anon;
GRANT ALL ON TABLE public.programs TO authenticated;
GRANT ALL ON TABLE public.programs TO service_role;


--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE reading_list; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.reading_list TO anon;
GRANT ALL ON TABLE public.reading_list TO authenticated;
GRANT ALL ON TABLE public.reading_list TO service_role;


--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE rss_articles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rss_articles TO anon;
GRANT ALL ON TABLE public.rss_articles TO authenticated;
GRANT ALL ON TABLE public.rss_articles TO service_role;


--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE rss_feeds; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rss_feeds TO anon;
GRANT ALL ON TABLE public.rss_feeds TO authenticated;
GRANT ALL ON TABLE public.rss_feeds TO service_role;


--
-- TOC entry 4225 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE security_checklists; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.security_checklists TO anon;
GRANT ALL ON TABLE public.security_checklists TO authenticated;
GRANT ALL ON TABLE public.security_checklists TO service_role;


--
-- TOC entry 4226 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE security_tips; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.security_tips TO anon;
GRANT ALL ON TABLE public.security_tips TO authenticated;
GRANT ALL ON TABLE public.security_tips TO service_role;


--
-- TOC entry 4227 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE useful_links; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.useful_links TO anon;
GRANT ALL ON TABLE public.useful_links TO authenticated;
GRANT ALL ON TABLE public.useful_links TO service_role;


--
-- TOC entry 4228 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE user_platform_profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_platform_profiles TO anon;
GRANT ALL ON TABLE public.user_platform_profiles TO authenticated;
GRANT ALL ON TABLE public.user_platform_profiles TO service_role;


--
-- TOC entry 4229 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE user_rss_subscriptions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_rss_subscriptions TO anon;
GRANT ALL ON TABLE public.user_rss_subscriptions TO authenticated;
GRANT ALL ON TABLE public.user_rss_subscriptions TO service_role;


--
-- TOC entry 4230 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- TOC entry 4231 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 256
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- TOC entry 2365 (class 826 OID 16590)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- TOC entry 2366 (class 826 OID 16591)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- TOC entry 2364 (class 826 OID 16589)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- TOC entry 2375 (class 826 OID 16664)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- TOC entry 2374 (class 826 OID 16663)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- TOC entry 2373 (class 826 OID 16662)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- TOC entry 2378 (class 826 OID 16624)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- TOC entry 2377 (class 826 OID 16623)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- TOC entry 2376 (class 826 OID 16622)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- TOC entry 2370 (class 826 OID 16604)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- TOC entry 2372 (class 826 OID 16603)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- TOC entry 2371 (class 826 OID 16602)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- TOC entry 2357 (class 826 OID 16477)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- TOC entry 2358 (class 826 OID 16478)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- TOC entry 2356 (class 826 OID 16476)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- TOC entry 2360 (class 826 OID 16480)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- TOC entry 2355 (class 826 OID 16475)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- TOC entry 2359 (class 826 OID 16479)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- TOC entry 2368 (class 826 OID 16594)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- TOC entry 2369 (class 826 OID 16595)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- TOC entry 2367 (class 826 OID 16593)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- TOC entry 2363 (class 826 OID 16532)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- TOC entry 2362 (class 826 OID 16531)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- TOC entry 2361 (class 826 OID 16530)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- TOC entry 3543 (class 3466 OID 16608)
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- TOC entry 3548 (class 3466 OID 16677)
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- TOC entry 3542 (class 3466 OID 16606)
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- TOC entry 3549 (class 3466 OID 16678)
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- TOC entry 3544 (class 3466 OID 16609)
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- TOC entry 3545 (class 3466 OID 16610)
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

-- Completed on 2025-05-28 13:42:22 EEST

--
-- PostgreSQL database dump complete
--

