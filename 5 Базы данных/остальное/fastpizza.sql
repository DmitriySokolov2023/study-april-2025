PGDMP      1                }         
   fast-pizza    17.5    17.5 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388 
   fast-pizza    DATABASE     o   CREATE DATABASE "fast-pizza" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE "fast-pizza";
                     postgres    false                        2615    2200    pizza_schema    SCHEMA        CREATE SCHEMA pizza_schema;
    DROP SCHEMA pizza_schema;
                     pg_database_owner    false            �           0    0    SCHEMA pizza_schema    COMMENT     <   COMMENT ON SCHEMA pizza_schema IS 'standard public schema';
                        pg_database_owner    false    5            �            1259    16390 	   customers    TABLE     �   CREATE TABLE pizza_schema.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    address character varying(255),
    email character varying(100)
);
 #   DROP TABLE pizza_schema.customers;
       pizza_schema         heap r       postgres    false    5            �            1259    16389    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE pizza_schema.customers_id_seq;
       pizza_schema               postgres    false    5    218            �           0    0    customers_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE pizza_schema.customers_id_seq OWNED BY pizza_schema.customers.id;
          pizza_schema               postgres    false    217            �            1259    16401 	   employees    TABLE     �   CREATE TABLE pizza_schema.employees (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    role character varying(50) NOT NULL,
    phone character varying(15) NOT NULL,
    hire_date date
);
 #   DROP TABLE pizza_schema.employees;
       pizza_schema         heap r       postgres    false    5            �            1259    16400    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE pizza_schema.employees_id_seq;
       pizza_schema               postgres    false    5    220            �           0    0    employees_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE pizza_schema.employees_id_seq OWNED BY pizza_schema.employees.id;
          pizza_schema               postgres    false    219            �            1259    16436    orderdetails    TABLE     �   CREATE TABLE pizza_schema.orderdetails (
    id integer NOT NULL,
    order_id integer NOT NULL,
    pizza_id integer NOT NULL,
    quantity integer NOT NULL
);
 &   DROP TABLE pizza_schema.orderdetails;
       pizza_schema         heap r       postgres    false    5            �            1259    16435    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE pizza_schema.orderdetails_id_seq;
       pizza_schema               postgres    false    5    226            �           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE pizza_schema.orderdetails_id_seq OWNED BY pizza_schema.orderdetails.id;
          pizza_schema               postgres    false    225            �            1259    16417    orders    TABLE     �   CREATE TABLE pizza_schema.orders (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    employee_id integer,
    total_price numeric(10,2)
);
     DROP TABLE pizza_schema.orders;
       pizza_schema         heap r       postgres    false    5            �            1259    16416    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE pizza_schema.orders_id_seq;
       pizza_schema               postgres    false    5    224            �           0    0    orders_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE pizza_schema.orders_id_seq OWNED BY pizza_schema.orders.id;
          pizza_schema               postgres    false    223            �            1259    16410    pizzas    TABLE     �   CREATE TABLE pizza_schema.pizzas (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL
);
     DROP TABLE pizza_schema.pizzas;
       pizza_schema         heap r       postgres    false    5            �            1259    16409    pizzas_id_seq    SEQUENCE     �   CREATE SEQUENCE pizza_schema.pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE pizza_schema.pizzas_id_seq;
       pizza_schema               postgres    false    5    222            �           0    0    pizzas_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE pizza_schema.pizzas_id_seq OWNED BY pizza_schema.pizzas.id;
          pizza_schema               postgres    false    221            5           2604    16393    customers id    DEFAULT     x   ALTER TABLE ONLY pizza_schema.customers ALTER COLUMN id SET DEFAULT nextval('pizza_schema.customers_id_seq'::regclass);
 A   ALTER TABLE pizza_schema.customers ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    218    217    218            6           2604    16404    employees id    DEFAULT     x   ALTER TABLE ONLY pizza_schema.employees ALTER COLUMN id SET DEFAULT nextval('pizza_schema.employees_id_seq'::regclass);
 A   ALTER TABLE pizza_schema.employees ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    219    220    220            9           2604    16439    orderdetails id    DEFAULT     ~   ALTER TABLE ONLY pizza_schema.orderdetails ALTER COLUMN id SET DEFAULT nextval('pizza_schema.orderdetails_id_seq'::regclass);
 D   ALTER TABLE pizza_schema.orderdetails ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    226    225    226            8           2604    16420 	   orders id    DEFAULT     r   ALTER TABLE ONLY pizza_schema.orders ALTER COLUMN id SET DEFAULT nextval('pizza_schema.orders_id_seq'::regclass);
 >   ALTER TABLE pizza_schema.orders ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    223    224    224            7           2604    16413 	   pizzas id    DEFAULT     r   ALTER TABLE ONLY pizza_schema.pizzas ALTER COLUMN id SET DEFAULT nextval('pizza_schema.pizzas_id_seq'::regclass);
 >   ALTER TABLE pizza_schema.pizzas ALTER COLUMN id DROP DEFAULT;
       pizza_schema               postgres    false    222    221    222            �          0    16390 	   customers 
   TABLE DATA           J   COPY pizza_schema.customers (id, name, phone, address, email) FROM stdin;
    pizza_schema               postgres    false    218   +8       �          0    16401 	   employees 
   TABLE DATA           K   COPY pizza_schema.employees (id, name, role, phone, hire_date) FROM stdin;
    pizza_schema               postgres    false    220   @9       �          0    16436    orderdetails 
   TABLE DATA           N   COPY pizza_schema.orderdetails (id, order_id, pizza_id, quantity) FROM stdin;
    pizza_schema               postgres    false    226   8:       �          0    16417    orders 
   TABLE DATA           Q   COPY pizza_schema.orders (id, customer_id, employee_id, total_price) FROM stdin;
    pizza_schema               postgres    false    224   :       �          0    16410    pizzas 
   TABLE DATA           D   COPY pizza_schema.pizzas (id, name, description, price) FROM stdin;
    pizza_schema               postgres    false    222   �:       �           0    0    customers_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('pizza_schema.customers_id_seq', 6, true);
          pizza_schema               postgres    false    217            �           0    0    employees_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('pizza_schema.employees_id_seq', 30, true);
          pizza_schema               postgres    false    219            �           0    0    orderdetails_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('pizza_schema.orderdetails_id_seq', 29, true);
          pizza_schema               postgres    false    225            �           0    0    orders_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('pizza_schema.orders_id_seq', 25, true);
          pizza_schema               postgres    false    223            �           0    0    pizzas_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('pizza_schema.pizzas_id_seq', 20, true);
          pizza_schema               postgres    false    221            ;           2606    16399    customers customers_email_key 
   CONSTRAINT     _   ALTER TABLE ONLY pizza_schema.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 M   ALTER TABLE ONLY pizza_schema.customers DROP CONSTRAINT customers_email_key;
       pizza_schema                 postgres    false    218            =           2606    16397    customers customers_phone_key 
   CONSTRAINT     _   ALTER TABLE ONLY pizza_schema.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);
 M   ALTER TABLE ONLY pizza_schema.customers DROP CONSTRAINT customers_phone_key;
       pizza_schema                 postgres    false    218            ?           2606    16395    customers customers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY pizza_schema.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY pizza_schema.customers DROP CONSTRAINT customers_pkey;
       pizza_schema                 postgres    false    218            A           2606    16408    employees employees_phone_key 
   CONSTRAINT     _   ALTER TABLE ONLY pizza_schema.employees
    ADD CONSTRAINT employees_phone_key UNIQUE (phone);
 M   ALTER TABLE ONLY pizza_schema.employees DROP CONSTRAINT employees_phone_key;
       pizza_schema                 postgres    false    220            C           2606    16406    employees employees_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY pizza_schema.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY pizza_schema.employees DROP CONSTRAINT employees_pkey;
       pizza_schema                 postgres    false    220            I           2606    16441    orderdetails orderdetails_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY pizza_schema.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY pizza_schema.orderdetails DROP CONSTRAINT orderdetails_pkey;
       pizza_schema                 postgres    false    226            G           2606    16424    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY pizza_schema.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY pizza_schema.orders DROP CONSTRAINT orders_pkey;
       pizza_schema                 postgres    false    224            E           2606    16415    pizzas pizzas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY pizza_schema.pizzas
    ADD CONSTRAINT pizzas_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY pizza_schema.pizzas DROP CONSTRAINT pizzas_pkey;
       pizza_schema                 postgres    false    222            J           2606    16425    orders fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.orders
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES pizza_schema.customers(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY pizza_schema.orders DROP CONSTRAINT fk_customer;
       pizza_schema               postgres    false    218    224    4671            K           2606    16430    orders fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.orders
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES pizza_schema.employees(id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY pizza_schema.orders DROP CONSTRAINT fk_employee;
       pizza_schema               postgres    false    220    224    4675            L           2606    16442    orderdetails fk_order    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.orderdetails
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES pizza_schema.orders(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY pizza_schema.orderdetails DROP CONSTRAINT fk_order;
       pizza_schema               postgres    false    4679    226    224            M           2606    16447    orderdetails fk_pizza    FK CONSTRAINT     �   ALTER TABLE ONLY pizza_schema.orderdetails
    ADD CONSTRAINT fk_pizza FOREIGN KEY (pizza_id) REFERENCES pizza_schema.pizzas(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY pizza_schema.orderdetails DROP CONSTRAINT fk_pizza;
       pizza_schema               postgres    false    226    4677    222            �     x�U��J�@���)���&��?7�K��mZ���AP�"*��Ah����}#����m���7;��D�o�
�X�Q��zA(��b�3�|����;l��Ly,��E@��,?1W�p<0��h腄9*{c�1���a��WTl�����r��$a�L��?E�P9Uk���N}Æ���3�뎩�<��C��7�FL�4I���/���>4��,ϳ��	���{~�/���jeo�r�w���O�m�-[άP7��ѠߵO}��~ !��@      �   �   x�E�oJ�@�?oN����&��.&��OBKQ(�(���Xm�uf�X�?�;�{ok���/��N�\c@g��׳�>q��܄�Z�=�s�,�[�d%�����W)���J㠷�N~��τ,��(&EBi��7*�b��Rq^�^�F�� �`���Q��y�h���7{x�G�_���fd8爼��2�5xƯ�6:�f���D�q�O�<BeYU%W��]�$͛�      �   7   x�ʱ� �x1>o�^�/�h�Xԋ��Z̸pP�7>ԡ���w��J��i      �   =   x�-��� ����;p���:���h-�T�-3lv/�u��ɼ�XuX=���ZD���      �   �   x�u�M
�0���S�%��zc]XDAН.��j���+���7��B~�̼o^���pa�c<�0�lp�%j����a
gBaX�qc�ލ�hN�Y�Z�t��jJ$i�FC_$x�&1y6�����4 �4�٩�>�-���q��c����3J̲�8�cJ=�o��Gk�7CE������ڵ��{TQ;Tu�ϰ'̇Y�� 2Fi�$Or_��     