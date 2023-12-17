--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: director; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.director (
    id integer NOT NULL,
    department character varying(255),
    email character varying(255)
);


ALTER TABLE public.director OWNER TO "user";

--
-- Name: director_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.director_id_seq OWNER TO "user";

--
-- Name: director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.director_id_seq OWNED BY public.director.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    department character varying(255)
);


ALTER TABLE public.employee OWNER TO "user";

--
-- Name: employee_prediction; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.employee_prediction (
    employee_id integer,
    id integer NOT NULL,
    probability real NOT NULL,
    date timestamp(6) without time zone,
    top_features character varying(255)[]
);


ALTER TABLE public.employee_prediction OWNER TO "user";

--
-- Name: employee_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.employee_prediction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_prediction_id_seq OWNER TO "user";

--
-- Name: employee_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.employee_prediction_id_seq OWNED BY public.employee_prediction.id;


--
-- Name: employee_report; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.employee_report (
    answered_messages integer NOT NULL,
    bytes_sent_received_ratio double precision NOT NULL,
    carbon_copy integer NOT NULL,
    days_between_received_and_read integer NOT NULL,
    employee_id integer,
    hidden_copy integer NOT NULL,
    id integer NOT NULL,
    mention_colleagues integer NOT NULL,
    messages_outside_work_hours integer NOT NULL,
    messages_read_later integer NOT NULL,
    mood_type integer NOT NULL,
    polite_message integer NOT NULL,
    question_marks integer NOT NULL,
    received_frequency integer NOT NULL,
    received_messages integer NOT NULL,
    response_time integer NOT NULL,
    salary_change_mentioned integer NOT NULL,
    sent_frequency integer NOT NULL,
    sent_messages integer NOT NULL,
    sent_received_ratio double precision NOT NULL,
    stress_keywords_present integer NOT NULL,
    text_length integer NOT NULL,
    unanswered_messages integer NOT NULL,
    unique_recipients integer NOT NULL,
    unreplied_messages integer NOT NULL,
    vacation_mentioned integer NOT NULL,
    date timestamp(6) without time zone,
    department character varying(255)
);


ALTER TABLE public.employee_report OWNER TO "user";

--
-- Name: employee_report_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.employee_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_report_id_seq OWNER TO "user";

--
-- Name: employee_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.employee_report_id_seq OWNED BY public.employee_report.id;


--
-- Name: director id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.director ALTER COLUMN id SET DEFAULT nextval('public.director_id_seq'::regclass);


--
-- Name: employee_prediction id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee_prediction ALTER COLUMN id SET DEFAULT nextval('public.employee_prediction_id_seq'::regclass);


--
-- Name: employee_report id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee_report ALTER COLUMN id SET DEFAULT nextval('public.employee_report_id_seq'::regclass);


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.director VALUES (1, 'Development Department', 'director_test_address@mail.ru');
INSERT INTO public.director VALUES (2, 'Quality Assurance', 'director_test_address@mail.ru');
INSERT INTO public.director VALUES (3, 'IT Infrastructure', 'director_test_address@mail.ru');
INSERT INTO public.director VALUES (4, 'Sales and Marketing', 'director_test_address@mail.ru');
INSERT INTO public.director VALUES (5, 'Research and Development', 'director_test_address@mail.ru');


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.employee VALUES (2801, 'Development Department');
INSERT INTO public.employee VALUES (2190, 'Research and Development');
INSERT INTO public.employee VALUES (2817, 'IT Infrastructure');
INSERT INTO public.employee VALUES (1251, 'Development Department');
INSERT INTO public.employee VALUES (3505, 'Sales and Marketing');
INSERT INTO public.employee VALUES (2117, 'Sales and Marketing');
INSERT INTO public.employee VALUES (2411, 'Quality Assurance');
INSERT INTO public.employee VALUES (3113, 'Quality Assurance');
INSERT INTO public.employee VALUES (1408, 'Sales and Marketing');
INSERT INTO public.employee VALUES (3579, 'IT Infrastructure');
INSERT INTO public.employee VALUES (3254, 'IT Infrastructure');
INSERT INTO public.employee VALUES (1052, 'IT Infrastructure');
INSERT INTO public.employee VALUES (1644, 'Development Department');
INSERT INTO public.employee VALUES (2763, 'Research and Development');
INSERT INTO public.employee VALUES (3776, 'Development Department');
INSERT INTO public.employee VALUES (1900, 'IT Infrastructure');
INSERT INTO public.employee VALUES (2073, 'IT Infrastructure');
INSERT INTO public.employee VALUES (1472, 'IT Infrastructure');
INSERT INTO public.employee VALUES (3738, 'Research and Development');
INSERT INTO public.employee VALUES (3546, 'Quality Assurance');


--
-- Data for Name: employee_prediction; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.employee_prediction VALUES (2801, 1, 1.04390065e-05, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во дней между получением и прочтением письма","Кол-во сообщений с адресатами в поле \"копия\""}');
INSERT INTO public.employee_prediction VALUES (2190, 2, 1.1914315e-05, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Кол-во писем, на которые сотрудник сам не ответил","Кол-во полученных писем","Кол-во дней между получением и прочтением письма","Указание информации об отпуске"}');
INSERT INTO public.employee_prediction VALUES (2817, 3, 5.0320104e-05, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во полученных писем","Кол-во дней между получением и прочтением письма","Кол-во отправленных писем","Кол-во писем, на которые сотрудник не получил ответа"}');
INSERT INTO public.employee_prediction VALUES (1251, 4, 0.08809768, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во упоминаний коллег в письмах","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во символов текста в исходящих письмах","Кол-во отправленных писем","Кол-во сообщений с адресатами в поле \"копия\""}');
INSERT INTO public.employee_prediction VALUES (3505, 5, 0.0012329004, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во упоминаний коллег в письмах","Кол-во символов текста в исходящих письмах","Кол-во полученных писем","Кол-во отправленных писем","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во писем, на которые сотрудник не получил ответа"}');
INSERT INTO public.employee_prediction VALUES (2117, 6, 4.3872467e-05, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во отправленных писем","Кол-во писем, на которые сотруднику ответили другие"}');
INSERT INTO public.employee_prediction VALUES (2411, 7, 0.006878378, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во упоминаний коллег в письмах","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во символов текста в исходящих письмах","Кол-во отправленных писем","Кол-во писем, на которые сотруднику ответили другие"}');
INSERT INTO public.employee_prediction VALUES (3113, 8, 0.00046974336, '2023-12-17 21:45:51.983091', '{"Кол-во полученных писем","Среднее время ответа письмо","Кол-во стрессовых слов","Кол-во писем, на которые сотрудник сам не ответил","Кол-во отправленных писем","Кол-во писем, на которые сотруднику ответили другие","Кол-во сообщений с адресатами в поле \"копия\""}');
INSERT INTO public.employee_prediction VALUES (1408, 9, 0.0009967624, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Кол-во отправленных писем","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во писем, на которые сотрудник не получил ответа"}');
INSERT INTO public.employee_prediction VALUES (3579, 10, 0.015727961, '2023-12-17 21:45:51.983091', '{"Кол-во писем, на которые сотрудник сам не ответил","Указание информации об отпуске","Кол-во символов текста в исходящих письмах","Среднее время ответа письмо","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во писем, на которые сотруднику ответили другие","Кол-во полученных писем"}');
INSERT INTO public.employee_prediction VALUES (3254, 11, 3.7525453e-05, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во отправленных писем","Кол-во сообщений с адресатами в поле \"копия\""}');
INSERT INTO public.employee_prediction VALUES (1052, 12, 2.0832718e-05, '2023-12-17 21:45:51.983091', '{"Кол-во писем, на которые сотрудник сам не ответил","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Среднее время ответа письмо","Кол-во дней между получением и прочтением письма","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во писем, на которые сотруднику ответили другие"}');
INSERT INTO public.employee_prediction VALUES (1644, 13, 0.72644454, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во стрессовых слов","Кол-во писем, на которые сотруднику ответили другие","Кол-во символов текста в исходящих письмах","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (2763, 14, 1.0997953e-05, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Кол-во полученных писем","Кол-во дней между получением и прочтением письма","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (3776, 15, 1.3824353e-05, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во полученных писем","Указание информации об отпуске","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во отправленных писем","Кол-во дней между получением и прочтением письма"}');
INSERT INTO public.employee_prediction VALUES (1900, 16, 1.6805769e-05, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (2073, 17, 0.00013738686, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во дней между получением и прочтением письма","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (1472, 18, 0.07251285, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во полученных писем","Кол-во писем, на которые сотруднику ответили другие","Кол-во дней между получением и прочтением письма"}');
INSERT INTO public.employee_prediction VALUES (3738, 19, 0.00069067243, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Кол-во писем, на которые сотрудник сам не ответил","Кол-во дней между получением и прочтением письма","Кол-во полученных писем","Кол-во писем, на которые сотруднику ответили другие"}');
INSERT INTO public.employee_prediction VALUES (3546, 20, 0.00033358013, '2023-12-17 21:45:51.983091', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во упоминаний коллег в письмах","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во отправленных писем","Кол-во писем, на которые сотруднику ответили другие"}');
INSERT INTO public.employee_prediction VALUES (2801, 21, 1.1252801e-05, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во отправленных писем","Кол-во сообщений с адресатами в поле \"копия\""}');
INSERT INTO public.employee_prediction VALUES (2190, 22, 3.782643e-05, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во упоминаний коллег в письмах","Кол-во символов текста в исходящих письмах","Кол-во дней между получением и прочтением письма","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во сообщений с адресатами в поле \"копия\""}');
INSERT INTO public.employee_prediction VALUES (2817, 23, 2.327157e-05, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во упоминаний коллег в письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во символов текста в исходящих письмах","Кол-во дней между получением и прочтением письма","Кол-во сообщений с адресатами в поле \"копия\""}');
INSERT INTO public.employee_prediction VALUES (1251, 24, 4.278295e-05, '2023-12-17 21:46:00.692737', '{"Кол-во дней между получением и прочтением письма","Кол-во упоминаний коллег в письмах","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Среднее время ответа письмо","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во писем, на которые сотруднику ответили другие"}');
INSERT INTO public.employee_prediction VALUES (3505, 25, 3.9859733e-05, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во упоминаний коллег в письмах","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во писем, на которые сотрудник сам не ответил","Кол-во отправленных писем","Кол-во дней между получением и прочтением письма"}');
INSERT INTO public.employee_prediction VALUES (2117, 26, 0.0026506053, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во дней между получением и прочтением письма","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (2411, 27, 0.9501995, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во упоминаний коллег в письмах","Кол-во символов текста в исходящих письмах","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во писем, на которые сотруднику ответили другие","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (3113, 28, 3.246645e-05, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во упоминаний коллег в письмах","Кол-во полученных писем","Кол-во символов текста в исходящих письмах","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во дней между получением и прочтением письма","Кол-во писем, на которые сотрудник сам не ответил"}');
INSERT INTO public.employee_prediction VALUES (1408, 29, 0.9963314, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во писем, на которые сотруднику ответили другие","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (3579, 30, 1.6182179e-05, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Указание информации об отпуске","Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во стрессовых слов","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (3254, 31, 0.003330082, '2023-12-17 21:46:00.692737', '{"Кол-во дней между получением и прочтением письма","Кол-во стрессовых слов","Кол-во полученных писем","Кол-во писем, на которые сотруднику ответили другие","Среднее время ответа письмо","Кол-во отправленных писем","Кол-во символов текста в исходящих письмах"}');
INSERT INTO public.employee_prediction VALUES (1052, 32, 0.99955076, '2023-12-17 21:46:00.692737', '{"Кол-во писем, на которые сотруднику ответили другие","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Среднее время ответа письмо","Кол-во полученных писем","Кол-во писем, на которые сотрудник не получил ответа","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (1644, 33, 0.99998593, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Указание информации о изменении зарплаты","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Настроение в сообщении","Кол-во писем, на которые сотруднику ответили другие","Кол-во сообщений с адресатами в поле \"копия\""}');
INSERT INTO public.employee_prediction VALUES (2763, 34, 3.4537614e-05, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во стрессовых слов","Кол-во писем, на которые сотрудник сам не ответил","Кол-во писем, на которые сотруднику ответили другие","Кол-во отправленных писем","Кол-во писем, прочитанных позже, чем 4 часа и более"}');
INSERT INTO public.employee_prediction VALUES (3776, 35, 0.004007658, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во полученных писем","Указание информации об отпуске","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во стрессовых слов","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (1900, 36, 0.0005544551, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во упоминаний коллег в письмах","Кол-во дней между получением и прочтением письма","Кол-во писем, на которые сотрудник сам не ответил","Кол-во символов текста в исходящих письмах","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (2073, 37, 0.0021287624, '2023-12-17 21:46:00.692737', '{"Кол-во полученных писем","Кол-во писем, на которые сотрудник сам не ответил","Кол-во стрессовых слов","Кол-во отправленных писем","Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотруднику ответили другие"}');
INSERT INTO public.employee_prediction VALUES (1472, 38, 0.00095336506, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во символов текста в исходящих письмах","Кол-во стрессовых слов","Кол-во писем, на которые сотрудник сам не ответил","Кол-во полученных писем","Кол-во писем, на которые сотруднику ответили другие","Кол-во отправленных писем"}');
INSERT INTO public.employee_prediction VALUES (3738, 39, 1.4915477e-05, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во стрессовых слов","Кол-во символов текста в исходящих письмах","Кол-во писем, на которые сотрудник сам не ответил","Кол-во полученных писем","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во писем, прочитанных позже, чем 4 часа и более"}');
INSERT INTO public.employee_prediction VALUES (3546, 40, 0.00070321007, '2023-12-17 21:46:00.692737', '{"Среднее время ответа письмо","Кол-во полученных писем","Кол-во стрессовых слов","Кол-во писем, на которые сотрудник сам не ответил","Кол-во писем, на которые сотрудник не получил ответа","Кол-во сообщений с адресатами в поле \"копия\"","Кол-во символов текста в исходящих письмах"}');


--
-- Data for Name: employee_report; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.employee_report VALUES (23, 0.5174265060678869, 8, 3, 2801, 2, 1, 3, 2, 4, 0, 0, 3, 12, 76, 5, 0, 19, 72, 1.0410958904109588, 3, 128, 19, 8, 13, 0, '2023-12-17 21:45:51.983091', 'Development Department');
INSERT INTO public.employee_report VALUES (27, 0.5739286973538074, 4, 3, 2190, 1, 2, 1, 2, 6, 0, 0, 2, 14, 85, 5, 0, 9, 72, 1.1643835616438356, 3, 138, 11, 7, 19, 1, '2023-12-17 21:45:51.983091', 'Research and Development');
INSERT INTO public.employee_report VALUES (18, 0.5948101589239858, 3, 2, 2817, 6, 3, 0, 2, 3, 0, 0, 2, 14, 81, 4, 0, 17, 61, 1.3064516129032258, 0, 166, 16, 7, 14, 0, '2023-12-17 21:45:51.983091', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (20, 1.4156195111981777, 5, 0, 1251, 3, 4, 2, 3, 5, 0, 0, 3, 11, 97, 3, 0, 12, 86, 1.1149425287356323, 0, 97, 14, 12, 11, 0, '2023-12-17 21:45:51.983091', 'Development Department');
INSERT INTO public.employee_report VALUES (15, 0.9811931936573292, 4, 1, 3505, 3, 5, 3, 3, 5, 0, 0, 2, 14, 77, 4, 0, 16, 78, 0.9746835443037974, 0, 140, 15, 7, 4, 0, '2023-12-17 21:45:51.983091', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (36, 1.247447822204709, 2, 2, 2117, 4, 6, 2, 2, 4, 0, 0, 3, 15, 81, 5, 0, 16, 74, 1.08, 2, 147, 14, 6, 14, 0, '2023-12-17 21:45:51.983091', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (21, 1.852221357309483, 2, 1, 2411, 3, 7, 2, 2, 6, 0, 0, 3, 19, 88, 3, 0, 18, 66, 1.3134328358208955, 0, 81, 9, 10, 10, 0, '2023-12-17 21:45:51.983091', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (24, 1.3075030775890868, 4, 1, 3113, 3, 8, 3, 2, 4, 0, 0, 2, 9, 94, 3, 0, 16, 70, 1.323943661971831, 3, 24, 15, 9, 8, 0, '2023-12-17 21:45:51.983091', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (17, 1.9318294656461579, 4, 1, 1408, 2, 9, 0, 2, 4, 0, 0, 2, 15, 86, 4, 0, 16, 64, 1.323076923076923, 1, 100, 16, 8, 5, 0, '2023-12-17 21:45:51.983091', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (24, 0.8680421773530446, 5, 1, 3579, 2, 10, 3, 3, 4, 0, 0, 2, 14, 74, 3, 0, 13, 75, 0.9736842105263158, 0, 311, 9, 5, 14, 1, '2023-12-17 21:45:51.983091', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (23, 1.2150216620380756, 5, 1, 3254, 1, 11, 0, 2, 7, 0, 0, 2, 10, 88, 4, 0, 20, 58, 1.4915254237288136, 3, 88, 20, 5, 9, 0, '2023-12-17 21:45:51.983091', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (25, 1.672611841609407, 6, 3, 1052, 3, 12, 2, 2, 6, 0, 0, 3, 12, 63, 3, 0, 16, 69, 0.9, 1, 562, 8, 9, 17, 0, '2023-12-17 21:45:51.983091', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (27, 1.2057894609553301, 3, 0, 1644, 2, 13, 2, 2, 4, 0, 0, 3, 13, 78, 2, 0, 10, 64, 1.2, 1, 83, 12, 5, -1, 0, '2023-12-17 21:45:51.983091', 'Development Department');
INSERT INTO public.employee_report VALUES (18, 1.510846160715107, 6, 2, 2763, 5, 14, 0, 2, 4, 0, 0, 3, 17, 72, 4, 0, 14, 59, 1.2, 2, 149, 14, 6, 5, 0, '2023-12-17 21:45:51.983091', 'Research and Development');
INSERT INTO public.employee_report VALUES (20, 1.8118657141980012, 5, 2, 3776, 1, 15, 2, 2, 6, 0, 0, 2, 16, 79, 6, 0, 16, 56, 1.3859649122807018, 0, 77, 15, 7, 14, 1, '2023-12-17 21:45:51.983091', 'Development Department');
INSERT INTO public.employee_report VALUES (14, 0.5495742720256518, 7, 1, 1900, 4, 16, 1, 2, 4, 0, 0, 2, 16, 91, 5, 0, 15, 57, 1.5689655172413792, 3, 205, 12, 8, 13, 0, '2023-12-17 21:45:51.983091', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (26, 1.0908333634188456, 1, 2, 2073, 3, 17, 3, 3, 4, 0, 0, 2, 14, 82, 3, 0, 18, 81, 1, 3, 95, 19, 3, 11, 0, '2023-12-17 21:45:51.983091', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (17, 0.5242638709751797, 2, 1, 1472, 1, 18, 1, 2, 4, 0, 0, 2, 21, 85, 4, 0, 15, 67, 1.25, 1, 406, 11, 4, 16, 0, '2023-12-17 21:45:51.983091', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (23, 1.1316417621094272, 2, 2, 3738, 1, 19, 1, 3, 6, 0, 0, 3, 15, 71, 4, 0, 19, 77, 0.9102564102564102, 1, 207, 9, 4, 11, 0, '2023-12-17 21:45:51.983091', 'Research and Development');
INSERT INTO public.employee_report VALUES (25, 1.5173712041569456, 4, 1, 3546, 2, 20, 2, 2, 5, 0, 0, 3, 10, 83, 4, 0, 15, 64, 1.2769230769230768, 0, 95, 16, 5, 10, 0, '2023-12-17 21:45:51.983091', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (17, 0.5768018460391855, 5, 1, 2801, 4, 21, 1, 2, 5, 0, 0, 3, 20, 89, 5, 0, 11, 59, 1.4833333333333334, 2, 133, 11, 7, 14, 0, '2023-12-17 21:46:00.692737', 'Development Department');
INSERT INTO public.employee_report VALUES (23, 0.6385189137400762, 5, 2, 2190, 2, 22, 3, 2, 7, 0, 0, 2, 10, 71, 4, 0, 16, 55, 1.2678571428571428, 0, 208, 13, 2, 7, 0, '2023-12-17 21:46:00.692737', 'Research and Development');
INSERT INTO public.employee_report VALUES (19, 0.5940842826738835, 6, 2, 2817, 2, 23, 1, 3, 6, 0, 0, 3, 19, 84, 3, 0, 10, 76, 1.0909090909090908, 0, 96, 17, 10, 13, 0, '2023-12-17 21:46:00.692737', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (24, 0.9678044193970072, 5, 3, 1251, 3, 24, 3, 2, 6, 0, 0, 2, 19, 78, 2, 0, 14, 65, 1.1818181818181819, 0, 401, 11, 4, 10, 0, '2023-12-17 21:46:00.692737', 'Development Department');
INSERT INTO public.employee_report VALUES (18, 0.7198795544106719, 8, 2, 3505, 3, 25, 1, 2, 5, 0, 0, 2, 14, 94, 5, 0, 17, 60, 1.540983606557377, 0, 29, 14, 4, 10, 0, '2023-12-17 21:46:00.692737', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (23, 1.2175979572679003, 1, 2, 2117, 3, 26, 2, 2, 4, 0, 0, 3, 18, 98, 5, 0, 16, 70, 1.380281690140845, 1, 156, 10, 2, 10, 0, '2023-12-17 21:46:00.692737', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (29, 1.9334327336918147, 3, 0, 2411, 2, 27, 2, 3, 4, 0, 0, 2, 17, 83, 3, 0, 17, 77, 1.064102564102564, 0, 119, 12, 5, 11, 0, '2023-12-17 21:46:00.692737', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (22, 1.4976820934360022, 7, 2, 3113, 5, 28, 1, 2, 6, 0, 0, 3, 16, 75, 3, 0, 8, 64, 1.1538461538461537, 0, 99, 7, 7, 8, 0, '2023-12-17 21:46:00.692737', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (22, 1.803705051708357, 2, 1, 1408, 1, 29, 1, 3, 3, 0, 0, 2, 14, 86, 2, 0, 20, 81, 1.048780487804878, 1, 91, 12, 10, 7, 0, '2023-12-17 21:46:00.692737', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (20, 0.9936233703214636, 5, 1, 3579, 2, 30, 4, 2, 6, 0, 0, 2, 21, 86, 5, 0, 16, 58, 1.4576271186440677, 1, 129, 11, 4, 17, 1, '2023-12-17 21:46:00.692737', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (35, 1.9542580230968287, 4, 3, 3254, 3, 31, 1, 3, 4, 0, 0, 2, 19, 70, 2, 0, 10, 77, 0.8974358974358975, 2, 60, 13, 6, 7, 0, '2023-12-17 21:46:00.692737', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (36, 1.7215566201092782, 1, 0, 1052, 2, 32, 0, 2, 4, 0, 0, 3, 14, 105, 2, 0, 18, 68, 1.5217391304347827, 1, 160, 15, 3, 2, 0, '2023-12-17 21:46:00.692737', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (26, 1.2047555909307515, 3, 0, 1644, 1, 33, 1, 2, 4, 1, 0, 2, 18, 94, 3, 1, 13, 71, 1.3055555555555556, 1, 878, 9, 4, 4, 0, '2023-12-17 21:46:00.692737', 'Development Department');
INSERT INTO public.employee_report VALUES (26, 1.661105725516713, 4, 1, 2763, 6, 34, 3, 2, 7, 0, 0, 2, 16, 94, 3, 0, 9, 65, 1.4242424242424243, 2, 42, 15, 8, 9, 0, '2023-12-17 21:46:00.692737', 'Research and Development');
INSERT INTO public.employee_report VALUES (14, 0.7798408114038882, 2, 0, 3776, 3, 35, 0, 2, 4, 0, 0, 3, 21, 87, 3, 0, 10, 57, 1.5, 1, 117, 17, 7, 10, 1, '2023-12-17 21:46:00.692737', 'Development Department');
INSERT INTO public.employee_report VALUES (21, 1.6016694117978385, 4, 2, 1900, 4, 36, 2, 2, 6, 0, 0, 2, 14, 95, 3, 0, 14, 71, 1.3194444444444444, 0, 61, 16, 11, 7, 0, '2023-12-17 21:46:00.692737', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (23, 0.7480627102746809, 2, 1, 2073, 1, 37, 2, 3, 5, 0, 0, 2, 16, 78, 2, 0, 19, 78, 0.9873417721518988, 1, 45, 14, 6, 15, 0, '2023-12-17 21:46:00.692737', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (23, 1.9991001892781437, 2, 1, 1472, 3, 38, 1, 2, 4, 0, 0, 2, 18, 86, 4, 0, 16, 72, 1.178082191780822, 1, 214, 10, 5, 12, 0, '2023-12-17 21:46:00.692737', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (15, 1.2248459464937127, 6, 1, 3738, 4, 39, 3, 2, 6, 0, 0, 3, 9, 89, 4, 0, 18, 63, 1.390625, 1, 233, 7, 5, 14, 0, '2023-12-17 21:46:00.692737', 'Research and Development');
INSERT INTO public.employee_report VALUES (17, 1.8958044213495662, 4, 1, 3546, 1, 40, 1, 2, 6, 0, 0, 3, 9, 83, 2, 0, 16, 64, 1.2769230769230768, 1, 66, 20, 8, 9, 0, '2023-12-17 21:46:00.692737', 'Quality Assurance');


--
-- Name: director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.director_id_seq', 5, true);


--
-- Name: employee_prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.employee_prediction_id_seq', 40, true);


--
-- Name: employee_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.employee_report_id_seq', 40, true);


--
-- Name: director director_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: employee_prediction employee_prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee_prediction
    ADD CONSTRAINT employee_prediction_pkey PRIMARY KEY (id);


--
-- Name: employee_report employee_report_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee_report
    ADD CONSTRAINT employee_report_pkey PRIMARY KEY (id);


--
-- Name: employee_prediction fk1eu5au9glbffta4o4v64geopw; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee_prediction
    ADD CONSTRAINT fk1eu5au9glbffta4o4v64geopw FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- Name: employee_report fkp29l12lahykh7yycs6mrpiubt; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee_report
    ADD CONSTRAINT fkp29l12lahykh7yycs6mrpiubt FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- PostgreSQL database dump complete
--

