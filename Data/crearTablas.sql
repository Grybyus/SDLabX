CREATE TABLE IF NOT EXISTS region (
  r_regionkey INTEGER NOT NULL,
  r_name CHAR(25) NULL DEFAULT NULL,
  r_comment VARCHAR(152) NULL DEFAULT NULL,
  PRIMARY KEY (r_regionkey));

CREATE TABLE IF NOT EXISTS part (
  p_partkey BIGINT NOT NULL,
  p_type VARCHAR(25) NULL DEFAULT NULL,
  p_size INTEGER NULL DEFAULT NULL,
  p_brand CHAR(10) NULL DEFAULT NULL,
  p_name VARCHAR(55) NULL DEFAULT NULL,
  p_container CHAR(10) NULL DEFAULT NULL,
  p_mfgr CHAR(25) NULL DEFAULT NULL,
  p_retailprice DECIMAL(19,4) NULL DEFAULT NULL,
  p_comment VARCHAR(23) NULL DEFAULT NULL,
  PRIMARY KEY (p_partkey));

CREATE TABLE IF NOT EXISTS nation (
  n_nationkey INTEGER NOT NULL,
  n_name CHAR(25) NULL DEFAULT NULL,
  n_regionkey INTEGER NULL DEFAULT NULL,
  n_comment VARCHAR(152) NULL DEFAULT NULL,
  PRIMARY KEY (n_nationkey),
  CONSTRAINT nation_ibfk_1
    FOREIGN KEY (n_regionkey)
    REFERENCES region (r_regionkey)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS supplier (
  s_suppkey INTEGER NOT NULL,
  s_nationkey INTEGER NULL DEFAULT NULL,
  s_comment VARCHAR(102) NULL DEFAULT NULL,
  s_name CHAR(25) NULL DEFAULT NULL,
  s_address VARCHAR(40) NULL DEFAULT NULL,
  s_phone CHAR(15) NULL DEFAULT NULL,
  s_acctbal DECIMAL(19,4) NULL DEFAULT NULL,
  PRIMARY KEY (s_suppkey),
  CONSTRAINT supplier_ibfk_1
    FOREIGN KEY (s_nationkey)
    REFERENCES nation (n_nationkey));

CREATE TABLE IF NOT EXISTS partsupp (
  ps_partkey BIGINT NOT NULL,
  ps_suppkey INTEGER NOT NULL,
  ps_supplycost DECIMAL(19,4) NOT NULL,
  ps_availqty INTEGER NULL DEFAULT NULL,
  ps_comment VARCHAR(199) NULL DEFAULT NULL,
  PRIMARY KEY (ps_partkey, ps_suppkey),
  CONSTRAINT partsupp_ibfk_1
    FOREIGN KEY (ps_partkey)
    REFERENCES part (p_partkey)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT partsupp_ibfk_2
    FOREIGN KEY (ps_suppkey)
    REFERENCES supplier (s_suppkey)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS customer (
  c_custkey BIGINT NOT NULL,
  c_mktsegment CHAR(10) NULL DEFAULT NULL,
  c_nationkey INTEGER NULL DEFAULT NULL,
  c_name VARCHAR(25) NULL DEFAULT NULL,
  c_address VARCHAR(40) NULL DEFAULT NULL,
  c_phone CHAR(15) NULL DEFAULT NULL,
  c_acctbal DECIMAL(19,4) NULL DEFAULT NULL,
  c_comment VARCHAR(118) NULL DEFAULT NULL,
  PRIMARY KEY (c_custkey),
  CONSTRAINT customer_ibfk_1
    FOREIGN KEY (c_nationkey)
    REFERENCES nation (n_nationkey)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS orders (
  o_orderdate DATE NULL DEFAULT NULL,
  o_orderkey BIGINT NOT NULL,
  o_custkey BIGINT NOT NULL,
  o_orderpriority CHAR(15) NULL DEFAULT NULL,
  o_shippriority INTEGER NULL DEFAULT NULL,
  o_clerk CHAR(15) NULL DEFAULT NULL,
  o_orderstatus CHAR(1) NULL DEFAULT NULL,
  o_totalprice DECIMAL(19,4) NULL DEFAULT NULL,
  o_comment VARCHAR(79) NULL DEFAULT NULL,
  PRIMARY KEY (o_orderkey),
  CONSTRAINT orders_ibfk_1
    FOREIGN KEY (o_custkey)
    REFERENCES customer (c_custkey)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS lineitem (
  l_shipdate DATE NULL DEFAULT NULL,
  l_orderkey BIGINT NOT NULL,
  l_discount DECIMAL(19,4) NOT NULL,
  l_extendedprice DECIMAL(19,4) NOT NULL,
  l_suppkey INTEGER NOT NULL,
  l_quantity BIGINT NOT NULL,
  l_returnflag CHAR(1) NULL DEFAULT NULL,
  l_partkey BIGINT NOT NULL,
  l_linestatus CHAR(1) NULL DEFAULT NULL,
  l_tax DECIMAL(19,4) NOT NULL,
  l_commitdate DATE NULL DEFAULT NULL,
  l_receiptdate DATE NULL DEFAULT NULL,
  l_shipmode CHAR(10) NULL DEFAULT NULL,
  l_linenumber BIGINT NOT NULL,
  l_shipinstruct CHAR(25) NULL DEFAULT NULL,
  l_comment VARCHAR(44) NULL DEFAULT NULL,
  PRIMARY KEY (l_orderkey, l_linenumber),
  CONSTRAINT lineitem_ibfk_1
    FOREIGN KEY (l_orderkey)
    REFERENCES orders (o_orderkey)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT lineitem_ibfk_2
    FOREIGN KEY (l_partkey , l_suppkey)
    REFERENCES partsupp (ps_partkey , ps_suppkey)
    ON DELETE CASCADE
    ON UPDATE CASCADE);