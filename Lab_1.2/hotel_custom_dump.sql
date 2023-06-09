PGDMP     6    +                {         
   ITMO-Lab_1    15.2    15.2 @    d           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            e           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            f           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            g           1262    17377 
   ITMO-Lab_1    DATABASE     n   CREATE DATABASE "ITMO-Lab_1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "ITMO-Lab_1";
                postgres    false                        2615    17378    lab_1    SCHEMA        CREATE SCHEMA lab_1;
    DROP SCHEMA lab_1;
                postgres    false            �            1259    17771    conveniences    TABLE     �   CREATE TABLE lab_1.conveniences (
    id_conveniences bigint NOT NULL,
    category character varying(40) NOT NULL,
    name character varying(40) NOT NULL
);
    DROP TABLE lab_1.conveniences;
       lab_1         heap    postgres    false    6            �            1259    17770     conveniences_id_conveniences_seq    SEQUENCE     �   ALTER TABLE lab_1.conveniences ALTER COLUMN id_conveniences ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.conveniences_id_conveniences_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    6    224            �            1259    17380    employee    TABLE     T  CREATE TABLE lab_1.employee (
    id_employee bigint NOT NULL,
    full_name character varying(60) NOT NULL,
    post character varying(20) NOT NULL,
    category character varying(20) NOT NULL,
    salary integer NOT NULL,
    number_of_passport character varying(11) NOT NULL,
    CONSTRAINT employee_salary_check CHECK ((salary > 0))
);
    DROP TABLE lab_1.employee;
       lab_1         heap    postgres    false    6            �            1259    17379    employee_id_employee_seq    SEQUENCE     �   ALTER TABLE lab_1.employee ALTER COLUMN id_employee ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.employee_id_employee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    6    216            �            1259    17820    hotel    TABLE     �   CREATE TABLE lab_1.hotel (
    id_hotel bigint NOT NULL,
    name character varying(20) NOT NULL,
    adress character varying(60) NOT NULL,
    promotion_id bigint NOT NULL,
    hotel_room_id bigint NOT NULL,
    employee_id bigint NOT NULL
);
    DROP TABLE lab_1.hotel;
       lab_1         heap    postgres    false    6            �            1259    17819    hotel_id_hotel_seq    SEQUENCE     �   ALTER TABLE lab_1.hotel ALTER COLUMN id_hotel ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.hotel_id_hotel_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    6    230            �            1259    17809 
   hotel_room    TABLE     �   CREATE TABLE lab_1.hotel_room (
    id_hotel_room bigint NOT NULL,
    type_id bigint NOT NULL,
    cleaning_status boolean NOT NULL,
    employment_status boolean NOT NULL
);
    DROP TABLE lab_1.hotel_room;
       lab_1         heap    postgres    false    6            �            1259    17808    hotel_room_id_hotel_room_seq    SEQUENCE     �   ALTER TABLE lab_1.hotel_room ALTER COLUMN id_hotel_room ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.hotel_room_id_hotel_room_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    228    6            �            1259    17744 	   promotion    TABLE     �   CREATE TABLE lab_1.promotion (
    id_promotion bigint NOT NULL,
    holiday character varying(20),
    benefit character varying(20) NOT NULL,
    season character varying(6)
);
    DROP TABLE lab_1.promotion;
       lab_1         heap    postgres    false    6            �            1259    17743    promotion_id_promotion_seq    SEQUENCE     �   ALTER TABLE lab_1.promotion ALTER COLUMN id_promotion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.promotion_id_promotion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    6    218            �            1259    17842    registration    TABLE     �  CREATE TABLE lab_1.registration (
    date_of_registration timestamp without time zone NOT NULL,
    date_of_departure timestamp without time zone NOT NULL,
    hotel_room_id bigint NOT NULL,
    employee_id bigint NOT NULL,
    visitor_id bigint NOT NULL,
    reservation_status boolean NOT NULL,
    lateness_status boolean NOT NULL,
    CONSTRAINT registration_check CHECK ((date_of_registration < date_of_departure))
);
    DROP TABLE lab_1.registration;
       lab_1         heap    postgres    false    6            �            1259    17756    shift    TABLE       CREATE TABLE lab_1.shift (
    id_shift bigint NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    break_length character varying(1) NOT NULL,
    CONSTRAINT shift_check CHECK ((start_time < end_time))
);
    DROP TABLE lab_1.shift;
       lab_1         heap    postgres    false    6            �            1259    17755    shift_id_shift_seq    SEQUENCE     �   ALTER TABLE lab_1.shift ALTER COLUMN id_shift ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.shift_id_shift_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    6    222            �            1259    17785    type    TABLE     ]  CREATE TABLE lab_1.type (
    id_type bigint NOT NULL,
    price integer NOT NULL,
    number_of_seats integer NOT NULL,
    conveniences_id bigint,
    title character varying(10) NOT NULL,
    CONSTRAINT type_number_of_seats_check CHECK (((number_of_seats > 0) AND (number_of_seats <= 10))),
    CONSTRAINT type_price_check CHECK ((price > 0))
);
    DROP TABLE lab_1.type;
       lab_1         heap    postgres    false    6            �            1259    17784    type_id_type_seq    SEQUENCE     �   ALTER TABLE lab_1.type ALTER COLUMN id_type ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.type_id_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    226    6            �            1259    17750    visitor    TABLE     %  CREATE TABLE lab_1.visitor (
    id_visitor bigint NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    adress character varying(60) NOT NULL,
    number_of_passport character varying(11) NOT NULL
);
    DROP TABLE lab_1.visitor;
       lab_1         heap    postgres    false    6            �            1259    17749    visitor_id_visitor_seq    SEQUENCE     �   ALTER TABLE lab_1.visitor ALTER COLUMN id_visitor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.visitor_id_visitor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    6    220            �            1259    17864    work_schedule    TABLE     �   CREATE TABLE lab_1.work_schedule (
    id_work_schedule bigint NOT NULL,
    shift_id bigint NOT NULL,
    employee_id bigint NOT NULL
);
     DROP TABLE lab_1.work_schedule;
       lab_1         heap    postgres    false    6            �            1259    17863 "   work_schedule_id_work_schedule_seq    SEQUENCE     �   ALTER TABLE lab_1.work_schedule ALTER COLUMN id_work_schedule ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME lab_1.work_schedule_id_work_schedule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            lab_1          postgres    false    233    6            X          0    17771    conveniences 
   TABLE DATA           F   COPY lab_1.conveniences (id_conveniences, category, name) FROM stdin;
    lab_1          postgres    false    224   �Q       P          0    17380    employee 
   TABLE DATA           e   COPY lab_1.employee (id_employee, full_name, post, category, salary, number_of_passport) FROM stdin;
    lab_1          postgres    false    216   fR       ^          0    17820    hotel 
   TABLE DATA           `   COPY lab_1.hotel (id_hotel, name, adress, promotion_id, hotel_room_id, employee_id) FROM stdin;
    lab_1          postgres    false    230   �S       \          0    17809 
   hotel_room 
   TABLE DATA           _   COPY lab_1.hotel_room (id_hotel_room, type_id, cleaning_status, employment_status) FROM stdin;
    lab_1          postgres    false    228   �S       R          0    17744 	   promotion 
   TABLE DATA           J   COPY lab_1.promotion (id_promotion, holiday, benefit, season) FROM stdin;
    lab_1          postgres    false    218   4T       _          0    17842    registration 
   TABLE DATA           �   COPY lab_1.registration (date_of_registration, date_of_departure, hotel_room_id, employee_id, visitor_id, reservation_status, lateness_status) FROM stdin;
    lab_1          postgres    false    231   �T       V          0    17756    shift 
   TABLE DATA           L   COPY lab_1.shift (id_shift, start_time, end_time, break_length) FROM stdin;
    lab_1          postgres    false    222   WU       Z          0    17785    type 
   TABLE DATA           V   COPY lab_1.type (id_type, price, number_of_seats, conveniences_id, title) FROM stdin;
    lab_1          postgres    false    226   �U       T          0    17750    visitor 
   TABLE DATA           c   COPY lab_1.visitor (id_visitor, name, surname, patronymic, adress, number_of_passport) FROM stdin;
    lab_1          postgres    false    220   .V       a          0    17864    work_schedule 
   TABLE DATA           O   COPY lab_1.work_schedule (id_work_schedule, shift_id, employee_id) FROM stdin;
    lab_1          postgres    false    233   �W       h           0    0     conveniences_id_conveniences_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('lab_1.conveniences_id_conveniences_seq', 25, true);
          lab_1          postgres    false    223            i           0    0    employee_id_employee_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('lab_1.employee_id_employee_seq', 30, true);
          lab_1          postgres    false    215            j           0    0    hotel_id_hotel_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('lab_1.hotel_id_hotel_seq', 1, true);
          lab_1          postgres    false    229            k           0    0    hotel_room_id_hotel_room_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('lab_1.hotel_room_id_hotel_room_seq', 10, true);
          lab_1          postgres    false    227            l           0    0    promotion_id_promotion_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('lab_1.promotion_id_promotion_seq', 36, true);
          lab_1          postgres    false    217            m           0    0    shift_id_shift_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('lab_1.shift_id_shift_seq', 20, true);
          lab_1          postgres    false    221            n           0    0    type_id_type_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('lab_1.type_id_type_seq', 20, true);
          lab_1          postgres    false    225            o           0    0    visitor_id_visitor_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('lab_1.visitor_id_visitor_seq', 25, true);
          lab_1          postgres    false    219            p           0    0 "   work_schedule_id_work_schedule_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('lab_1.work_schedule_id_work_schedule_seq', 5, true);
          lab_1          postgres    false    232            �           2606    17775    conveniences conveniences_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY lab_1.conveniences
    ADD CONSTRAINT conveniences_pkey PRIMARY KEY (id_conveniences);
 G   ALTER TABLE ONLY lab_1.conveniences DROP CONSTRAINT conveniences_pkey;
       lab_1            postgres    false    224            �           2606    17385    employee employee_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY lab_1.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id_employee);
 ?   ALTER TABLE ONLY lab_1.employee DROP CONSTRAINT employee_pkey;
       lab_1            postgres    false    216            �           2606    17824    hotel hotel_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY lab_1.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id_hotel);
 9   ALTER TABLE ONLY lab_1.hotel DROP CONSTRAINT hotel_pkey;
       lab_1            postgres    false    230            �           2606    17826 6   hotel hotel_promotion_id_hotel_room_id_employee_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY lab_1.hotel
    ADD CONSTRAINT hotel_promotion_id_hotel_room_id_employee_id_key UNIQUE (promotion_id, hotel_room_id, employee_id);
 _   ALTER TABLE ONLY lab_1.hotel DROP CONSTRAINT hotel_promotion_id_hotel_room_id_employee_id_key;
       lab_1            postgres    false    230    230    230            �           2606    17813    hotel_room hotel_room_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY lab_1.hotel_room
    ADD CONSTRAINT hotel_room_pkey PRIMARY KEY (id_hotel_room);
 C   ALTER TABLE ONLY lab_1.hotel_room DROP CONSTRAINT hotel_room_pkey;
       lab_1            postgres    false    228            �           2606    17748    promotion promotion_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY lab_1.promotion
    ADD CONSTRAINT promotion_pkey PRIMARY KEY (id_promotion);
 A   ALTER TABLE ONLY lab_1.promotion DROP CONSTRAINT promotion_pkey;
       lab_1            postgres    false    218            �           2606    17847    registration registration_pkey 
   CONSTRAINT        ALTER TABLE ONLY lab_1.registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (hotel_room_id, employee_id, visitor_id);
 G   ALTER TABLE ONLY lab_1.registration DROP CONSTRAINT registration_pkey;
       lab_1            postgres    false    231    231    231            �           2606    17761    shift shift_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY lab_1.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (id_shift);
 9   ALTER TABLE ONLY lab_1.shift DROP CONSTRAINT shift_pkey;
       lab_1            postgres    false    222            �           2606    17791    type type_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY lab_1.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id_type);
 7   ALTER TABLE ONLY lab_1.type DROP CONSTRAINT type_pkey;
       lab_1            postgres    false    226            �           2606    17754    visitor visitor_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY lab_1.visitor
    ADD CONSTRAINT visitor_pkey PRIMARY KEY (id_visitor);
 =   ALTER TABLE ONLY lab_1.visitor DROP CONSTRAINT visitor_pkey;
       lab_1            postgres    false    220            �           2606    17868     work_schedule work_schedule_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY lab_1.work_schedule
    ADD CONSTRAINT work_schedule_pkey PRIMARY KEY (id_work_schedule);
 I   ALTER TABLE ONLY lab_1.work_schedule DROP CONSTRAINT work_schedule_pkey;
       lab_1            postgres    false    233            �           2606    17837    hotel hotel_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.hotel
    ADD CONSTRAINT hotel_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES lab_1.employee(id_employee) ON DELETE CASCADE;
 E   ALTER TABLE ONLY lab_1.hotel DROP CONSTRAINT hotel_employee_id_fkey;
       lab_1          postgres    false    216    3490    230            �           2606    17832    hotel hotel_hotel_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.hotel
    ADD CONSTRAINT hotel_hotel_room_id_fkey FOREIGN KEY (hotel_room_id) REFERENCES lab_1.hotel_room(id_hotel_room) ON DELETE CASCADE;
 G   ALTER TABLE ONLY lab_1.hotel DROP CONSTRAINT hotel_hotel_room_id_fkey;
       lab_1          postgres    false    230    3502    228            �           2606    17827    hotel hotel_promotion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.hotel
    ADD CONSTRAINT hotel_promotion_id_fkey FOREIGN KEY (promotion_id) REFERENCES lab_1.promotion(id_promotion) ON DELETE CASCADE;
 F   ALTER TABLE ONLY lab_1.hotel DROP CONSTRAINT hotel_promotion_id_fkey;
       lab_1          postgres    false    218    3492    230            �           2606    17814 "   hotel_room hotel_room_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.hotel_room
    ADD CONSTRAINT hotel_room_type_id_fkey FOREIGN KEY (type_id) REFERENCES lab_1.type(id_type) ON DELETE CASCADE;
 K   ALTER TABLE ONLY lab_1.hotel_room DROP CONSTRAINT hotel_room_type_id_fkey;
       lab_1          postgres    false    3500    226    228            �           2606    17853 *   registration registration_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.registration
    ADD CONSTRAINT registration_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES lab_1.employee(id_employee) ON DELETE CASCADE;
 S   ALTER TABLE ONLY lab_1.registration DROP CONSTRAINT registration_employee_id_fkey;
       lab_1          postgres    false    216    231    3490            �           2606    17848 ,   registration registration_hotel_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.registration
    ADD CONSTRAINT registration_hotel_room_id_fkey FOREIGN KEY (hotel_room_id) REFERENCES lab_1.hotel_room(id_hotel_room) ON DELETE CASCADE;
 U   ALTER TABLE ONLY lab_1.registration DROP CONSTRAINT registration_hotel_room_id_fkey;
       lab_1          postgres    false    228    231    3502            �           2606    17858 )   registration registration_visitor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.registration
    ADD CONSTRAINT registration_visitor_id_fkey FOREIGN KEY (visitor_id) REFERENCES lab_1.visitor(id_visitor) ON DELETE CASCADE;
 R   ALTER TABLE ONLY lab_1.registration DROP CONSTRAINT registration_visitor_id_fkey;
       lab_1          postgres    false    231    3494    220            �           2606    17792    type type_conveniences_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.type
    ADD CONSTRAINT type_conveniences_id_fkey FOREIGN KEY (conveniences_id) REFERENCES lab_1.conveniences(id_conveniences) ON DELETE CASCADE;
 G   ALTER TABLE ONLY lab_1.type DROP CONSTRAINT type_conveniences_id_fkey;
       lab_1          postgres    false    3498    224    226            �           2606    17874 ,   work_schedule work_schedule_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.work_schedule
    ADD CONSTRAINT work_schedule_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES lab_1.employee(id_employee) ON DELETE CASCADE;
 U   ALTER TABLE ONLY lab_1.work_schedule DROP CONSTRAINT work_schedule_employee_id_fkey;
       lab_1          postgres    false    233    3490    216            �           2606    17869 )   work_schedule work_schedule_shift_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY lab_1.work_schedule
    ADD CONSTRAINT work_schedule_shift_id_fkey FOREIGN KEY (shift_id) REFERENCES lab_1.shift(id_shift) ON DELETE CASCADE;
 R   ALTER TABLE ONLY lab_1.work_schedule DROP CONSTRAINT work_schedule_shift_id_fkey;
       lab_1          postgres    false    222    3496    233            X   �   x�e���@C�;U���������i`��eak�t�7�����~�FK�'&��+�C��c�b7F�Oֈ��H/�w�#k���";V��Co-�]0�Po-�Y��W�;s�c-�m��VD�vׁ#      P     x���oJ�0�?7��	�M�6����.����A���n�g�^��I|I�Pl�Lg^�of��|��'���w~��,��ǩ���q�3Zi�ʯY���K����I���73�hS�V�2(j���|�g����l� �m��NA���+�-��	�k��
�~�q�WLGP$��3q�:�C/�ޑ`g���2������S>��G��q[-:�-�߆��%<P�y��T�\�2?�TV�Ms#t:�����r^��?�����[B����!u�)����{K&�      ^   Q   x�3�0�bÅ�^��ya΅}/캰���{�»/l�دpa!����>���~���G�؈�ؘӌ�Ȍ+F��� Q�)�      \   2   x�3�44�,�L�2�44�L2,8-��.KNCK�����X(F��� �w�      R   v   x�%�=�`D��S��>V8�AZML�	�3�	&�fo�~�͛y���e�Ngy
�|p�׮�5ޯ�#r�BB
޹�ه���ߌ��S��eǍ�hT�:��i�K���z�>�      _   �   x�U���@C��*�����Zr��W�P"��F����R�Bf2NA���0PD��s/�5j��8�ϜްBo�b<֚��h7c�ݭc�l��9.�y/%(<�g�p�Klk?=Z�L󔁛�ͽ}x2�o|�i��RJ_=�/�      V   H   x�34�4202�50�54V04�2 !1K��!����)�b�@ŖȊ�0L6Q00�+6�n
��!\q� �� �      Z   o   x�e���@�b���c޽�?P �@ ²��:�D�h��ٵvQUd������?5���]�U��|p�;J�j�b�m{x�F��%x�q�E\a��P_�x�D� ��7�      T   W  x���]n�0���S� ��I�K@* Qڗ����A�"���
�u6������z�۱�
ϩL���Aa�S��A����NؠN�*Ѥ��إ��4��4ƞ}O�,��{�ڼg�����xxh���Bf�	�xd�9����P������-�Xa�f������>X��Wx�	C�gT��l��[���e����Ȟ��g���Yio�un����]SB����E���51��v����$ y���3Me��4�Zo�Z�FP��j{$2�oo\Sq� 1/� 3�E�{���RSrO�k��%�����f}_�E[��w���6�0�M,�������h	�n      a   0   x���  �w2j��v��	,(���*���nn8��$��B     