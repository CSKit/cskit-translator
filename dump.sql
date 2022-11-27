--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.2

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
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: phrases; Type: TABLE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE TABLE public.phrases (
    id integer NOT NULL,
    key text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    page character varying(255),
    marginal_heading boolean DEFAULT false,
    chapter_title boolean DEFAULT false
);


ALTER TABLE public.phrases OWNER TO fhftsxiohdoauj;

--
-- Name: phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE SEQUENCE public.phrases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phrases_id_seq OWNER TO fhftsxiohdoauj;

--
-- Name: phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhftsxiohdoauj
--

ALTER SEQUENCE public.phrases_id_seq OWNED BY public.phrases.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE TABLE public.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO fhftsxiohdoauj;

--
-- Name: translations; Type: TABLE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE TABLE public.translations (
    id integer NOT NULL,
    phrase_id integer,
    locale character varying(255),
    translation text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer
);


ALTER TABLE public.translations OWNER TO fhftsxiohdoauj;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE SEQUENCE public.translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO fhftsxiohdoauj;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhftsxiohdoauj
--

ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255)
);


ALTER TABLE public.users OWNER TO fhftsxiohdoauj;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO fhftsxiohdoauj;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhftsxiohdoauj
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE TABLE public.votes (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    value integer,
    user_id integer,
    translation_id integer
);


ALTER TABLE public.votes OWNER TO fhftsxiohdoauj;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: fhftsxiohdoauj
--

CREATE SEQUENCE public.votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.votes_id_seq OWNER TO fhftsxiohdoauj;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhftsxiohdoauj
--

ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;


--
-- Name: phrases id; Type: DEFAULT; Schema: public; Owner: fhftsxiohdoauj
--

ALTER TABLE ONLY public.phrases ALTER COLUMN id SET DEFAULT nextval('public.phrases_id_seq'::regclass);


--
-- Name: translations id; Type: DEFAULT; Schema: public; Owner: fhftsxiohdoauj
--

ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: fhftsxiohdoauj
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: fhftsxiohdoauj
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- Data for Name: phrases; Type: TABLE DATA; Schema: public; Owner: fhftsxiohdoauj
--

COPY public.phrases (id, key, created_at, updated_at, page, marginal_heading, chapter_title) FROM stdin;
1	Preface	2014-03-26 15:12:08.422359	2014-03-26 15:12:08.422359	vi	f	t
2	To those leaning on the sustaining infinite, today is big with blessings. The wakeful shepherd beholds the first faint morning beams, ere cometh the full radiance of a risen day. So shone the pale star to the prophet-shepherds; yet it traversed the night, and came where, in cradled obscurity, lay the Bethlehem babe, the human herald of Christ, Truth, who would make plain to benighted understanding the way of salvation through Christ Jesus, till across a night of error should dawn the morning beams and shine the guiding star of being. The Wise-men were led to behold and to follow this daystar of divine Science, lighting the way to eternal harmony.	2014-03-26 15:12:08.516808	2014-03-26 15:12:08.516808	vi	f	f
3	The time for thinkers has come. Truth, independent of doctrines and time-honored systems, knocks at the portal of humanity. Contentment with the past and the cold conventionality of materialism are crumbling away. Ignorance of God is no longer the steppingstone to faith. The only guarantee of obedience is a right apprehension of Him whom to know aright is Life eternal. Though empires fall, "the Lord shall reign forever."	2014-03-26 15:12:08.562125	2014-03-26 15:12:08.562125	vi	f	f
4	A book introduces new thoughts, but it cannot make them speedily understood. It is the task of the sturdy pioneer to hew the tall oak and to cut the rough granite. Future ages must declare what the pioneer has accomplished.	2014-03-26 15:12:08.567602	2014-03-26 15:12:08.567602	vi	f	f
5	Since the author's discovery of the might of Truth in the treatment of disease as well as of sin, her system has been fully tested and has not been found wanting; but to reach the heights of Christian Science, man must live in obedience to its divine Principle. To develop the full might of this Science, the discords of corporeal sense must yield to the harmony of spiritual sense, even as the science of music corrects false tones and gives sweet concord to sound.	2014-03-26 15:12:08.580953	2014-03-26 15:12:08.580953	vi	f	f
6	Theology and physics teach that both Spirit and matter are real and good, whereas the fact is that Spirit is good and real, and matter is Spirit's opposite. The question, What is Truth, is answered by demonstration, by healing both disease and sin; and this demonstration shows that Christian healing confers the most health and makes the best men. On this basis Christian Science will have a fair fight. Sickness has been combated for centuries by doctors using material remedies; but the question arises, Is there less sickness because of these practitioners? A vigorous "No" is the response deducible from two connate facts, the reputed longevity of the Antediluvians, and the rapid multiplication and increased violence of diseases since the flood.	2014-03-26 15:12:08.63002	2014-03-26 15:12:08.63002	vii	f	f
7	In the author's work, RETROSPECTION AND INTROSPECTION, may be found a biographical sketch, narrating experiences which led her, in the year 1866, to the discovery of the system that she denominated Christian Science. As early as 1862 she began to write down and give to friends the results of her Scriptural study, for the Bible was her sole teacher; but these compositions were crude, the first steps of a child in the newly discovered world of Spirit.	2014-03-26 15:12:08.659702	2014-03-26 15:12:08.659702	vii	f	f
8	She also began to jot down her thoughts on the main subject, but these jottings were only infantile lispings of Truth. A child drinks in the outward world through the eyes and rejoices in the draught. He is as sure of the world's existence as he is of his own; yet he cannot describe the world. He finds a few words, and with these he stammeringly attempts to convey his feeling. Later, the tongue voices the more definite thought, though still imperfectly.	2014-03-26 15:12:08.665331	2014-03-26 15:12:08.665331	ix	f	f
9	So was it with the author. As a certain poet says of himself, she "lisped in numbers, for the numbers came." Certain essays written at that early date are still in circulation among her first pupils; but they are feeble attempts to state the Principle and practice of Christian healing, and are not complete nor satisfactory expositions of Truth. Today, though rejoicing in some progress, she still finds herself a willing disciple at the heavenly gate, waiting for the Mind of Christ.	2014-03-26 15:12:08.71109	2014-03-26 15:12:08.71109	ix	f	f
10	Her first pamphlet on Christian Science was copyrighted in 1870; but it did not appear in print until 1876, as she had learned that this Science must be demonstrated by healing, before a work on the subject could be profitably studied. From 1867 until 1875, copies were, however, in friendly circulation.	2014-03-26 15:12:08.721749	2014-03-26 15:12:08.721749	ix	f	f
11	Before writing this work, SCIENCE AND HEALTH, she made copious notes of Scriptural exposition, which have never been published. This was during the years 1867 and 1868. These efforts show her comparative ignorance of the stupendous Life-problem up to that time, and the degrees by which she came at length to its solution; but she values them as a parent may treasure the memorials of a child's growth, and she would not have them changed.	2014-03-26 15:12:08.765587	2014-03-26 15:12:08.765587	ix	f	f
12	The first edition of SCIENCE AND HEALTH was published in 1875. Various books on mental healing have since been issued, most of them incorrect in theory and filled with plagiarisms from SCIENCE AND HEALTH. They regard the human mind as a healing agent, whereas this mind is not a factor in the Principle of Christian Science. A few books, however, which are based on this book, are useful.	2014-03-26 15:12:08.788164	2014-03-26 15:12:08.788164	x	f	f
13	The author has not compromised conscience to suit the general drift of thought, but has bluntly and honestly given the text of Truth. She has made no effort to embellish, elaborate, or treat in full detail so infinite a theme. By thousands of well-authenticated cases of healing, she and her students have proved the worth of her teachings. These cases for the most part have been abandoned as hopeless by regular medical attendants. Few invalids will turn to God till all physical supports have failed, because there is so little faith in His disposition and power to heal disease.	2014-03-26 15:12:08.828184	2014-03-26 15:12:08.828184	x	f	f
14	The divine Principle of healing is proved in the personal experience of any sincere seeker of Truth. Its purpose is good, and its practice is safer and more potent than that of any other sanitary method. The unbiased Christian thought is soonest touched by Truth, and convinced of it. Only those quarrel with her method who do not understand her meaning, or discerning the truth, come not to the light lest their works be reproved. No intellectual proficiency is requisite in the learner, but sound morals are most desirable.	2014-03-26 15:12:08.893638	2014-03-26 15:12:08.893638	x	f	f
15	Many imagine that the phenomena of physical healing in Christian Science present only a phase of the action of the human mind, which action in some unexplained way results in the cure of disease. On the contrary, Christian Science rationally explains that all other pathological methods are the fruits of human faith in matter, faith in the workings, not of Spirit, but of the fleshly mind which must yield to Science.	2014-03-26 15:12:08.932052	2014-03-26 15:12:08.932052	xi	f	f
16	The physical healing of Christian Science results now, as in Jesus' time, from the operation of divine Principle, before which sin and disease lose their reality in human consciousness and disappear as naturally and as necessarily as darkness gives place to light and sin to reformation. Now, as then, these mighty works are not supernatural, but supremely natural. They are the sign of Immanuel, or "God with us," a divine influence ever present in human consciousness and repeating itself, coming now as was promised aforetime,	2014-03-26 15:12:08.969038	2014-03-26 15:12:08.969038	xi	f	f
17	To preach deliverance to the captives [of sense], And recovering of sight to the blind, To set at liberty them that are bruised.	2014-03-26 15:12:08.976027	2014-03-26 15:12:08.976027	xi	f	f
18	When God called the author to proclaim His Gospel to this age, there came also the charge to plant and water His vineyard.	2014-03-26 15:12:08.982915	2014-03-26 15:12:08.982915	xi	f	f
19	The first school of Christian Science Mind-healing was started by the author with only one student in Lynn, Massachusetts, about the year 1867. In 1881, she opened the Massachusetts Metaphysical College in Boston, under the seal of the Commonwealth, a law relative to colleges having been passed, which enabled her to get this institution chartered for medical purposes. No charters were granted to Christian Scientists for such institutions after 1883, and up to that date, hers was the only College of this character which had been established in the United States, where Christian Science was first introduced.	2014-03-26 15:12:09.069089	2014-03-26 15:12:09.069089	xi	f	f
20	During seven years over four thousand students were taught by the author in this College. Meanwhile she was pastor of the first established Church of Christ, Scientist; President of the first Christian Scientist Association, convening monthly; publisher of her own works; and (for a portion of this time) sole editor and publisher of the Christian Science Journal, the first periodical issued by Christian Scientists. She closed her College, October 29, 1889, in the height of its prosperity with a deep-lying conviction that the next two years of her life should be given to the preparation of the revision of SCIENCE AND HEALTH, which was published in 1891. She retained her charter, and as its President, reopened the College in 1899 as auxiliary to her church. Until June 10, 1907, she had never read this book throughout consecutively in order to elucidate her idealism.	2014-03-26 15:12:09.136786	2014-03-26 15:12:09.136786	xii	f	f
21	In the spirit of Christ's charity, as one who "hopeth all things, endureth all things," and is joyful to bear consolation to the sorrowing and healing to the sick, she commits these pages to honest seekers for Truth.	2014-03-26 15:12:09.141788	2014-03-26 15:12:09.141788	xii	f	f
22	Prayer	2014-03-26 15:12:09.14656	2014-03-26 15:12:09.14656	1	f	t
23	THE prayer that reforms the sinner and heals the sick is an absolute faith that all things are possible to God,-a spiritual understanding of Him, an unselfed love. Regardless of what another may say or think on this subject, I speak from experience. Prayer, watching, and working, combined with self-im-molation, are God's gracious means for accomplishing whatever has been successfully done for the Christianization and health of mankind.	2014-03-26 15:12:09.200796	2014-03-26 15:12:09.200796	1	f	f
24	Thoughts unspoken are not unknown to the divine Mind. Desire is prayer; and no loss can occur from trusting God with our desires, that they may be moulded and exalted before they take form in words and in deeds.	2014-03-26 15:12:09.206588	2014-03-26 15:12:09.206588	1	f	f
25	Right motives	2014-03-26 15:12:09.21229	2014-03-26 15:12:09.21229	1	t	f
26	What are the motives for prayer? Do we pray to make ourselves better or to benefit those who hear us, to enlighten the infinite or to be heard of men? Are we benefited by praying? Yes, the desire which goes forth hungering after righteousness is blessed of our Father, and it does not return unto us void.	2014-03-26 15:12:09.242695	2014-03-26 15:12:09.242695	2	f	f
27	Deity unchangeable	2014-03-26 15:12:09.247728	2014-03-26 15:12:09.247728	2	t	f
28	God is not moved by the breath of praise to do more than He has already done, nor can the infinite do less than bestow all good, since He is unchanging wisdom and Love. We can do more for ourselves by humble fervent petitions, but the All-lov-ing does not grant them simply on the ground of lip-service, for He already knows all.	2014-03-26 15:12:09.32191	2014-03-26 15:12:09.32191	2	f	f
29	Prayer cannot change the Science of being, but it tends to bring us into harmony with it. Goodness attains the demonstration of Truth. A request that God will save us is not all that is required. The mere habit of pleading with the divine Mind, as one pleads with a human being, perpetuates the belief in God as humanly circumscribed,-an error which impedes spiritual growth.	2014-03-26 15:12:09.371912	2014-03-26 15:12:09.371912	2	f	f
30	God's standard	2014-03-26 15:12:09.377421	2014-03-26 15:12:09.377421	2	t	f
31	God is Love. Can we ask Him to be more? God is intelligence. Can we inform the infinite Mind of anything He does not already comprehend? Do we expect to change perfection? Shall we plead for more at the open fount, which is pouring forth more than we accept? The unspoken desire does bring us nearer the source of all existence and blessedness.	2014-03-26 15:12:09.399552	2014-03-26 15:12:09.399552	2	f	f
32	Asking God to <em>be</em> God is a vain repetition. God is "the same yesterday, and today, and forever;" and He who is immutably right will do right without being reminded of His province. The wisdom of man is not sufficient to warrant him in advising God.	2014-03-26 15:12:09.423141	2014-03-26 15:12:09.423141	2	f	f
33	The spiritual mathematics	2014-03-26 15:12:09.42933	2014-03-26 15:12:09.42933	3	t	f
34	Who would stand before a blackboard, and pray the principle of mathematics to solve the problem? The rule is already established, and it is our task to work out the solution. Shall we ask the divine Principle of all goodness to do His own work? His work is done, and we have only to avail ourselves of God's rule in order to receive His blessing, which enables us to work out our own salvation.	2014-03-26 15:12:09.440321	2014-03-26 15:12:09.440321	3	f	f
35	The Divine Being must be reflected by man, else man is not the image and likeness of the patient, tender, and true, the One "altogether lovely;" but to understand God is the work of eternity, and demands absolute consecration of thought, energy, and desire.	2014-03-26 15:12:09.451688	2014-03-26 15:12:09.451688	3	f	f
36	Prayerful ingratitude	2014-03-26 15:12:09.459309	2014-03-26 15:12:09.459309	3	t	f
37	How empty are our conceptions of Deity! We admit theoretically that God is good, omnipotent, omnipresent, infinite, and then we try to give information to this infinite Mind. We plead for unmerited pardon and for a liberal outpouring of benefactions. Are we really grateful for the good already received? Then we shall avail ourselves of the blessings we have, and thus be fitted to receive more. Gratitude is much more than a verbal expression of thanks. Action expresses more gratitude than speech.	2014-03-26 15:12:09.492484	2014-03-26 15:12:09.492484	3	f	f
38	If we are ungrateful for Life, Truth, and Love, and yet return thanks to God for all blessings, we are insincere and incur the sharp censure our Master pronounces on hypocrites. In such a case, the only acceptable prayer is to put the finger on the lips and remember our blessings. While the heart is far from divine Truth and Love, we cannot conceal the ingratitude of barren lives.	2014-03-26 15:12:09.540864	2014-03-26 15:12:09.540864	3	f	f
39	Efficacious petitions	2014-03-26 15:12:09.546691	2014-03-26 15:12:09.546691	4	t	f
40	What we most need is the prayer of fervent desire for growth in grace, expressed in patience, meekness, love, and good deeds. To keep the commandments of our Master and follow his example, is our proper debt to him and the only worthy evidence of our gratitude for all that he has done. Outward worship is not of itself sufficient to express loyal and heartfelt gratitude, since he has said: "If ye love me, keep my commandments."	2014-03-26 15:12:09.557373	2014-03-26 15:12:09.557373	4	f	f
41	The habitual struggle to be always good is unceasing prayer. Its motives are made manifest in the blessings they bring,-blessings which, even if not acknowledged in audible words, attest our worthiness to be partakers of Love.	2014-03-26 15:12:09.611826	2014-03-26 15:12:09.611826	4	f	f
42	Watchfulness requisite	2014-03-26 15:12:09.616879	2014-03-26 15:12:09.616879	4	t	f
43	Simply asking that we may love God will never make us love Him; but the longing to be better and holier, expressed in daily watchfulness and in striving to assimilate more of the divine character, will mould and fashion us anew, until we awake in His likeness. We reach the Science of Christianity through demonstration of the divine nature; but in this wicked world goodness will "be evil spoken of," and patience must bring experience.	2014-03-26 15:12:09.645184	2014-03-26 15:12:09.645184	4	f	f
44	Veritable devotion	2014-03-26 15:12:09.652225	2014-03-26 15:12:09.652225	4	t	f
45	Audible prayer can never do the works of spiritual understanding, which regenerates; but silent prayer, watchfulness, and devout obedience enable us to follow Jesus' example. Long prayers, superstition, and creeds clip the strong pinions of love, and clothe religion in human forms. Whatever materializes worship hinders man's spiritual growth and keeps him from demonstrating his power over error.	2014-03-26 15:12:09.669497	2014-03-26 15:12:09.669497	4	f	f
46	Sorrow and reformation	2014-03-26 15:12:09.675122	2014-03-26 15:12:09.675122	5	t	f
47	Sorrow for wrongdoing is but one step towards reform and the very easiest step. The next and great step required by wisdom is the test of our sincerity, namely, reformation. To this end we are placed under the stress of circumstances. Temptation bids us repeat the offence, and woe comes in return for what is done. So it will ever be, till we learn that there is no discount in the law of justice and that we must pay "the uttermost farthing." The measure ye mete "shall be measured to you again," and it will be full "and running over."	2014-03-26 15:12:09.750233	2014-03-26 15:12:09.750233	5	f	f
48	Saints and sinners get their full award, but not always in this world. The followers of Christ drank his cup. Ingratitude and persecution filled it to the brim; but God pours the riches of His love into the understanding and affections, giving us strength according to our day. Sinners flourish "like a green bay tree;" but, looking farther, the Psalmist could see their end, the destruction of sin through suffering.	2014-03-26 15:12:09.792364	2014-03-26 15:12:09.792364	5	f	f
49	Cancellation of human sin	2014-03-26 15:12:09.798658	2014-03-26 15:12:09.798658	5	t	f
50	Prayer is not to be used as a confessional to cancel sin. Such an error would impede true religion. Sin is forgiven only as it is destroyed by Christ, Truth and Life. If prayer nourishes the belief that sin is cancelled, and that man is made better merely by praying, prayer is an evil. He grows worse who continues in sin because he fancies himself forgiven.	2014-03-26 15:12:09.824868	2014-03-26 15:12:09.824868	5	f	f
51	Diabolism destroyed	2014-03-26 15:12:09.830131	2014-03-26 15:12:09.830131	5	t	f
52	An apostle says that the Son of God [Christ] came to "destroy the <em>works</em> of the devil." We should follow our divine Exemplar, and seek the destruction of all evil works, error and disease included. We cannot escape the penalty due for sin. The Scriptures say, that if we deny Christ, "he also will deny us."	2014-03-26 15:12:09.85954	2014-03-26 15:12:09.85954	5	f	f
53	Pardon and amendment	2014-03-26 15:12:09.864944	2014-03-26 15:12:09.864944	6	t	f
54	Divine Love corrects and governs man. Men may pardon, but this divine Principle alone reforms the sinner. God is not separate from the wisdom He bestows. The talents He gives we must improve. Calling on Him to forgive our work badly done or left undone, implies the vain supposition that we have nothing to do but to ask pardon, and that afterwards we shall be free to repeat the offence.	2014-03-26 15:12:09.892127	2014-03-26 15:12:09.892127	6	f	f
55	To cause suffering as the result of sin, is the means of destroying sin. Every supposed pleasure in sin will furnish more than its equivalent of pain, until belief in material life and sin is destroyed. To reach heaven, the harmony of being, we must understand the divine Principle of being.	2014-03-26 15:12:09.900468	2014-03-26 15:12:09.900468	6	f	f
56	Mercy without partiality	2014-03-26 15:12:09.905908	2014-03-26 15:12:09.905908	6	t	f
57	"God is Love." More than this we cannot ask, higher we cannot look, farther we cannot go. To suppose that God forgives or punishes sin according as His mercy is sought or unsought, is to misunderstand Love and to make prayer the safety-valve for wrongdoing.	2014-03-26 15:12:09.975253	2014-03-26 15:12:09.975253	6	f	f
58	Divine severity	2014-03-26 15:12:09.981249	2014-03-26 15:12:09.981249	6	t	f
59	Jesus uncovered and rebuked sin before he cast it out. Of a sick woman he said that Satan had bound her, and to Peter he said, "Thou art an offence unto me." He came teaching and showing men how to destroy sin, sickness, and death. He said of the fruitless tree, "[It] is hewn down."	2014-03-26 15:12:10.001127	2014-03-26 15:12:10.001127	6	f	f
60	It is believed by many that a certain magistrate, who lived in the time of Jesus, left this record: "His rebuke is fearful." The strong language of our Master confirms this description.	2014-03-26 15:12:10.020884	2014-03-26 15:12:10.020884	6	f	f
61	The only civil sentence which he had for error was, "Get thee behind me, Satan." Still stronger evidence that Jesus' reproof was pointed and pungent is found in his own words,-showing the necessity for such forcible utterance, when he cast out devils and healed the sick and sinning. The relinquishment of error deprives material sense of its false claims.	2014-03-26 15:12:10.058919	2014-03-26 15:12:10.058919	7	f	f
62	Audible praying	2014-03-26 15:12:10.064198	2014-03-26 15:12:10.064198	7	t	f
63	Audible prayer is impressive; it gives momentary solemnity and elevation to thought. But does it produce any lasting benefit? Looking deeply into these things, we find that "a zeal . . . not according to knowledge" gives occasion for reaction unfavorable to spiritual growth, sober resolve, and wholesome perception of God's requirements. The motives for verbal prayer may embrace too much love of applause to induce or encourage Christian sentiment.	2014-03-26 15:12:10.112484	2014-03-26 15:12:10.112484	7	f	f
64	Emotional utterances	2014-03-26 15:12:10.11787	2014-03-26 15:12:10.11787	7	t	f
65	Physical sensation, not Soul, produces material ecstasy and emotion. If spiritual sense always guided men, there would grow out of ecstatic moments a higher experience and a better life with more devout self-abnegation and purity. A self-satisfied ventilation of fervent sentiments never makes a Christian. God is not influenced by man. The "di-vine ear" is not an auditory nerve. It is the all-hearing and all-knowing Mind, to whom each need of man is always known and by whom it will be supplied.	2014-03-26 15:12:10.240846	2014-03-26 15:12:10.240846	7	f	f
66	Danger from audible prayer	2014-03-26 15:12:10.250223	2014-03-26 15:12:10.250223	7	t	f
67	The danger from prayer is that it may lead us into temptation. By it we may become involuntary hypocrites, uttering desires which are not real and consoling ourselves in the midst of sin with the recollection that we have prayed over it or mean to ask forgiveness at some later day. Hypocrisy is fatal to religion.	2014-03-26 15:12:10.311947	2014-03-26 15:12:10.311947	7	f	f
68	A wordy prayer may afford a quiet sense of self-justification, though it makes the sinner a hypocrite. We never need to despair of an honest heart; but there is little hope for those who come only spasmodically face to face with their wickedness and then seek to hide it. Their prayers are indexes which do not correspond with their character. They hold secret fellowship with sin, and such externals are spoken of by Jesus as "like unto whited sepulchres . . . full . . . of all uncleanness."	2014-03-26 15:12:10.357016	2014-03-26 15:12:10.357016	8	f	f
69	Aspiration and love	2014-03-26 15:12:10.368127	2014-03-26 15:12:10.368127	8	t	f
70	If a man, though apparently fervent and prayerful, is impure and therefore insincere, what must be the comment upon him? If he reached the loftiness of his prayer, there would be no occasion for comment. If we feel the aspiration, humility, gratitude, and love which our words express,-this God accepts; and it is wise not to try to deceive ourselves or others, for "there is nothing covered that shall not be revealed." Professions and audible prayers are like charity in one respect,-they "cover the multitude of sins." Praying for humility with whatever fervency of expression does not always mean a desire for it. If we turn away from the poor, we are not ready to receive the reward of Him who blesses the poor. We confess to having a very wicked heart and ask that it may be laid bare before us, but do we not already know more of this heart than we are willing to have our neighbor see?	2014-03-26 15:12:10.476681	2014-03-26 15:12:10.476681	8	f	f
71	Searching the heart	2014-03-26 15:12:10.483868	2014-03-26 15:12:10.483868	8	t	f
72	We should examine ourselves and learn what is the affection and purpose of the heart, for in this way only can we learn what we honestly are. If a friend informs us of a fault, do we listen patiently to the rebuke and credit what is said? Do we not rather give thanks that we are "not as other men"? During many years the author has been most grateful for merited rebuke. The wrong lies in unmerited cen-sure,-in the falsehood which does no one any good.	2014-03-26 15:12:10.53335	2014-03-26 15:12:10.53335	8	f	f
73	Summit of aspiration	2014-03-26 15:12:10.542872	2014-03-26 15:12:10.542872	9	t	f
74	The test of all prayer lies in the answer to these questions: Do we love our neighbor better because of this asking? Do we pursue the old selfishness, satisfied with having prayed for something better, though we give no evidence of the sincerity of our requests by living consistently with our prayer? If selfishness has given place to kindness, we shall regard our neighbor unselfishly, and bless them that curse us; but we shall never meet this great duty simply by asking that it may be done. There is a cross to be taken up before we can enjoy the fruition of our hope and faith.	2014-03-26 15:12:10.612738	2014-03-26 15:12:10.612738	9	f	f
75	Practical religion	2014-03-26 15:12:10.61961	2014-03-26 15:12:10.61961	9	t	f
76	Dost thou "love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind"? This command includes much, even the surrender of all merely material sensation, affection, and worship. This is the El Dorado of Christianity. It involves the Science of Life, and recognizes only the divine control of Spirit, in which Soul is our master, and material sense and human will have no place.	2014-03-26 15:12:10.648008	2014-03-26 15:12:10.648008	9	f	f
77	The chalice sacrificial	2014-03-26 15:12:10.654066	2014-03-26 15:12:10.654066	9	t	f
78	Are you willing to leave all for Christ, for Truth, and so be counted among sinners? No! Do you really desire to attain this point? No! Then why make long prayers about it and ask to be Christians, since you do not care to tread in the footsteps of our dear Master? If unwilling to follow his example, why pray with the lips that you may be partakers of his nature? Consistent prayer is the desire to do right. Prayer means that we desire to walk and will walk in the light so far as we receive it, even though with bleeding footsteps, and that waiting patiently on the Lord, we will leave our real desires to be rewarded by Him.	2014-03-26 15:12:10.663973	2014-03-26 15:12:10.663973	9	f	f
79	The world must grow to the spiritual understanding of prayer. If good enough to profit by Jesus' cup of earthly sorrows, God will sustain us under these sorrows. Until we are thus divinely qualified and are willing to drink his cup, millions of vain repetitions will never pour into prayer the unction of Spirit in demonstration of power and "with signs following." Christian Science reveals a necessity for overcoming the world, the flesh, and evil, and thus destroying all error.	2014-03-26 15:12:10.691897	2014-03-26 15:12:10.691897	10	f	f
80	Seeking is not sufficient. It is striving that enables us to enter. Spiritual attainments open the door to a higher understanding of the divine Life.	2014-03-26 15:12:10.697462	2014-03-26 15:12:10.697462	10	f	f
81	Perfunctory prayers	2014-03-26 15:12:10.708861	2014-03-26 15:12:10.708861	10	t	f
82	One of the forms of worship in Thibet is to carry a praying-machine through the streets, and stop at the doors to earn a penny by grinding out a prayer. But the advance guard of progress has paid for the privilege of prayer the price of persecution.	2014-03-26 15:12:10.736431	2014-03-26 15:12:10.736431	10	f	f
83	Asking amiss	2014-03-26 15:12:10.743449	2014-03-26 15:12:10.743449	10	t	f
84	Experience teaches us that we do not always receive the blessings we ask for in prayer. There is some misapprehension of the source and means of all goodness and blessedness, or we should certainly receive that for which we ask. The Scriptures say: "Ye ask, and receive not, because ye ask amiss, that ye may consume it upon your lusts." That which we desire and for which we ask, it is not always best for us to receive. In this case infinite Love will not grant the request. Do you ask wisdom to be merciful and not to punish sin? Then "ye ask amiss." Without punishment, sin would multiply. Jesus' prayer, "Forgive us our debts," specified also the terms of forgiveness. When forgiving the adulterous woman he said, "Go, and sin no more."	2014-03-26 15:12:10.792483	2014-03-26 15:12:10.792483	10	f	f
85	Remission of penalty	2014-03-26 15:12:10.797547	2014-03-26 15:12:10.797547	11	t	f
86	A magistrate sometimes remits the penalty, but this may be no moral benefit to the criminal, and at best, it only saves the criminal from one form of punishment. The moral law, which has the right to acquit or condemn, always demands restitution before mortals can "go up higher." Broken law brings penalty in order to compel this progress.	2014-03-26 15:12:10.818282	2014-03-26 15:12:10.818282	11	f	f
87	Truth annihilates error	2014-03-26 15:12:10.824538	2014-03-26 15:12:10.824538	11	t	f
88	Mere legal pardon (and there is no other, for divine Principle never pardons our sins or mistakes till they are corrected) leaves the offender free to repeat the offence, if indeed, he has not already suffered sufficiently from vice to make him turn from it with loathing. Truth bestows no pardon upon error, but wipes it out in the most effectual manner. Jesus suffered for our sins, not to annul the divine sentence for an individual's sin, but because sin brings inevitable suffering.	2014-03-26 15:12:10.855609	2014-03-26 15:12:10.855609	11	f	f
89	Desire for holiness	2014-03-26 15:12:10.91159	2014-03-26 15:12:10.91159	11	t	f
90	Petitions bring to mortals only the results of mor-tals' own faith. We know that a desire for holiness is requisite in order to gain holiness; but if we desire holiness above all else, we shall sacrifice everything for it. We must be willing to do this, that we may walk securely in the only practical road to holiness. Prayer cannot change the unalterable Truth, nor can prayer alone give us an understanding of Truth; but prayer, coupled with a fervent habitual desire to know and do the will of God, will bring us into all Truth. Such a desire has little need of audible expression. It is best expressed in thought and in life.	2014-03-26 15:12:10.954349	2014-03-26 15:12:10.954349	11	f	f
91	Prayer for the sick	2014-03-26 15:12:10.960416	2014-03-26 15:12:10.960416	11	t	f
114	A great sacrifice of material things must precede this advanced spiritual understanding. The highest prayer is not one of faith merely; it is demonstration. Such prayer heals sickness, and must destroy sin and death. It distinguishes between Truth that is sinless and the falsity of sinful sense.	2014-03-26 15:12:11.53894	2014-03-26 15:12:11.53894	16	f	f
115	The prayer of Jesus Christ	2014-03-26 15:12:11.547113	2014-03-26 15:12:11.547113	16	t	f
92	"The prayer of faith shall save the sick," says the Scripture. What is this healing prayer? A mere request that God will heal the sick has no power to gain more of the divine presence than is always at hand. The beneficial effect of such prayer for the sick is on the human mind, making it act more powerfully on the body through a blind faith in God. This, however, is one belief casting out another, a belief in the unknown casting out a belief in sickness. It is neither Science nor Truth which acts through blind belief, nor is it the human understanding of the divine healing Principle as manifested in Jesus, whose humble prayers were deep and conscientious protests of Truth, of man's likeness to God and of man's unity with Truth and Love.	2014-03-26 15:12:11.024827	2014-03-26 15:12:11.024827	12	f	f
93	Prayer to a corporeal God affects the sick like a drug, which has no efficacy of its own but borrows its power from human faith and belief. The drug does nothing, because it has no intelligence. It is a mortal belief, not divine Principle or Love, which causes a drug to be apparently either poisonous or sanative.	2014-03-26 15:12:11.039663	2014-03-26 15:12:11.039663	12	f	f
94	The common custom of praying for the recovery of the sick finds help in blind belief, whereas help should come from the enlightened understanding. Changes in belief may go on indefinitely, but they are the merchandise of human thought and not the outgrowth of divine Science.	2014-03-26 15:12:11.045861	2014-03-26 15:12:11.045861	12	f	f
95	Love impartial and universal	2014-03-26 15:12:11.050501	2014-03-26 15:12:11.050501	12	t	f
96	Does Deity interpose in behalf of one worshipper, and not help another who offers the same measure of prayer? If the sick recover because they pray or are prayed for audibly, only petitioners (<em>per se</em> or by proxy) should get well. In divine Science, where prayers are mental, <em>all</em> may avail themselves of God as "a very present help in trouble." Love is impartial and universal in its adaptation and bestowals. It is the open fount which cries, "Ho, every one that thirsteth, come ye to the waters."	2014-03-26 15:12:11.093207	2014-03-26 15:12:11.093207	12	f	f
97	Public exaggerations	2014-03-26 15:12:11.099767	2014-03-26 15:12:11.099767	13	t	f
98	In public prayer we often go beyond our convictions, beyond the honest standpoint of fervent desire. If we are not secretly yearning and openly striving for the accomplishment of all we ask, our prayers are "vain repetitions," such as the heathen use. If our petitions are sincere, we labor for what we ask; and our Father, who seeth in secret, will reward us openly. Can the mere public expression of our desires increase them? Do we gain the omnipotent ear sooner by words than by thoughts? Even if prayer is sincere, God knows our need before we tell Him or our fellow-beings about it. If we cherish the desire honestly and silently and humbly, God will bless it, and we shall incur less risk of overwhelming our real wishes with a torrent of words.	2014-03-26 15:12:11.15665	2014-03-26 15:12:11.15665	13	f	f
99	Corporeal ignorance	2014-03-26 15:12:11.162025	2014-03-26 15:12:11.162025	13	t	f
100	If we pray to God as a corporeal person, this will prevent us from relinquishing the human doubts and fears which attend such a belief, and so we cannot grasp the wonders wrought by infinite, incorporeal Love, to whom all things are possible. Because of human ignorance of the divine Principle, Love, the Father of all is represented as a corporeal creator; hence men recognize themselves as merely physical, and are ignorant of man as God's image or reflection and of man's eternal incorporeal existence. The world of error is ignorant of the world of Truth, blind to the reality of man's existence, for the world of sensation is not cognizant of life in Soul, not in body.	2014-03-26 15:12:11.229957	2014-03-26 15:12:11.229957	13	f	f
101	Bodily presence	2014-03-26 15:12:11.240055	2014-03-26 15:12:11.240055	13	t	f
102	If we are sensibly with the body and regard omnipotence as a corporeal, material person, whose ear we would gain, we are not "absent from the body" and "present with the Lord" in the demonstration of Spirit. We cannot "serve two mas-ters." To be "present with the Lord" is to have, not mere emotional ecstasy or faith, but the actual demonstration and understanding of Life as revealed in Christian Science. To be "with the Lord" is to be in obedience to the law of God, to be absolutely governed by divine Love,-by Spirit, not by matter.	2014-03-26 15:12:11.312773	2014-03-26 15:12:11.312773	14	f	f
103	Spiritualized consciousness	2014-03-26 15:12:11.318971	2014-03-26 15:12:11.318971	14	t	f
104	Become conscious for a single moment that Life and intelligence are purely spiritual, neither in nor of matter, and the body will then utter no complaints. If suffering from a belief in sickness, you will find yourself suddenly well. Sorrow is turned into joy when the body is controlled by spiritual Life, Truth, and Love. Hence the hope of the promise Jesus bestows: "He that believeth on me, the works that I do shall he do also; . . . because I go unto my Father," -[because the Ego is absent from the body, and present with Truth and Love.] The Lord's Prayer is the prayer of Soul, not of material sense.	2014-03-26 15:12:11.377542	2014-03-26 15:12:11.377542	14	f	f
105	Entirely separate from the belief and dream of material living, is the Life divine, revealing spiritual understanding and the consciousness of man's dominion over the whole earth. This understanding casts out error and heals the sick, and with it you can speak "as one having authority."	2014-03-26 15:12:11.420626	2014-03-26 15:12:11.420626	14	f	f
106	"When thou prayest, enter into thy closet, and, when thou hast shut thy door, pray to thy Father which is in secret; and thy Father, which seeth in secret, shall reward thee openly."	2014-03-26 15:12:11.432325	2014-03-26 15:12:11.432325	14	f	f
107	Spiritual sanctuary	2014-03-26 15:12:11.438408	2014-03-26 15:12:11.438408	15	t	f
108	So spake Jesus. The closet typifies the sanctuary of Spirit, the door of which shuts out sinful sense but lets in Truth, Life, and Love. Closed to error, it is open to Truth, and <em>vice versa</em>. The Father in secret is unseen to the physical senses, but He knows all things and rewards according to motives, not according to speech. To enter into the heart of prayer, the door of the erring senses must be closed. Lips must be mute and materialism silent, that man may have audience with Spirit, the divine Principle, Love, which destroys all error.	2014-03-26 15:12:11.44417	2014-03-26 15:12:11.44417	15	f	f
109	Effectual invocation	2014-03-26 15:12:11.450826	2014-03-26 15:12:11.450826	15	t	f
110	In order to pray aright, we must enter into the closet and shut the door. We must close the lips and silence the material senses. In the quiet sanctuary of earnest longings, we must deny sin and plead God's allness. We must resolve to take up the cross, and go forth with honest hearts to work and watch for wisdom, Truth, and Love. We must "pray without ceasing." Such prayer is answered, in so far as we put our desires into practice. The Master's injunction is, that we pray in secret and let our lives attest our sincerity.	2014-03-26 15:12:11.458301	2014-03-26 15:12:11.458301	15	f	f
111	Trustworthy beneficence	2014-03-26 15:12:11.463291	2014-03-26 15:12:11.463291	15	t	f
112	Christians rejoice in secret beauty and bounty, hidden from the world, but known to God. Self-forgetfulness, purity, and affection are constant prayers. Practice not profession, understanding not belief, gain the ear and right hand of omnipotence and they assuredly call down infinite blessings. Trustworthiness is the foundation of enlightened faith. Without a fitness for holiness, we cannot receive holiness.	2014-03-26 15:12:11.513666	2014-03-26 15:12:11.513666	15	f	f
113	Loftiest adoration	2014-03-26 15:12:11.523243	2014-03-26 15:12:11.523243	15	t	f
116	Our Master taught his disciples one brief prayer, which we name after him the Lord's Prayer. Our Master said, "After this manner therefore pray ye," and then he gave that prayer which covers all human needs. There is indeed some doubt among Bible scholars, whether the last line is not an addition to the prayer by a later copyist; but this does not affect the meaning of the prayer itself.	2014-03-26 15:12:11.565939	2014-03-26 15:12:11.565939	16	f	f
117	In the phrase, "Deliver us from evil," the original properly reads, "Deliver us from the evil one." This reading strengthens our scientific apprehension of the petition, for Christian Science teaches us that "the evil one," or one evil, is but another name for the first lie and all liars.	2014-03-26 15:12:11.59617	2014-03-26 15:12:11.59617	16	f	f
118	Only as we rise above all material sensuousness and sin, can we reach the heaven-born aspiration and spiritual consciousness, which is indicated in the Lord's Prayer and which instantaneously heals the sick. Here let me give what I understand to be the spiritual sense of the Lord's Prayer:	2014-03-26 15:12:11.667665	2014-03-26 15:12:11.667665	16	f	f
119	Our Father which art in heaven, <em>Our Father-Mother God, all-harmonious</em>,	2014-03-26 15:12:11.743627	2014-03-26 15:12:11.743627	16	f	f
120	Hallowed be Thy name. <em>Adorable One.</em>	2014-03-26 15:12:11.750044	2014-03-26 15:12:11.750044	16	f	f
121	Thy kingdom come. <em>Thy kingdom is come; Thou art ever-present.</em>	2014-03-26 15:12:11.791088	2014-03-26 15:12:11.791088	16	f	f
122	Thy will be done in earth, as it is in heaven. <em>Enable us to know,-as in heaven, so on earth,-God is omnipotent, supreme</em>.	2014-03-26 15:12:11.843383	2014-03-26 15:12:11.843383	17	f	f
123	Give us this day our daily bread; <em>Give us grace for today; feed the famished affections;</em>	2014-03-26 15:12:11.877073	2014-03-26 15:12:11.877073	17	f	f
124	And forgive us our debts, as we forgive our debtors. <em>And Love is reflected in love;</em>	2014-03-26 15:12:11.885354	2014-03-26 15:12:11.885354	17	f	f
125	And lead us not into temptation, but deliver us from evil; <em>And God leadeth us not into temptation, but delivereth us from sin, disease, and death.</em>	2014-03-26 15:12:11.892234	2014-03-26 15:12:11.892234	17	f	f
126	For Thine is the kingdom, and the power, and the glory, forever. <em>For God is infinite, all-power, all Life, Truth, Love, over all, and All.</em>	2014-03-26 15:12:11.921768	2014-03-26 15:12:11.921768	17	f	f
127	Divine oneness	2014-03-26 15:12:11.92936	2014-03-26 15:12:11.92936	17	t	f
128	Atonement and Eucharist	2014-03-26 15:12:11.935575	2014-03-26 15:12:11.935575	18	f	t
129	ATONEMENT is the exemplification of man's unity with God, whereby man reflects divine Truth, Life, and Love. Jesus of Nazareth taught and demonstrated man's oneness with the Father, and for this we owe him endless homage. His mission was both individual and collective. He did life's work aright not only in justice to himself, but in mercy to mortals,-to show them how to do theirs, but not to do it for them nor to relieve them of a single responsibility. Jesus acted boldly, against the accredited evidence of the senses, against Pharisaical creeds and practices, and he refuted all opponents with his healing power.	2014-03-26 15:12:12.0018	2014-03-26 15:12:12.0018	18	f	f
130	Human reconciliation	2014-03-26 15:12:12.009153	2014-03-26 15:12:12.009153	18	t	f
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: fhftsxiohdoauj
--

COPY public.schema_migrations (version) FROM stdin;
20140226042613
20131215000012
20140205030956
20140209234217
20140205044317
20131214231852
20131215053721
20140205043835
20140205052009
20131214211512
20131223060306
20140312033948
\.


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: fhftsxiohdoauj
--

COPY public.translations (id, phrase_id, locale, translation, created_at, updated_at, user_id) FROM stdin;
1	1	zh	前言	2014-03-26 15:12:12.374176	2014-03-26 15:12:12.374176	1
2	2	zh	对于那些靠在维持无限，今天是大祝福。该清醒牧人必见昏头梁晨，ERE来到一个复活日的全部光芒。照这样苍白明星先知 - 牧羊人，然而它走过的夜晚，来到那里，在默默无闻怀抱，打好伯利恒贝贝，基督，真理的人的使者，谁会让平原愚昧通过了解救恩的道路基督耶稣里，直到整个错误的晚上应该黎明早晨横梁和闪耀的作为指路明灯。伟男子被带往见，并遵循这一晨星神圣的科学的照明方式，以永恒的和谐。	2014-03-26 15:12:12.390497	2014-03-26 15:12:12.390497	1
3	3	zh	时间思想家已经到来。真理，独立的理论和历史悠久的制度，敲在人类的门户。知足与过去和唯物主义的冷套子正在崩溃了。神的无知不再是垫脚石信心。服从的唯一保证是他的权利忐忑谁知道正确地就是永生。虽然帝国下跌，“耶和华必作王，直到永远。”	2014-03-26 15:12:12.405513	2014-03-26 15:12:12.405513	1
4	4	zh	一本书引入了新的想法，但它不能使他们迅速了解。它是坚固的先驱任务砍伐高大的橡树和切割粗糙的花岗岩。未来的时代必须声明一下的先驱已经完成。	2014-03-26 15:12:12.413491	2014-03-26 15:12:12.413491	1
5	5	zh	由于真理的威力在疾病的治疗作者的发现，以及罪，她的系统已经全面测试，并没有被发现自己的不足，但要达到基督教科学的高峰，人必须生活在服从其神圣原则。要发展这种科学的全部威力，的肉体意义上的龃龉必须让位给的精神意义上的和谐，甚至音乐的科学纠正错误的色调和给人甜美和谐的声音。	2014-03-26 15:12:12.426974	2014-03-26 15:12:12.426974	1
6	6	zh	神学和物理学教授，无论精神和物质是真实的，良好的，而事实是，精神是好的，真实的，不论是精神的对面。现在的问题，什么是真理，是示范回答，通过医治两个疾病和罪孽，并演示表明，基督教愈合赋予最健康，使最好的男人。在此基础上基督教科学将有一个公平的战斗。疾病已经打击了几个世纪使用的材料补救医生，但问题出现了，是因为这些从业者有少生病？一场轰轰烈烈的“无”是从两个合生事实，Antediluvians的知名长寿，并迅速繁殖和疾病，因为洪水增加的暴力推论的响应。	2014-03-26 15:12:12.438298	2014-03-26 15:12:12.438298	1
7	7	zh	在笔者的工作，回顾与反思，可能会发现一个传略，叙述的经历，导致了她，在1866年，以她以基督教科学系统的发现。早在1862年，她开始写下来，送给朋友她的圣经研究的结果，因为圣经是她唯一的老师，但这些组合物是粗糙的，一个孩子在精神的新发现世界的第一步。	2014-03-26 15:12:12.449448	2014-03-26 15:12:12.449448	1
8	8	zh	她也开始记下她的主体思想，但这些随笔是真理的唯一小儿lispings。通过眼睛在向外世界孩子喝自喜的草案。他是为确保世界的存在，因为他是他自己的，但他无法用语言形容的世界。他发现了几句话，并与这些他stammeringly试图传达自己的感受。后来，舌头的配音更明确的想法，但仍然不完善。	2014-03-26 15:12:12.457915	2014-03-26 15:12:12.457915	1
9	9	zh	因此，它是与作者。由于某某诗人说自己，她“lisped的数字，这些数字就来了。”写在该早日某些散文仍然在她的第一个学生之间循环;但他们微弱的尝试陈述原则和基督教愈合的做法，而不是真理，也不完全令人满意的论述。今天，虽然欣喜于一些进展，她仍然觉得自己是一个愿意弟子在天门，等待着基督的心。	2014-03-26 15:12:12.479993	2014-03-26 15:12:12.479993	1
10	10	zh	基督教科学了她的第一本小册子是受版权保护的1870年，但它并没有出现在打印，直到1876年，她已知道这个科学必须愈合证明，关于这一主题的工作可以获利前研究。从1867年直到1875年，但复制人，在友好的循环。	2014-03-26 15:12:12.495495	2014-03-26 15:12:12.495495	1
11	11	zh	在写这部作品，科学和健康，她做了圣经的论述大量的笔记，它一直没有被公开。这是在1867年和1868。这些努力显示出巨大的生命问题了，她比较无知到了那个时候，和她来了在长度，其解决的程度，但她重视他们作为父母可以珍惜孩子的成长的纪念，而她也不会让他们改变。	2014-03-26 15:12:12.519732	2014-03-26 15:12:12.519732	1
12	12	zh	的科学和健康的第一版出版于1875年。在心理治疗的各种书籍，至今已发出，他们大多不正确的理论，充满了从科学和健康剽窃。他们认为人的心灵的愈合剂，而这种精神是不是基督教科学原理的一个因素。几本书，不过，这是基于这本书，是有用的。	2014-03-26 15:12:12.534422	2014-03-26 15:12:12.534422	1
13	13	zh	笔者并无损害良心，以适应思想的总漂移，但说穿了，诚实地给出真相的文字。她没有作出任何努力美化，语焉不详，或治疗的全部细节，以便无限的主题。数千愈合良好验证的情况下，她和她的学生们证明了她的教诲的价值。这些案件大部分都被遗弃的绝望通过正规的医疗服务员。很少有残疾人将转向神，直到所有的物理支撑已经失败，因为有那么一点信心，他的性格和力量治愈疾病。	2014-03-26 15:12:12.544451	2014-03-26 15:12:12.544451	1
14	14	zh	愈合的神圣原则被证明的真理的任何真诚的寻求者的个人经验。它的目的是好的，它的做法是更安全和更有效的比任何其他的卫生方法。不偏不倚的基督教思想是最快的感动真相，并深信它。只有那些和她吵架，谁不明白她的意思，还是挑剔的道理，方法来不是要轻，以免他们的作品受到谴责。没有智力水平是必要的学习者，但健全的道德是最可取的。	2014-03-26 15:12:12.555882	2014-03-26 15:12:12.555882	1
15	15	zh	许多想像，在基督教科学治病强身的现象，目前只有一个阶段的人类心灵的作用，在一些无法解释的方式导致疾病的治愈而行动。相反，基督教科学合理地解释说，所有其他病理方法是人类信仰的物质成果没有精神，信仰在运作，但肉体的头脑必须屈服于科学。	2014-03-26 15:12:12.563988	2014-03-26 15:12:12.563988	1
16	16	zh	基督教科学的物理治疗现在的结果，如在耶稣的时代，从神圣的原则运作，其前罪和疾病失去了现实中人类意识和消失的自然和必然的黑暗给了地方，光线和罪恶，以改革。现在，正如当时，异能不是超自然的，但千钧自然。他们以马内利的标志，或“神与我们同，”神圣的影响力永远存在于人的意识和重演，现在来作为素常所承诺，	2014-03-26 15:12:12.571962	2014-03-26 15:12:12.571962	1
17	17	zh	宣讲拯救到[感]俘虏和恢复的瞎眼的得看见，要他们释放了被撞伤。	2014-03-26 15:12:12.590153	2014-03-26 15:12:12.590153	1
18	18	zh	当神呼召笔者宣讲他的福音到了这个年龄，有也来种植和浇灌他的葡萄园充电。	2014-03-26 15:12:12.604281	2014-03-26 15:12:12.604281	1
19	19	zh	基督教科学精神愈合的第一所学校开始由作者只有一个学生在林恩，马萨诸塞州，大约1867年。 1881年，她开了马萨诸塞州的形而上学学院在波士顿，在英联邦，法律相对于一个大学已获通过，这使她得到这个特许用于医疗目的的印章。无租约被1883年后授予的基督徒科学家对这类机构，以及截至该日期，她为这个角色而成立于美国，在那里首次引入基督教科学的唯一学院。	2014-03-26 15:12:12.611794	2014-03-26 15:12:12.611794	1
20	20	zh	在7年超过4000名学生通过笔者在此学院任教。同时她是基督，科学家第一次建立教会的牧师;第一基督徒科学家协会主席，每月召开;她自己的作品出版，以及（对于这个时间的部分）唯一的基督教科学杂志编辑兼发行人，由基督教科学家们发出的第一个定期。她闭上了学院，1889年10月29日，在其与未来两年她的生活应给予科学和健康，这是发表在1891年修订的编制一个深埋的信念繁​​荣的高度。她保留了她的章程，并作为其总统，重新打开该学院于1899年作为辅助，以她的教会。直到1907年6月10日，她从来没有在整个连续以澄清她的理想主义阅读这本书。	2014-03-26 15:12:12.620177	2014-03-26 15:12:12.620177	1
21	21	zh	在基督的慈善精神，作为一个谁“hopeth所有的事情，忍受所有的事情，”并且是快乐的承受安慰伤心的和医治病人，也是犯这些网页，以诚实的求职者的真相。	2014-03-26 15:12:12.628736	2014-03-26 15:12:12.628736	1
22	22	zh	祷告	2014-03-26 15:12:12.637684	2014-03-26 15:12:12.637684	1
23	23	zh	祷告是改革的罪人，医治病人是一个绝对的信心，所有的事情都是可能的神， - 精神理解他，一个unselfed爱。不管什么其他可以说还是觉得在这个问题上，我从经验发言。祈祷，看，和工作，并结合自身的IM-molation，是神对完成任何已为基督教和人类健康已成功完成亲切的手段。	2014-03-26 15:12:12.64586	2014-03-26 15:12:12.64586	1
24	24	zh	潜思考是不是未知的神圣心灵。愿望是祈祷，并没有损失可能发生在相信神与我们的愿望，他们可以模制，他们在言语和行动中采取的形式之前，尊崇。	2014-03-26 15:12:12.655819	2014-03-26 15:12:12.655819	1
25	25	zh	正确的动机	2014-03-26 15:12:12.668825	2014-03-26 15:12:12.668825	1
26	26	zh	什么是动机祷告？我们祈祷，使自己更好的，或有利于那些谁听我们，启迪无限或将要听到的男人吗？我们是否受惠于祈祷？是的，肚里义后提出饥渴的欲望是祝福我们的父亲，并且它不返回到我们那里作废。	2014-03-26 15:12:12.684437	2014-03-26 15:12:12.684437	1
27	27	zh	神不变	2014-03-26 15:12:12.692069	2014-03-26 15:12:12.692069	1
28	28	zh	上帝不被赞美的口气做多，他已经做好了感动，也可以无限做小于若将所有的好，因为他是不变的智慧和爱。我们可以为自己做更多的由卑微热切请愿，但全LOV-ING不授予他们只是在口头上的理由，因为他已经知道一切。	2014-03-26 15:12:12.699199	2014-03-26 15:12:12.699199	1
29	29	zh	祷告不能改变的是科学，但它往往把我们带进和睦相处。善良达到真理的论证。请求上帝会来救我们是不是需要所有。与神祈求心灵的纯粹的习惯，为一个恳求一个人，延续了对上帝的信仰以不可思议界限清楚，安而妨碍属灵成长的错误。	2014-03-26 15:12:12.707574	2014-03-26 15:12:12.707574	1
30	30	zh	神的标准	2014-03-26 15:12:12.714706	2014-03-26 15:12:12.714706	1
31	31	zh	上帝是爱。我们可以问他要多？上帝是智慧。我们能否告知什么，他已经不理解无限的心灵？我们期望改变的完美？难道我们恳求更多的开放源泉，这是倾泻着比我们更接受？潜欲望确实给我们带来更接近的一切存在和幸福的源泉。	2014-03-26 15:12:12.734198	2014-03-26 15:12:12.734198	1
32	32	zh	求神<EM>是</ em>的上帝是一个无谓的重复。上帝是“相同的昨天，今天和永远”，以及他是谁一成不变权将做对没有被提醒他省。人的智慧是不够的，以保证他建议神。	2014-03-26 15:12:12.74641	2014-03-26 15:12:12.74641	1
33	33	zh	灵数学	2014-03-26 15:12:12.756974	2014-03-26 15:12:12.756974	1
34	34	zh	谁也站在黑板前，祈求数学原理来解决这个问题？该规则已经建立，这是我们的任务是制定出解决方案。应我们要求所有的善良做自己工作的神圣原则？他的工作就完成了，而我们只有利用自己神的统治才能收到他的祝福，这使我们能够制定出我们自己的救赎。	2014-03-26 15:12:12.76823	2014-03-26 15:12:12.76823	1
35	35	zh	神的存在必须由人来体现，否则男人不是病人的形象和样式，嫩，真，诚勿扰“全然可爱，”但要明白神是永恒的工作，并要求思想绝对的奉献，能源和欲望。	2014-03-26 15:12:12.78606	2014-03-26 15:12:12.78606	1
36	36	zh	虔诚的忘恩负义	2014-03-26 15:12:12.806575	2014-03-26 15:12:12.806575	1
37	37	zh	如何空是我们的神的观念！我们承认，从理论上说上帝是好的，无所不能，无所不在的，无限的，那么我们就尽量给信息到这个无限的心灵。我们恳求赦免不配和善行的一个自由流露。难道我们真的感谢好已经收到？然后，我们将利用我们自己，我们有祝福的，因而被安装接收更多。感恩是不是感谢的言语表达能力等等。行动表达比言语更感激之情。	2014-03-26 15:12:12.818843	2014-03-26 15:12:12.818843	1
38	38	zh	如果我们是忘恩负义的生命，真理和爱，但返回感谢上帝所有的祝福，我们是言不由衷，并产生了尖锐的谴责我们的主宣告的伪君子。在这种情况下，唯一可以接受的祷告是把手指放在嘴唇，记得我们的祝福。而心脏是远离神的真理和爱，我们不能隐瞒贫瘠生活的忘恩负义。	2014-03-26 15:12:12.832625	2014-03-26 15:12:12.832625	1
39	39	zh	有效的请愿书	2014-03-26 15:12:12.847754	2014-03-26 15:12:12.847754	1
40	40	zh	我们最需要的是热烈地追求在恩典中成长的祈祷，表示忍耐，温柔，爱和善行。为了保持我们的主的诫命，并以他为榜样，是我们正确的债务给他，我们感谢所​​有他做的唯一有价值的证据。向外崇拜是不是本身并不足以表达忠诚和衷心的感谢，因为他说：“你们若爱我，就必遵守我的命令”	2014-03-26 15:12:12.86208	2014-03-26 15:12:12.86208	1
41	41	zh	习惯性的斗争，永远是好不断祈祷。其动机是在祝福显明他们带来的， - 祝福的，即使在发声的话不承认，证明我们老有所为爱有分。	2014-03-26 15:12:12.870824	2014-03-26 15:12:12.870824	1
42	42	zh	必要的警觉	2014-03-26 15:12:12.880881	2014-03-26 15:12:12.880881	1
43	43	zh	只是要求我们在爱上帝不会让我们爱他，但渴望得到更好的和更神圣，表现在日常警觉，并在努力吸收更多的神性的，将塑造和时尚我们认识，直到我们醒在他的神似。我们通过示范的神性达到了基督教的科学，但在这邪恶的世界的善良会“被毁谤”，并耐心一定要把经验。	2014-03-26 15:12:12.893188	2014-03-26 15:12:12.893188	1
44	44	zh	名副其实的奉献	2014-03-26 15:12:12.907591	2014-03-26 15:12:12.907591	1
45	45	zh	有声祈祷永远做不到的心灵的默契，这再生工程，但默默的祈祷，警觉，并虔诚的服从让我们跟随耶稣的榜样。很长的祷告，迷信和教条夹爱的强烈齿轮，穿暖宗教在人类形式。无论物化崇拜阻碍人的精神成长和不断从他展示他的力量在错误。	2014-03-26 15:12:12.928722	2014-03-26 15:12:12.928722	1
46	46	zh	悲伤和改革	2014-03-26 15:12:12.954826	2014-03-26 15:12:12.954826	1
126	126	zh	为你的是英国和权力，荣耀，直到永远。的<em>因为神是无限的，所有的功耗，所有的人生，真理，爱，对所有和全部。</ em>的	2014-03-26 15:12:13.947051	2014-03-26 15:12:13.947051	1
127	127	zh	神合一	2014-03-26 15:12:13.961216	2014-03-26 15:12:13.961216	1
128	128	zh	赎罪和感恩祭	2014-03-26 15:12:13.96885	2014-03-26 15:12:13.96885	1
132	3	\N	  对思考者的时机已经到来。	2016-01-25 04:27:33.116643	2016-01-25 04:27:33.116643	3
47	47	zh	悲哀的是不法行为，但对改革的非常简单的一步一步。由智慧所要求的下一个和伟大的一步是我们的诚意，即改革的考验。为此，我们放置的情况下的压力。诱惑吩咐我们重复犯罪，荣辱与共来换取做了什么。因此，这将永远是，直到我们知道有一个在正义的法律没有折扣，而且一定要“到极点铜板。”这项措施你们METE“应再次测量你的，”这将是充满“和跑过来。”	2014-03-26 15:12:12.963337	2014-03-26 15:12:12.963337	1
48	48	zh	圣人和罪人得到他们的全奖，但并不总是在这个世界上。基督的信徒喝他一杯。忘恩负义和迫害填充它得满满的，但神倾吐他爱的财富进入的理解和情感，根据我们的日子给我们力量。蓬勃发展的罪人“像一根青翠树，”不过，看得越远，诗人可以通过苦难看见他们的结局，罪恶的破坏。	2014-03-26 15:12:12.975219	2014-03-26 15:12:12.975219	1
49	49	zh	人类的罪取消	2014-03-26 15:12:12.988105	2014-03-26 15:12:12.988105	1
50	50	zh	祷告是不被用来作为一个忏悔取消罪。这样的错误会阻碍真正的宗教。罪恶就赦免只因为它是由基督，真理和生命摧毁。如果祈祷滋养相信罪被取消，而那个男人是祈祷取得了较好的仅仅是，祷告是一个邪恶的。他就会越发严重谁继续犯罪，因为他幻想自己原谅。	2014-03-26 15:12:13.000478	2014-03-26 15:12:13.000478	1
51	51	zh	妖道销毁	2014-03-26 15:12:13.012915	2014-03-26 15:12:13.012915	1
52	52	zh	使徒说，神的儿子（基督）来“消灭的<em>作品</ em>的魔鬼。”我们应该按照我们的神圣的模范，并寻求一切恶行的破坏，包括错误和疾病。我们无法逃避应有的罪罚。圣经说，如果我们否认基督“，他也必不认我们。”	2014-03-26 15:12:13.028051	2014-03-26 15:12:13.028051	1
53	53	zh	赦免和修订	2014-03-26 15:12:13.040992	2014-03-26 15:12:13.040992	1
54	54	zh	神圣的爱纠正和支配的人。男人可能原谅，但这种神圣的原则单独改革的罪人。神不从他赐予的智慧分开。人才他给我们必须提高。要求他原谅我们的工作做得不好或者没有完成，意味着徒劳的假设，我们什么都没有做，只好请原谅，那以后我们就可以自由地重复犯罪。	2014-03-26 15:12:13.053108	2014-03-26 15:12:13.053108	1
55	55	zh	造成的痛苦是罪的结果，是摧毁罪恶的手段。在每一个罪恶快感应该会提供超过等值疼痛，直到确信在物质生活和罪恶被破坏。为了达到天堂，把握存在的和谐，我们必须了解的是神圣的原则。	2014-03-26 15:12:13.068439	2014-03-26 15:12:13.068439	1
56	56	zh	慈悲没有偏见	2014-03-26 15:12:13.082894	2014-03-26 15:12:13.082894	1
57	57	zh	“上帝是爱。”超过这一点，我们不能要求，更高的可以不看，更远，我们不能去。要假设上帝赦免或照他的怜悯寻求一场突发的或惩罚罪恶，是爱的误解，并作出祈祷安全阀的不当行为。	2014-03-26 15:12:13.090232	2014-03-26 15:12:13.090232	1
58	58	zh	神圣的严重程度	2014-03-26 15:12:13.10465	2014-03-26 15:12:13.10465	1
59	59	zh	耶稣揭露和斥责罪之前，他丢在外面。一个生病的女人，他说，撒但约束自己，就对彼得说：“你是对我的罪行。”他来到教学和展示男人如何摧毁罪恶，疾病和死亡。他说，毫无结果的树，“[它]，就砍下来。”	2014-03-26 15:12:13.121551	2014-03-26 15:12:13.121551	1
60	60	zh	据信许多，某县长，谁住在耶稣的时代，离开了这个纪录：“他的斥责是可怕的”我们法师强大的语言证实了这一点说明。	2014-03-26 15:12:13.138323	2014-03-26 15:12:13.138323	1
61	61	zh	唯一的民用一句这是他的错误是，“我后边去吧，撒旦。”还是更强的证据表明耶稣责备指出和刺鼻的是他自己的话说发现，展示的必要性这种强制的话语，当他赶鬼，并医治病人和犯罪。错误的放弃剥夺其虚报材料感。	2014-03-26 15:12:13.14605	2014-03-26 15:12:13.14605	1
62	62	zh	有声祈祷	2014-03-26 15:12:13.154361	2014-03-26 15:12:13.154361	1
63	63	zh	有声祷告是令人印象深刻，它给瞬间严肃性和高度来思考。但它产生任何持久的利益？展望深入到这些事情，我们发现，“有热心......不是按着真知识”给出场合反应不利的心灵成长，清醒的决心，以及上帝的要求有益健康的看法。的动机口头祈祷会拥抱爱的太多掌声诱使或鼓励基督徒的情绪。	2014-03-26 15:12:13.163376	2014-03-26 15:12:13.163376	1
64	64	zh	情感的话语	2014-03-26 15:12:13.17427	2014-03-26 15:12:13.17427	1
65	65	zh	身体的感觉，没有灵魂，生产材料的狂喜和感动。如果精神意义上总是引导人，就生长出欣喜若狂的时刻较高的经验和更好的生活更加虔诚的自我克制和纯度。狂热情绪的自我满足通风从来没有让一个基督徒。上帝没有影响的人。在“二藤耳”是不是听觉神经。它是所有听力和无所不知的心灵，给谁需要每个人的都知道，由谁来将被提供。	2014-03-26 15:12:13.190542	2014-03-26 15:12:13.190542	1
66	66	zh	从发声祷告危险	2014-03-26 15:12:13.199695	2014-03-26 15:12:13.199695	1
67	67	zh	从祈祷的危险是，它可能会导致我们陷入诱惑。通过它，我们可能会成为非自愿的伪君子，说出的欲望而不是真正的和安慰自己的罪与我们祈祷过，或故意请求原谅在以后的日子回忆之中。虚伪是致命的宗教。	2014-03-26 15:12:13.213683	2014-03-26 15:12:13.213683	1
68	68	zh	罗嗦了祈祷可以负担得起的自我辩解一个安静的感觉，虽然它使罪人伪君子。我们永远需要一个诚实的心脏绝望，但有一点希望为那些谁只是来断断续续地直面自己的邪恶，然后设法将其隐藏。他们的祈祷是不与他们的性格对应的索引。他们秘密举行团契罪，这种外部是由耶稣说成是“好像粉饰的坟墓......全......一切的污秽。”	2014-03-26 15:12:13.223861	2014-03-26 15:12:13.223861	1
69	69	zh	愿望和爱情	2014-03-26 15:12:13.234477	2014-03-26 15:12:13.234477	1
70	70	zh	如果一个男人，但显然热切的祷告和，是不纯的，因此言不由衷的，什么是必须在他身上是对此有何评论？如果他达到了他的祷告的高尚，就不会有对此事发表评论没有机会。如果我们觉得有抱负，谦卑，感恩和爱，我们的言语表达， - 这个神接受，以及它是明智的，不要试图欺骗自己或他人，为“没有什么涵盖了不得透露。”专业和发声祷告就像慈善在某一方面， - 他们“能遮掩许多的罪。”祈求谦卑与表达什么fervency并不总是意味着它的欲望。如果我们转离穷人，我们还没有准备好接受他的赏赐谁祝福穷人。我们承认有一个非常邪恶的心脏，并要求它可以布置在我们面前裸露，但我们还不知道这更多的心脏比我们都愿意有我们的邻居看到了什么？	2014-03-26 15:12:13.24735	2014-03-26 15:12:13.24735	1
71	71	zh	搜索的心脏	2014-03-26 15:12:13.262925	2014-03-26 15:12:13.262925	1
72	72	zh	我们应该反省一下，了解什么是心脏的感情和目的，这样我们不仅可以学到什么，我们是诚实的。如果有朋友告知故障我们，我们耐心倾听的斥责和信贷说什么？我们不相当感谢，我们是“不作为其他人”？在多年的笔者一直非常感谢功勋训斥。错误在于不配CEN-肯定， - 其中对谁都没有好虚伪。	2014-03-26 15:12:13.279839	2014-03-26 15:12:13.279839	1
73	73	zh	愿望峰会	2014-03-26 15:12:13.293243	2014-03-26 15:12:13.293243	1
131	1	\N	如果人们相信上帝，你的生活会变得开阔和备受眷顾。	2015-07-06 18:47:55.117379	2015-07-06 18:47:55.117379	3
74	74	zh	所有祷告的考验在于这些问题的答案：因为这是询问的我们是否爱我们的邻舍更好？我们在追求老的自私，满足你已经拥有祈求更好的东西，尽管我们不提供任何证据，我们请求的诚意与我们的祷告生活一致？如果自私有定处，以仁慈，我们应无私地把我们的邻居，并祝福他们，骂我们，但我们永远不会满足这个巨大的责任只问它可能会做。有一个十字架被拿起，才可以享受我们的希望和信念的成果。	2014-03-26 15:12:13.305147	2014-03-26 15:12:13.305147	1
75	75	zh	实用的宗教	2014-03-26 15:12:13.319993	2014-03-26 15:12:13.319993	1
76	76	zh	难道你“爱主你的神。你的心脏，并与所有你的灵魂，并与所有你的心”？这个命令包括所有的材料仅仅是感觉，感情，和崇拜的多，甚至投降。这是基督教的黄金国。它涉及生命科学，并认识圣灵只有神圣的控制，其中的灵魂是我们的主人，和物质感和人类将无立足之地。	2014-03-26 15:12:13.335339	2014-03-26 15:12:13.335339	1
77	77	zh	圣杯牺牲	2014-03-26 15:12:13.350194	2014-03-26 15:12:13.350194	1
78	78	zh	你是否愿意离开所有为基督，为真理，所以罪人之间被计算在内？不！难道你真的想要达到这一点呢？不！那么，为什么做这件事很长的祷告，并要求自己是基督徒，因为你不在乎在我们亲爱的师父的脚步践踏？如果不愿以他为榜样，为什么用，你可能是他的性情有分嘴唇祈祷？一致的祷告是做正确的事的愿望。祷告意味着我们渴望走路，会在光明中行，只要我们接受它，即使有出血的脚步，那在主耐心等待，我们将离开我们的真正的欲望被他的回报。	2014-03-26 15:12:13.366723	2014-03-26 15:12:13.366723	1
79	79	zh	世界必须成长到祈祷的精神的理解。如果不够好，耶稣的杯尘世的痛苦中获利，上帝会支持我们在这些悲伤。直到我们这样神圣合格并愿意喝他一杯，数以百万计重复无意义的话永远不会涌入祷告的灵能的明证油膏和“用神迹随着。”基督教科学揭示了必要克服世界，肉体，和邪恶，从而摧毁了所有的错误。	2014-03-26 15:12:13.388166	2014-03-26 15:12:13.388166	1
80	80	zh	求是不够的。它正在努力，使我们能够进入。精神上的造诣开门神圣的生命的更高的认识。	2014-03-26 15:12:13.407682	2014-03-26 15:12:13.407682	1
81	81	zh	敷衍的祷告	2014-03-26 15:12:13.423599	2014-03-26 15:12:13.423599	1
82	82	zh	一个礼拜在Thibet的形式是通过街道进行一个祈祷机，并停在门被磨出来的祈祷，以赚取一分钱。但进步的先遣部队已经支付了祷告的特权迫害的价格。	2014-03-26 15:12:13.446747	2014-03-26 15:12:13.446747	1
83	83	zh	问不对劲	2014-03-26 15:12:13.457251	2014-03-26 15:12:13.457251	1
84	84	zh	经验告诉我们，我们不总是收到我们祷告祈求的祝福。还有就是源和所有善良和幸福的手段有些误解，或者我们当然应该接受，对于我们问。圣经说：“叶问和接收没有，因为你们妄求，要叫你们在你的私欲使用它。”这是我们的愿望和为此我们问，它并不总是对我们最好的接收。在这种情况下无​​限的爱将不会授予该请求。你问的智慧是仁慈的，而不是惩罚的罪？那么，“叶问不对劲。”如果没有惩罚，罪会倍增。耶稣的祷告，“免我们的债，”还指定宽恕的条款。当宽恕通奸的女人，他说：“去吧，从此不要再犯罪了。”	2014-03-26 15:12:13.463947	2014-03-26 15:12:13.463947	1
85	85	zh	刑罚减免	2014-03-26 15:12:13.475741	2014-03-26 15:12:13.475741	1
86	86	zh	裁判官有时会汇付罚款，但是这可能是没有道德利益的犯罪，充其量，它只是从惩罚的一种形式保存的犯罪。道德法律，其中有开释或谴责的权利，总是要求恢复原状之前，凡人可以“去得更高。”破法带来的惩罚，以迫使这一进展。	2014-03-26 15:12:13.488175	2014-03-26 15:12:13.488175	1
87	87	zh	真理歼错误	2014-03-26 15:12:13.509046	2014-03-26 15:12:13.509046	1
88	88	zh	单纯的法律赦免（并没有其他的，神圣的原则永远不会赦免我们的罪或错误，直到他们被纠正）离开罪犯自由的重复犯罪，如果确实，他还没有受到足够的副使他从中转与厌恶。真理赠送在错误没有赦免，但抹出来的最有效的方式。耶稣所受为我们的罪，而不是废止神判为个人的罪，而是因为罪带来不可避免的痛苦。	2014-03-26 15:12:13.535446	2014-03-26 15:12:13.535446	1
89	89	zh	渴望圣洁	2014-03-26 15:12:13.55316	2014-03-26 15:12:13.55316	1
90	90	zh	请愿书带给凡人铁道部 - 技援贷款'自己的信仰只是结果。我们知道，圣洁的愿望是必要的，以获得圣洁，但如果我们的愿望高于一切的圣洁，我们将牺牲一切吧。我们必须愿意这样做，我们可能是唯一可行的道路来走成圣安全。祷告不能改变一成不变的真理，也不能独自祷告给我们真理的理解，但祈祷，再加上习惯性的热切渴望知道和做神的旨意，将带我们进入一切的真理。这样的愿望有发声表达什么必要。这是最好的表达的思想和生活。	2014-03-26 15:12:13.562315	2014-03-26 15:12:13.562315	1
91	91	zh	祈祷，为生病的	2014-03-26 15:12:13.572363	2014-03-26 15:12:13.572363	1
92	92	zh	“出于信心的祈祷，要救那病人，”圣经说。这是什么医治的祷告？区区请求上帝会医治病人无权获得更多的神的存在不是总是在手。这样的祈祷，为生病的有益效果是对人的心灵，使其通过对神的迷信采取更有力的身体。然而，这是一个信念铸造出另一个，在未知的信念铸造出在疾病的信念。这既不科学，也不真相它通过盲目的信仰行为，也不是作为表现在耶稣的谦卑祷告是真理的深刻和认真的抗议人的团结与真理和人的肖像，以神，人类认识神的医治原理和爱。	2014-03-26 15:12:13.579348	2014-03-26 15:12:13.579348	1
93	93	zh	祷告到一个有形的神会影响病人的药物，它有没有自己的疗效，但是从人的信仰和信念借用它的力量。这种药物不执行任何操作，因为它没有智慧。这是一个致命的信仰，不是神的原则，还是爱情，这会导致药物是显然无论是有毒或有益于健康。	2014-03-26 15:12:13.585879	2014-03-26 15:12:13.585879	1
94	94	zh	为病人祷告的复苏世俗认定的盲目的信仰帮助，而帮助应该是来自于开明的理解。改变信仰可以无限期地进行下去，但他们是人类思想的商品，而不是神圣的科学的产物。	2014-03-26 15:12:13.594147	2014-03-26 15:12:13.594147	1
95	95	zh	爱公正和普遍	2014-03-26 15:12:13.60077	2014-03-26 15:12:13.60077	1
96	96	zh	难道神干预的代表1崇拜者，而不是帮助别人谁提供祈祷的同样的措施？如果生病了恢复，因为他们祈祷或祈求出声，只是上访者（的<em>本身</ em>的或委派代表）应该好了。在神圣的科学，在那里祈祷的精神，<EM>所有</ em>的可利用神的自己“在患难中随时的帮助。”爱是公正的和普遍的在其适应和恩赐。它是开放的源泉的叫道：“何，每一个渴想，你们都来的水域。”	2014-03-26 15:12:13.609273	2014-03-26 15:12:13.609273	1
97	97	zh	公共夸张	2014-03-26 15:12:13.615625	2014-03-26 15:12:13.615625	1
98	98	zh	在公共祈祷，我们经常去超越我们的信念，超越热切渴望的诚实立场。如果我们不暗自向往和追求公开所有我们要求的完成，我们的祷告是“徒劳的重复”，如异教徒使用。如果我们的请愿书是真诚的，我们的劳动为我们所要求的，与我们的父亲，谁在暗中看见，必然报答我们公开。可我们的欲望，仅仅公开表达增加呢？我们获得了全能的耳朵越早用文字比想法？即使祈祷是真诚的，上帝知道我们的需要，我们告诉他或我们的同胞的生命这件事之前。如果我们珍惜的愿望和诚实默默耕耘，谦卑，上帝会保佑它，我们将招致铺天盖地我们真正的愿望与文字的洪流风险较小。	2014-03-26 15:12:13.622553	2014-03-26 15:12:13.622553	1
99	99	zh	肉体的无知	2014-03-26 15:12:13.629729	2014-03-26 15:12:13.629729	1
100	100	zh	如果我们向上帝祈祷，作为一个有形的人，这会阻碍我们放弃了人类的疑虑和恐惧而参加这样的信念，所以我们不能把握无限的，无形的爱，向谁所有的事情都是可能造成的奇观。因为神的原理人类的无知，爱情，所有的父亲被表示为一个有形的创造者，因此男性承认自己是仅仅是物理的，并且是无知的人作为人类的永恒无形的存在，神的形象或反射和。错误的世界是无知的真相，无视人类生存的现实世界，对感觉世界上没有认识到生活的灵魂，而不是身体。	2014-03-26 15:12:13.635905	2014-03-26 15:12:13.635905	1
101	101	zh	身体的存在	2014-03-26 15:12:13.642388	2014-03-26 15:12:13.642388	1
102	102	zh	如果我们理智与身体，把全能的有形的，物质的人，他的耳朵，我们会争取，我们不是在圣灵的示范“离开身体”和“与主同住”。我们不能“有两个MAS-TERS。”是“与主同住”就是有，不是单纯的情感狂喜或信仰，而是生活的实际演示和理解，揭示了基督教科学。是“与主同在”是要顺服神的律法，要绝对支配由神圣的爱情，逐灵，不在乎物质。	2014-03-26 15:12:13.651289	2014-03-26 15:12:13.651289	1
103	103	zh	灵性意识	2014-03-26 15:12:13.658756	2014-03-26 15:12:13.658756	1
104	104	zh	成为有意识的一刻，生命和智慧是纯粹的精神，无论是在物质，也不，然后身体会说出没有怨言。如果从疾病的信念痛苦，你会发现自己突然好。悲伤变成快乐的时候身体是精神生命，真理和爱的控制。因此，耶稣的承诺，希望能赐：“他信我，那我也必使他也要作; ......因为我往父那里去，” - [因为自我是离开身体，和现在用真理和爱。]主祷文是灵魂的祈祷并不重大意义。	2014-03-26 15:12:13.665939	2014-03-26 15:12:13.665939	1
105	105	zh	从物质生活的信念与梦想完全独立的，是神圣的生命，揭示精神的理解和对人的统治整个地球的意识。这种理解，就把错误和医治病人，并用它您可以说“具有权威之一。”	2014-03-26 15:12:13.69532	2014-03-26 15:12:13.69532	1
106	106	zh	“当你们祷告，要进你的衣柜，而且，当你竟关上门，祷告你父在暗中，你父，在隐密中察看，必报答你。”	2014-03-26 15:12:13.706612	2014-03-26 15:12:13.706612	1
107	107	zh	精神上的避难所	2014-03-26 15:12:13.722385	2014-03-26 15:12:13.722385	1
108	108	zh	所以耶稣说话。衣柜里的预表圣灵，其门关闭了罪恶的意义，但让在真理，生命，爱的庇护所。关闭错误，它是开放的真理，和<em>反之亦然</ em>的。在秘密的父亲是看不见的感官，但他知道，根据动机万物及回报，而不是根据语音。进入祷告的心脏，犯错感官的门必须关闭。嘴唇必须是静音和唯物主义沉默，那个男人可能有观众与精神的神圣原则，爱情，它破坏所有的错误。	2014-03-26 15:12:13.733502	2014-03-26 15:12:13.733502	1
109	109	zh	有效的调用	2014-03-26 15:12:13.749839	2014-03-26 15:12:13.749839	1
110	110	zh	为了正确地祈祷，我们必须进入衣柜里，关上了门。我们必须关闭嘴唇和沉默的物质感官。认真渴望安静的避难所，我们必须拒绝罪恶，祈求神的allness。我们必须下定决心，背起十字架，并出去与诚实的心去工作，并注意有无智慧，真理和爱。我们要“不住的祷告。”这种祈祷的回答，，只要我们把我们的愿望付诸实践。法师的禁令是，我们暗暗的祷告，让我们的生活证明我们的诚意。	2014-03-26 15:12:13.765116	2014-03-26 15:12:13.765116	1
111	111	zh	守信恩泽	2014-03-26 15:12:13.779489	2014-03-26 15:12:13.779489	1
112	112	zh	基督徒喜乐的秘诀美丽和富饶，隐藏的世界，但上帝知道。自健忘，纯度和亲情是不变的祈祷。练不专业，不理解的信念，赢得了耳朵和全能的右手，他们确实叫下来无限的祝福。诚信是开明的信仰的根基。如果没有健身的圣洁，我们不能接受的圣洁。	2014-03-26 15:12:13.796614	2014-03-26 15:12:13.796614	1
113	113	zh	至高无上的崇拜	2014-03-26 15:12:13.80828	2014-03-26 15:12:13.80828	1
114	114	zh	物质的东西了很大的牺牲必须先这种先进精神的理解。最高的祷告不是单纯的信仰之一，它是示范。这样的祈祷治愈疾病，而且必须破坏罪和死亡。它区分真理是无罪和有罪的感觉是虚假的。	2014-03-26 15:12:13.816257	2014-03-26 15:12:13.816257	1
115	115	zh	耶稣基督的祈祷	2014-03-26 15:12:13.825386	2014-03-26 15:12:13.825386	1
116	116	zh	我们的主教导他的门徒简短的祈祷，这是我们在他之后命名主祷文。我们的师傅说，“经过这种方式，因此你们祷告，”然后他给了那个祷告涵盖所有人类的需求。确实是有圣经学者之间有些怀疑，最后一行是不是除了祈祷为更高版本的抄写员，但这并不影响祈祷本身的意义。	2014-03-26 15:12:13.860371	2014-03-26 15:12:13.860371	1
117	117	zh	一语中的，“救我们脱离凶恶，”原来的正确读取，“脱离那恶者救我们。”该读数加强我们的科学的信访忧虑，对基督教科学教导我们说：“那恶者”，或者一个邪恶的，也不过是另一个名称的第一个谎言和一切说谎话。	2014-03-26 15:12:13.866606	2014-03-26 15:12:13.866606	1
118	118	zh	只有当我们超越一切物质感性和罪恶，才能达到天堂出生的愿望和精神意识，这是显示在主祷文并立即医治病人。在这里，让我给我的理解是主祷文的精神意义：	2014-03-26 15:12:13.875275	2014-03-26 15:12:13.875275	1
119	119	zh	我们的父亲在天上，<EM>我们的父亲，母亲上帝，一切不和谐</ em>的，	2014-03-26 15:12:13.882453	2014-03-26 15:12:13.882453	1
120	120	zh	愿人都尊你的名为圣。 <EM>可爱的一个。</ em>的	2014-03-26 15:12:13.888417	2014-03-26 15:12:13.888417	1
121	121	zh	愿你的国降临。的<em>愿你的国降临，你的艺术无时不</ em>的。	2014-03-26 15:12:13.897163	2014-03-26 15:12:13.897163	1
122	122	zh	愿你的旨意在地上做，因为它是在天上。的<em>让我们知道， - 如同行在天上，所以在地球上，神是万能的，至高无上</ em>的。	2014-03-26 15:12:13.91229	2014-03-26 15:12:13.91229	1
123	123	zh	让我们在这一天我们日用的饮食;的<em>给我们的恩典今天，养活饥饿的感情; </ em>的	2014-03-26 15:12:13.920712	2014-03-26 15:12:13.920712	1
124	124	zh	免我们的债，如同我们免了人的债。的<em>爱是体现在恋爱中; </ em>的	2014-03-26 15:12:13.930601	2014-03-26 15:12:13.930601	1
125	125	zh	不叫我们遇见试探，但救我们脱离凶恶;的<em>神是领我们不要变成诱惑，但救我们脱离罪恶，疾病和死亡</ em>的。	2014-03-26 15:12:13.939395	2014-03-26 15:12:13.939395	1
129	129	zh	赎罪是人类与上帝，据此人反映神的真理，生命，和爱情的例证。拿撒勒的耶稣教和证明人的统一性与父亲，为此我们欠他无尽的敬意。他的使命是个人和集体。他一生的工作，不仅端正司法自言自语，但在怜悯凡人，告诉他们如何做他们的，而不是为他们做也不是为了缓解了单一职责他们。耶稣大胆地采取行动，对感官，法利赛人对信仰和实践的认可的证据，他驳斥了所有对手与他的治愈力量。	2014-03-26 15:12:13.978379	2014-03-26 15:12:13.978379	1
130	130	zh	人类和解	2014-03-26 15:12:13.985128	2014-03-26 15:12:13.985128	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fhftsxiohdoauj
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name) FROM stdin;
1	cshackathon@gmail.com	$2a$10$fPXQrDmgdGSEYca6KaXDd.w8TQupZJaPbBp9nSGRe0/7H66aKo7n.	\N	\N	\N	0	\N	\N	\N	\N	2014-03-26 15:12:12.301987	2014-03-26 15:12:12.301987	autotranslation
2	camertron@gmail.com	$2a$10$lQty1u.TAnWztkxHeWQce.O/iGFuv1KwnZzKp6Yv.Yjmyux5hTcV.	\N	\N	\N	2	2014-08-03 02:56:15.251874	2014-03-27 01:31:15.639384	67.170.229.23	50.184.98.23	2014-03-27 01:31:15.629438	2014-08-03 02:56:15.254462	Cameron Dutro
5	julian.schwartz@gmail.com	$2a$10$JFIWAkJv3UUqnUFGMfhLoeA1R967lZZZJa8yCKavUGVuAU3snKIAu	\N	\N	\N	1	2016-01-05 03:32:09.535992	2016-01-05 03:32:09.535992	50.184.222.58	50.184.222.58	2016-01-05 03:32:09.511047	2016-01-05 03:32:09.549404	julian
3	itsaboutgood@gmail.com	$2a$10$EidBcXN5C8OmHNxxiubq1.iuEPwWJEClZk9QBxhUkO2f9OFPj8jE.	\N	\N	2016-01-25 04:23:42.585929	5	2016-01-30 03:42:52.472356	2016-01-25 05:18:11.291185	205.197.242.183	205.197.242.187	2015-07-06 18:36:33.644539	2016-01-30 03:42:52.474714	Michael Morgan
4	soapergem@gmail.com	$2a$10$fJIZvsBIGHlnYTy9PME/Oe6KGQgiHKSnEAUjSFNi5ICKKTyNZx3KW	\N	\N	2016-02-13 23:28:04.240486	5	2016-02-13 23:28:04.245815	2016-02-13 23:27:38.001539	69.131.95.196	69.131.95.196	2016-01-05 03:19:49.293232	2016-02-13 23:28:04.247193	Gordon Myers
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: fhftsxiohdoauj
--

COPY public.votes (id, created_at, updated_at, value, user_id, translation_id) FROM stdin;
1	2015-07-06 18:48:13.083476	2015-07-06 18:48:13.083476	1	3	1
2	2016-01-25 04:27:48.527849	2016-01-25 04:27:48.527849	-1	3	3
3	2016-01-25 04:27:52.809391	2016-01-25 04:27:52.809391	1	3	132
\.


--
-- Name: phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fhftsxiohdoauj
--

SELECT pg_catalog.setval('public.phrases_id_seq', 130, true);


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fhftsxiohdoauj
--

SELECT pg_catalog.setval('public.translations_id_seq', 132, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fhftsxiohdoauj
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fhftsxiohdoauj
--

SELECT pg_catalog.setval('public.votes_id_seq', 3, true);


--
-- Name: phrases phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: fhftsxiohdoauj
--

ALTER TABLE ONLY public.phrases
    ADD CONSTRAINT phrases_pkey PRIMARY KEY (id);


--
-- Name: translations translations_pkey; Type: CONSTRAINT; Schema: public; Owner: fhftsxiohdoauj
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: fhftsxiohdoauj
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: fhftsxiohdoauj
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: fhftsxiohdoauj
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: fhftsxiohdoauj
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: fhftsxiohdoauj
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA heroku_ext TO fhftsxiohdoauj WITH GRANT OPTION;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: fhftsxiohdoauj
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO fhftsxiohdoauj;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO fhftsxiohdoauj;


--
-- PostgreSQL database dump complete
--

