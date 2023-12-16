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
-- Name: employee_prediction id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee_prediction ALTER COLUMN id SET DEFAULT nextval('public.employee_prediction_id_seq'::regclass);


--
-- Name: employee_report id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee_report ALTER COLUMN id SET DEFAULT nextval('public.employee_report_id_seq'::regclass);


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

INSERT INTO public.employee_prediction VALUES (2801, 1, 0.41231743, '2023-12-16 18:44:52.796779', '{unreplied_messages,VacationMentioned,ReceivedMessages,answered_messages,text_length,MessagesReadLater,hidden_copy}');
INSERT INTO public.employee_prediction VALUES (2190, 2, 0.05142133, '2023-12-16 18:44:52.796779', '{response_time,VacationMentioned,ReceivedMessages,text_length,SalaryChangeMentioned,SentMessages,DaysBetweenReceivedAndRead}');
INSERT INTO public.employee_prediction VALUES (2817, 3, 0.003393737, '2023-12-16 18:44:52.796779', '{response_time,text_length,VacationMentioned,carbon_copy,answered_messages,unreplied_messages,DaysBetweenReceivedAndRead}');
INSERT INTO public.employee_prediction VALUES (1251, 4, 0.09036022, '2023-12-16 18:44:52.796779', '{response_time,VacationMentioned,text_length,ReceivedMessages,SentMessages,answered_messages,unreplied_messages}');
INSERT INTO public.employee_prediction VALUES (3505, 5, 0.8010205, '2023-12-16 18:44:52.796779', '{response_time,VacationMentioned,ReceivedMessages,DaysBetweenReceivedAndRead,answered_messages,text_length,MoodType}');
INSERT INTO public.employee_prediction VALUES (2117, 6, 0.15159403, '2023-12-16 18:44:52.796779', '{response_time,text_length,mention_colleagues,ReceivedMessages,DaysBetweenReceivedAndRead,unreplied_messages,MessagesReadLater}');
INSERT INTO public.employee_prediction VALUES (2411, 7, 0.90246034, '2023-12-16 18:44:52.796779', '{answered_messages,text_length,SalaryChangeMentioned,response_time,DaysBetweenReceivedAndRead,ReceivedMessages,unreplied_messages}');
INSERT INTO public.employee_prediction VALUES (3113, 8, 0.12431832, '2023-12-16 18:44:52.796779', '{response_time,VacationMentioned,ReceivedMessages,DaysBetweenReceivedAndRead,text_length,SalaryChangeMentioned,answered_messages}');
INSERT INTO public.employee_prediction VALUES (1408, 9, 0.011560956, '2023-12-16 18:44:52.796779', '{response_time,text_length,VacationMentioned,SalaryChangeMentioned,DaysBetweenReceivedAndRead,ReceivedMessages,answered_messages}');
INSERT INTO public.employee_prediction VALUES (3579, 10, 0.0028488608, '2023-12-16 18:44:52.796779', '{response_time,ReceivedMessages,VacationMentioned,SalaryChangeMentioned,text_length,SentMessages,answered_messages}');
INSERT INTO public.employee_prediction VALUES (2801, 11, 0.002821535, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,StressKeywordsPresent,ReceivedMessages,SentMessages,MessagesReadLater,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (2190, 12, 0.0017011694, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,SentMessages,VacationMentioned,MessagesReadLater,SentFrequency}');
INSERT INTO public.employee_prediction VALUES (2817, 13, 0.026899658, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,SentMessages,MessagesReadLater,SentFrequency,ReceivedFrequency,UniqueRecipients}');
INSERT INTO public.employee_prediction VALUES (1251, 14, 0.91483, '2023-12-16 18:45:09.447236', '{MessagesReadLater,ReceivedMessages,SentMessages,SentFrequency,UniqueRecipients,ReceivedFrequency,BytesSentReceivedRatio}');
INSERT INTO public.employee_prediction VALUES (3505, 15, 0.68605846, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,MessagesReadLater,SentMessages,SentFrequency,ReceivedFrequency,UniqueRecipients}');
INSERT INTO public.employee_prediction VALUES (2117, 16, 0.005150658, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,SentMessages,MessagesReadLater,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (2411, 17, 0.021932516, '2023-12-16 18:45:09.447236', '{MessagesReadLater,ReceivedMessages,DaysBetweenReceivedAndRead,SentMessages,SentFrequency,ReceivedFrequency,UniqueRecipients}');
INSERT INTO public.employee_prediction VALUES (3113, 18, 0.14681792, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,MessagesReadLater,SentMessages,SentFrequency,UniqueRecipients}');
INSERT INTO public.employee_prediction VALUES (1408, 19, 0.23801748, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,MessagesReadLater,SentMessages,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (3579, 20, 0.26770565, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,VacationMentioned,MessagesReadLater,SentMessages,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (3254, 21, 0.0012919066, '2023-12-16 18:45:09.447236', '{MessagesReadLater,ReceivedMessages,StressKeywordsPresent,DaysBetweenReceivedAndRead,SentMessages,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (1052, 22, 0.0033542963, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,SentMessages,MessagesReadLater,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (1644, 23, 0.44863304, '2023-12-16 18:45:09.447236', '{ReceivedMessages,StressKeywordsPresent,MessagesReadLater,SentMessages,SentFrequency,ReceivedFrequency,UniqueRecipients}');
INSERT INTO public.employee_prediction VALUES (2763, 24, 0.0015049208, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,SentMessages,MessagesReadLater,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (3776, 25, 0.0025782958, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,VacationMentioned,MessagesReadLater,SentMessages,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (1900, 26, 0.068796284, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,MessagesReadLater,SentMessages,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (2073, 27, 0.019170424, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,SentMessages,MessagesReadLater,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (1472, 28, 0.74779475, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,MessagesReadLater,SentMessages,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (3738, 29, 0.021594051, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,StressKeywordsPresent,SentMessages,MessagesReadLater,SentFrequency,ReceivedFrequency}');
INSERT INTO public.employee_prediction VALUES (3546, 30, 0.09950157, '2023-12-16 18:45:09.447236', '{DaysBetweenReceivedAndRead,ReceivedMessages,MessagesReadLater,SentMessages,SentFrequency,ReceivedFrequency,UniqueRecipients}');


--
-- Data for Name: employee_report; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.employee_report VALUES (22, 0.9945796349917594, 1, 0, 2801, 3, 1, 0, 0, 6, 0, 0, 0, 41, 114, 0, 0, 9, 51, 2.1923076923076925, 0, 138, 1, 6, 6, 1, '2023-12-16 18:44:52.662066', 'Development Department');
INSERT INTO public.employee_report VALUES (15, 1.3366652314230265, 1, 2, 2190, 0, 2, 1, 0, 4, 0, 0, 0, 28, 66, 3, 1, 11, 69, 0.9428571428571428, 0, 71, 0, 7, 6, 1, '2023-12-16 18:44:52.662066', 'Research and Development');
INSERT INTO public.employee_report VALUES (27, 1.8601524308367388, 7, 1, 2817, 4, 3, 0, 0, 2, 0, 0, 12, 30, 75, 4, 0, 13, 77, 0.9615384615384616, 0, 1059, 2, 8, 5, 1, '2023-12-16 18:44:52.662066', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (24, 1.521612727662241, 1, 0, 1251, 5, 4, 0, 9, 6, 0, 0, 0, 33, 115, 10, 0, 12, 67, 1.6911764705882353, 0, 199, 3, 9, 6, 1, '2023-12-16 18:44:52.662066', 'Development Department');
INSERT INTO public.employee_report VALUES (33, 1.0699205406284198, 0, 2, 3505, 0, 5, 1, 7, 4, 1, 0, 2, 36, 118, 3, 0, 13, 56, 2.0701754385964914, 0, 91, 0, 4, 4, 1, '2023-12-16 18:44:52.662066', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (7, 1.0964677600684452, 0, 3, 2117, 0, 6, 1, 0, 4, 0, 0, 1, 41, 105, 6, 0, 18, 22, 4.565217391304348, 0, 233, 0, 1, 4, 0, '2023-12-16 18:44:52.662066', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (19, 1.834147540075992, 2, 1, 2411, 2, 7, 1, 0, 4, 0, 0, 0, 24, 53, 1, 1, 8, 11, 4.416666666666667, 0, 85, 0, 4, 4, 0, '2023-12-16 18:44:52.662066', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (24, 1.0867306971340207, 0, 2, 3113, 0, 8, 1, 0, 4, 1, 1, 0, 38, 66, 2, 1, 10, 24, 2.64, 1, 81, 0, 4, 2, 1, '2023-12-16 18:44:52.662066', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (25, 1.5729794812552569, 1, 2, 1408, 2, 9, 1, 0, 4, 0, 0, 0, 38, 88, 6, 1, 17, 73, 1.1891891891891893, 0, 392, 3, 7, 3, 1, '2023-12-16 18:44:52.662066', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (28, 1.1531355196186286, 1, 0, 3579, 2, 10, 1, 8, 4, 0, 0, 0, 37, 70, 6, 1, 14, 62, 1.1111111111111112, 0, 67, 1, 5, 0, 1, '2023-12-16 18:44:52.662066', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (0, 0.5174265060678869, 0, 3, 2801, 0, 11, 0, 2, 4, 0, 0, 0, 12, 76, 0, 0, 19, 72, 0, 3, 0, 0, 8, 0, 0, '2023-12-16 18:45:09.330481', 'Development Department');
INSERT INTO public.employee_report VALUES (0, 0.5739286973538074, 0, 3, 2190, 0, 12, 0, 2, 6, 0, 0, 0, 14, 85, 0, 0, 9, 72, 0, 3, 0, 0, 7, 0, 1, '2023-12-16 18:45:09.330481', 'Research and Development');
INSERT INTO public.employee_report VALUES (0, 0.5948101589239858, 0, 2, 2817, 0, 13, 0, 2, 3, 0, 0, 0, 14, 81, 0, 0, 17, 61, 0, 0, 0, 0, 7, 0, 0, '2023-12-16 18:45:09.330481', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (0, 1.4156195111981777, 0, 0, 1251, 0, 14, 0, 3, 5, 0, 0, 0, 11, 97, 0, 0, 12, 86, 0, 0, 0, 0, 12, 0, 0, '2023-12-16 18:45:09.330481', 'Development Department');
INSERT INTO public.employee_report VALUES (0, 0.9811931936573292, 0, 1, 3505, 0, 15, 0, 3, 5, 0, 0, 0, 14, 77, 0, 0, 16, 78, 0, 0, 0, 0, 7, 0, 0, '2023-12-16 18:45:09.330481', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (0, 1.247447822204709, 0, 2, 2117, 0, 16, 0, 2, 4, 0, 0, 0, 15, 81, 0, 0, 16, 74, 0, 2, 0, 0, 6, 0, 0, '2023-12-16 18:45:09.330481', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (0, 1.852221357309483, 0, 1, 2411, 0, 17, 0, 2, 6, 0, 0, 0, 19, 88, 0, 0, 18, 66, 0, 0, 0, 0, 10, 0, 0, '2023-12-16 18:45:09.330481', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (0, 1.3075030775890868, 0, 1, 3113, 0, 18, 0, 2, 4, 0, 0, 0, 9, 94, 0, 0, 16, 70, 0, 3, 0, 0, 9, 0, 0, '2023-12-16 18:45:09.330481', 'Quality Assurance');
INSERT INTO public.employee_report VALUES (0, 1.9318294656461579, 0, 1, 1408, 0, 19, 0, 2, 4, 0, 0, 0, 15, 86, 0, 0, 16, 64, 0, 1, 0, 0, 8, 0, 0, '2023-12-16 18:45:09.330481', 'Sales and Marketing');
INSERT INTO public.employee_report VALUES (0, 0.8680421773530446, 0, 1, 3579, 0, 20, 0, 3, 4, 0, 0, 0, 14, 74, 0, 0, 13, 75, 0, 0, 0, 0, 5, 0, 1, '2023-12-16 18:45:09.330481', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (0, 1.2150216620380756, 0, 1, 3254, 0, 21, 0, 2, 7, 0, 0, 0, 10, 88, 0, 0, 20, 58, 0, 3, 0, 0, 5, 0, 0, '2023-12-16 18:45:09.330481', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (0, 1.672611841609407, 0, 3, 1052, 0, 22, 0, 2, 6, 0, 0, 0, 12, 63, 0, 0, 16, 69, 0, 1, 0, 0, 9, 0, 0, '2023-12-16 18:45:09.330481', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (0, 1.2057894609553301, 0, 0, 1644, 0, 23, 0, 2, 4, 0, 0, 0, 13, 78, 0, 0, 10, 64, 0, 1, 0, 0, 5, 0, 0, '2023-12-16 18:45:09.330481', 'Development Department');
INSERT INTO public.employee_report VALUES (0, 1.510846160715107, 0, 2, 2763, 0, 24, 0, 2, 4, 0, 0, 0, 17, 72, 0, 0, 14, 59, 0, 2, 0, 0, 6, 0, 0, '2023-12-16 18:45:09.330481', 'Research and Development');
INSERT INTO public.employee_report VALUES (0, 1.8118657141980012, 0, 2, 3776, 0, 25, 0, 2, 6, 0, 0, 0, 16, 79, 0, 0, 16, 56, 0, 0, 0, 0, 7, 0, 1, '2023-12-16 18:45:09.330481', 'Development Department');
INSERT INTO public.employee_report VALUES (0, 0.5495742720256518, 0, 1, 1900, 0, 26, 0, 2, 4, 0, 0, 0, 16, 91, 0, 0, 15, 57, 0, 3, 0, 0, 8, 0, 0, '2023-12-16 18:45:09.330481', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (0, 1.0908333634188456, 0, 2, 2073, 0, 27, 0, 3, 4, 0, 0, 0, 14, 82, 0, 0, 18, 81, 0, 3, 0, 0, 3, 0, 0, '2023-12-16 18:45:09.330481', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (0, 0.5242638709751797, 0, 1, 1472, 0, 28, 0, 2, 4, 0, 0, 0, 21, 85, 0, 0, 15, 67, 0, 1, 0, 0, 4, 0, 0, '2023-12-16 18:45:09.330481', 'IT Infrastructure');
INSERT INTO public.employee_report VALUES (0, 1.1316417621094272, 0, 2, 3738, 0, 29, 0, 3, 6, 0, 0, 0, 15, 71, 0, 0, 19, 77, 0, 1, 0, 0, 4, 0, 0, '2023-12-16 18:45:09.330481', 'Research and Development');
INSERT INTO public.employee_report VALUES (0, 1.5173712041569456, 0, 1, 3546, 0, 30, 0, 2, 5, 0, 0, 0, 10, 83, 0, 0, 15, 64, 0, 0, 0, 0, 5, 0, 0, '2023-12-16 18:45:09.330481', 'Quality Assurance');


--
-- Name: employee_prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.employee_prediction_id_seq', 30, true);


--
-- Name: employee_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.employee_report_id_seq', 30, true);


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

