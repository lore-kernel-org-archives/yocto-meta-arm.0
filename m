Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCF3EF06E3
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 04:01:26 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20053.1770523283709912850
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 07 Feb 2026 20:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=pKhBJZho;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.65.10, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b09gIjRlis1UP5PEurfZt/R4TGVQK/FqBJ+Xd3d3TMm0+th6qUnHDBVBNRnIR0KX/Gq2XKR243ZgdB/4ctkY51RhSR04nHGoAWO6nsHDQ8HaJwofcjGFoko3AnFVpy2dl/LGzTy8qPzJg252jDvgqVVDaW8lQHeqgJLGEvEqre5r669ZLxychwIewn80Dx5yc94ATym3O97J8rJSPXab5tdszx62v3SksvS7EAeJRGxbIKKjCxZStiHMyUt7mpC1nUanR0cK9vCMlL2qjjIVBS58X8j3rBdjzhvD+KYP//qsA/VZMn/NSgSCwtPxTA3dR0GzKPzNOHAs8DiFXgjOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QBT6NJKQyKhrkFHK4qi4YjpmtZ+07aujr4RWr3cavM=;
 b=xDaQR4AUh5YGd7ICa7mqitQmgj2NWhJd4YbPo2SyFo4c/gentkPXKQQ11DVm96CQKWpvuxyW1rRdzhDolbTYiOObccPZ5Puw1wVBHQ9bqcZgaaLsUcGwuVQfQM3g6uVUrP/w65gxXmsUGNOqPLNYPwerAn8Aq4ehvZ+vkGmT6jeph+JGajDAnNel21e6ODibU65z8MrwfjY8oQkFS6p1Z7iyJPQetXnCj/g/KI5X1fdgI/SvUzkMn7bZno4Q0wyzjQEFbfEDl7b/UBDlG02Kh9WJ58TaVWY4AMWJMdcFxn09QZaAgmgByyO3xSaHVeid0Vf5fWJfo3JZrrzjEZ5uRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QBT6NJKQyKhrkFHK4qi4YjpmtZ+07aujr4RWr3cavM=;
 b=pKhBJZhoIuvb1xNlShy6qM9QrQYoK1wera8gqHUpazMg5rVimA57zWbaTOAmTLEDzNzSUAwlEGg38Tf3NEkds53Unmi1t5tXopD2J1EqirE/nDDPKD9QyPXlUAxqnaKTIESyH9xqchcCa+pK6c3yrnJzun2aMjxd3tpOYEkYe4Y=
Received: from AM6PR06MB6326.eurprd06.prod.outlook.com (2603:10a6:20b:d8::19)
 by AS5PR06MB10101.eurprd06.prod.outlook.com (2603:10a6:20b:6c8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Sun, 8 Feb
 2026 04:01:19 +0000
Received: from AM6PR06MB6326.eurprd06.prod.outlook.com
 ([fe80::2b51:92ba:768b:fae]) by AM6PR06MB6326.eurprd06.prod.outlook.com
 ([fe80::2b51:92ba:768b:fae%5]) with mapi id 15.20.9587.016; Sun, 8 Feb 2026
 04:01:19 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	"jon.mason@arm.com" <jon.mason@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm: fixup new override syntax usage
Thread-Topic: [meta-arm] [PATCH] meta-arm: fixup new override syntax usage
Thread-Index: AQHcl8p2j8lpQyVEMEiHm9ZcRlH8DbV3Rk0AgADlUU0=
Date: Sun, 8 Feb 2026 04:01:19 +0000
Message-ID: 
 <AM6PR06MB6326588D31E9C466EAFB2C7CBC64A@AM6PR06MB6326.eurprd06.prod.outlook.com>
References: <20260207004109.2880231-1-johannes.schneider@leica-geosystems.com>
 <20260207140624.GF11121@denix.org>
In-Reply-To: <20260207140624.GF11121@denix.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR06MB6326:EE_|AS5PR06MB10101:EE_
x-ms-office365-filtering-correlation-id: ef63a8ca-2339-4fdc-8b40-08de66c6b710
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?iekCUFO06feOlmqGzV39DwlSOEjBhkrPj7X/Zpq5kT4ADKgX7WAOMuSEnj?=
 =?iso-8859-1?Q?kTImCtcAIYJVDGZJLDY6duilrQ0mEwVqQuQ7xiqF6KEIT8NPHlMKnoEea9?=
 =?iso-8859-1?Q?cBqRMg9cIAJokXPk/Z8LzbTgMQ/lnkkyGa2Ue2OKF66XGEFKDn20xIIfm0?=
 =?iso-8859-1?Q?+16JvC0SUoBl0z0Fe5n09ju3u5GrHfLezrO+xzdlqSA8RM7pCc65at3Iax?=
 =?iso-8859-1?Q?9o6ruYuFcDvHtbAiiZ2O2JFIQ0/X+c+0tOgG9accZZOo2tjdGj9wIYARmE?=
 =?iso-8859-1?Q?WYzi09zip82xizWZ3gDmXP36x5cQL7514Hi08R4XWLOusosAkcMg20aS0+?=
 =?iso-8859-1?Q?BI+4UPQp7w2EFIGTb8Mk9oS0vAoqV5e2tQ5IpHZCbghyJ2rOOxphnXg6P/?=
 =?iso-8859-1?Q?HFMc36kPP77hf3m10O5Gxa0okj4gcHKrobxQ8JAOdg6HN6nSImymNxJmD/?=
 =?iso-8859-1?Q?TS0RpX6eCB7kwpTU4w+1cLtO8uNS5phrpPcuT/2Cfd5WQScKtAbThOe9XA?=
 =?iso-8859-1?Q?Hx13i0txI/V891E5FnERzyCnr6KeIPTs1PmCG9+BSJKCKP2oor7wUmczih?=
 =?iso-8859-1?Q?m0Y28jCPuXc4/qX5YVl/EaXOmyvJnAJqcvGhGErLDNkuuZ6Yzakb1DOCXY?=
 =?iso-8859-1?Q?vcjqm91mSuGimT2jTMrzRoAgNBJrvPFKkY8ReUuFzexejtOJ6sN0H7txTb?=
 =?iso-8859-1?Q?dfsX/eilIYPFxdcU4Lsry9KVemBuvLhc9HI06FXtur5jTY7zcPi93/D4NU?=
 =?iso-8859-1?Q?aTan/YDGrFxEoacki0wpNAoCWRudoNPZWTaoqCHPbhEn/Jd35LNVbUlgkW?=
 =?iso-8859-1?Q?ug2r7uGbU4QkRRreo+0YtOrDAJDqJ73ZH7vNYI4LjohpP+jE8GtlpP9nEO?=
 =?iso-8859-1?Q?kdvW98+YgEMnnN/tjM/CtjJJj3lR6kw209PDr/HdjRxeDopfJ6XCGZH2Xd?=
 =?iso-8859-1?Q?S4WSdOmra6hNNPm+aLEJNVWBCydRHj3PQaGBwrQyNXHFt9ANfihNl5x9kP?=
 =?iso-8859-1?Q?mSv1HWXBfPOBB8hWk+rJxcX3abetBlD/8Roph7Gt5cJOmzw9nSTMEMDnHC?=
 =?iso-8859-1?Q?vrlzx5P2BQVT39aNd6FIf0gSREWqP67m8B7F8rTb/ss2y74lEpik4A3v1/?=
 =?iso-8859-1?Q?RIbivOluspdYH6pFV3Zkwz0aAG40xNQyq6VLQ7a7Bh3oRCqzhCdZIOnor/?=
 =?iso-8859-1?Q?ghzipJUdj27D6YAHY/Z5NHumylwgFFydmnF8U6Ky0l3TMUR3BOPP6XNN9U?=
 =?iso-8859-1?Q?tRCIn4ch3j+24V37p6Rc2C/p3K5tybWnQR+0hvDrX+iF3dVCR8P6mzLLSx?=
 =?iso-8859-1?Q?Y5xsytktWDN/KGnHKHL9gFlXnOedYCnllR/QCdZpuonY2I3/qOqvWLrCVL?=
 =?iso-8859-1?Q?oD5oKjG2Si5j/f59hxnyqKhFh2/GMeODQE2qkKsMSFtHW+sz7nmax38WYz?=
 =?iso-8859-1?Q?zEYs19AZXwOvGJMjI9COaEOkydijq1UuGgk7KitHJ5YYLtWQGZyJERny3+?=
 =?iso-8859-1?Q?7oIjIz6afhVlc4iod1dOJLpsRMM1TOs/qyMAepW2e64OhOPNQNVjLxzNTD?=
 =?iso-8859-1?Q?BGmIsUYJzAW0Acp7YlzPXilC5VhsDsZJWAiVRs+LA1bNua1btlqA+KUQ3n?=
 =?iso-8859-1?Q?SC7c0iOTb+Wis6Sm0Rxnm2MKJgWNtaHu0HpK1FM+yOOh122xx2+FHOI0lV?=
 =?iso-8859-1?Q?VKtC0f+saYCGvvanBMs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR06MB6326.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?wXfRh5FUI1kcvv/Tgk3yjppE6N7rt8fJsCY+7q203VezvZk0vK3RdhU33E?=
 =?iso-8859-1?Q?qPc+G14sPo7jj+nOC1KKl7Blv+6tQpvdJCGH0M8xoSrPr7NHYk9U6BUiuH?=
 =?iso-8859-1?Q?aaqKHqbG/llM8Q2iaYRKrF7U4ngXRC66R/wu5ddnEAkvHz0bOzLQppdmOQ?=
 =?iso-8859-1?Q?SgdwSf+0FtSmszV5Tfx6iXK9V2HKwRtiArImwDnFbdSes2vX/P3o5o0VYr?=
 =?iso-8859-1?Q?2K2WxC76Uzaoa7xGsO6jjzji+HDvmdFGanwAi3VenNyFJL+C6SIqVSy/Cb?=
 =?iso-8859-1?Q?ENlP2n6D3HoneCJtWB4ZWPO03uNvw/leNyayt/JVIJxy/Tu860MdrQXHPF?=
 =?iso-8859-1?Q?TUfz38CCKvowJSSIJALAgNjvbgylZ8DtIQ3ILMxBsG1qL9EMIDJmQLtAyZ?=
 =?iso-8859-1?Q?gfNj10xlh9OtyuVXh5sNL0rK6P9VfcBhm7wLslyBZytkqSOO1gh6GT1lRP?=
 =?iso-8859-1?Q?wVprTrvk8Ny2U1FVxFYIQC2jt3Sz8aDvw3kpKBSU9oYyYxEDWZAjgysrqe?=
 =?iso-8859-1?Q?Glmomwv/GxSTWvcJCNmbhPZv9Dq5szEfyeWATYrcOhBaZZje/84GWNOI+U?=
 =?iso-8859-1?Q?aQG+I92ab/tmnetDMfHoPDW5mrnYA+7OmA7JMzkidUBVOZfKelHg7vwFUE?=
 =?iso-8859-1?Q?wu9+GLOwpSrZcsZEYyW1Vp2KcqzZml4dtUoml2QUhUefyHgHc324v/3M7U?=
 =?iso-8859-1?Q?wqsNX82btTzkizloj8y3aUXc7YlYurN1Kezo5lwfDXUGuwb4r73d5Gt0tf?=
 =?iso-8859-1?Q?/1Ly7sLK50Y9fWycODAUBMnRP+xGv1shMbBJ8+JBGwFw5fRO6PIqDL280s?=
 =?iso-8859-1?Q?zpC6aBPWUga2NjJnxB/6oQFskwKyxFA2A3XkR/1ocFIjXA4A4wv+LqBilV?=
 =?iso-8859-1?Q?4KjCcZvXftbBZWm4w+7fmOC5isI0s1hDucshYI5v4hnQk5fuobfJx3wYl1?=
 =?iso-8859-1?Q?SFpFPBPoDg5HbWDj1W+PgUfZxsD0NFwdUZTjI1I6qzVVOnIKN884rxKHCa?=
 =?iso-8859-1?Q?uSE0qD8raB69UJUCeYwzOKyBEpyiCsRQwrTWx71+3VfecqoAW/KlKwuS9S?=
 =?iso-8859-1?Q?+K2lN/8D8OI2Z2hH7trZ3fxKyYHezn8kE80ZSSqutVdZDYXq2WbVf8PKTF?=
 =?iso-8859-1?Q?8Vjh4lhI61WAtyP+5PoUDREQLbt5ZsG3IULojVqIc3EXGhFytwWqs1Pc4t?=
 =?iso-8859-1?Q?bBoH9SejQALIoEE0103eK2u+PmYHJzKJ2G+a2tyw+LB8/g3zBL/AATTQ7q?=
 =?iso-8859-1?Q?SwgBiukiePYf/Aj9E2q6b0WzWuG9V1eFUy6PRlHmVZ3QF26AEi32YCc86d?=
 =?iso-8859-1?Q?I2bkEFnXNlA38fspgtf4j4+IzZYrYTSBBsm1EwNhvr61htm1XIspHdHWIX?=
 =?iso-8859-1?Q?SraBRtRp5fOGfBV6UHaUhoA0WPx94rjg2WN0F3KsBeJ/lj4MlDttiMMvE9?=
 =?iso-8859-1?Q?NXyNpRjCcZNnpR82Rk61H/nSah35psnbyoAfaNm+N/4+1sTRPt1cBgBizY?=
 =?iso-8859-1?Q?AAzxRRR5374+4PLLU4Q+Rao2uNADIMy4DkxSzpI4Bi9771Q8Mppn8Zk4v9?=
 =?iso-8859-1?Q?SBtOcu1m422zY8jiF/yZWBzDlOnMP2gq/tbDGc5Ho9TesqBMXXWCtJApoX?=
 =?iso-8859-1?Q?dYRLKy7SEDeD+s0uDT61VfyZ13lDglESRHS5vzIJ3GzsAKVtpmo9TgSo5k?=
 =?iso-8859-1?Q?1uLKFqgVFsniViNK7ECY6rq4JOCRyaiC8kkD71WIzNYuCIXjObwL98vlEe?=
 =?iso-8859-1?Q?bpq+2AWbPkYdnR8BeTtXZiJYctbYVurUZoAmVGb0W3HY7UpCFauAUgPp1e?=
 =?iso-8859-1?Q?eJ2z/5ZvdZKOF0eadigwVO2liDRPpP00BczOBtC0qzoBOuW+JHKj+GcBd4?=
 =?iso-8859-1?Q?e0?=
x-ms-exchange-antispam-messagedata-1: 
 lw1gSEve9+SMab8buZWARgmn0Ep0GtUG6KkKiSNIgIt4NQgMGuhN/okg
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR06MB6326.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef63a8ca-2339-4fdc-8b40-08de66c6b710
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2026 04:01:19.3220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aIfX5k/6cnlYCpDQ7yA7NddHRVJVsKnrydJ4yqOIuNM3sE4oTkBAJ4ekXKqFQiRjf3u5HMtLxHlyIfLfBseeCpJGfvKU9vEZSwX/tWxSbgyAIRaAeOhcdm9uK8BQanhD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB10101
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 08 Feb 2026 04:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6893

Hoi Denys,=0A=
=0A=
>=0A=
>=0A=
> On Sat, Feb 07, 2026 at 12:41:09AM +0000, Johannes Schneider via lists.yo=
ctoproject.org wrote:=0A=
> > The placing of ' ' in combination with inline python variable=0A=
> > expansion can lead to missing/skipping the license file checksum=0A=
> > verification.=0A=
>=0A=
> This technique is relied upon in so many places, the issue would have bee=
n=0A=
> noticed long ago, if it was the case.=0A=
>=0A=
=0A=
True, but as i've learned now: do_populate_lic is not always executed.=0A=
=0A=
What actually masked the issue with a wrong LIC_FILES_CHKSUM in the tfa rec=
ipe=0A=
was that it was pulled in indirectly into the bootloader build - but not th=
e=0A=
rootfs build where the licenses get collected. Only when bitbake-building t=
he=0A=
tfa explicitly does bitbake also run the do_populate_lic task - and throw a=
n=0A=
error.=0A=
=0A=
>=0A=
> > Fix this by using '+=3D' (which itself adds a space) instead of :append=
=0A=
> > (which concatenates strings without inserting a space)=0A=
> >=0A=
> > Fixes: 8dfdacd75c6c ("meta-arm: Convert to new override syntax")=0A=
> > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.=
com>=0A=
> >=0A=
> > ---=0A=
> >=0A=
> > By chance we had an incorrect checksum set as=0A=
> > meta-geosurv-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-leic=
a_2.13.bb=0A=
> > LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c=
6a58af8d19bee1"=0A=
> >=0A=
> > Which 'bitbake -e' would resolve correctly:=0A=
> >=0A=
> >  # $LIC_FILES_CHKSUM [3 operations]=0A=
> >  #   set /workspace/layers/openembedded-core/meta/conf/documentation.co=
nf:268=0A=
> >  #     [doc] "Checksums of the license text in the recipe source code."=
=0A=
> >  #   :append /workspace/layers/meta-arm/meta-arm/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a.inc:57=0A=
> >  #     "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_M=
BEDTLS}', '', d)}"=0A=
> >  #   append /workspace/layers/meta-geosurv-bsp/recipes-bsp/trusted-firm=
ware-a/trusted-firmware-a-leica_2.13.bb:41=0A=
> >  #     "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58af8d19bee1"=
=0A=
> >  # pre-expansion value:=0A=
> >  #   " file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58af8d19bee1${=
@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', =
d)}"=0A=
> >  LIC_FILES_CHKSUM=3D" file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"=0A=
> >=0A=
> > Note the missing space in the pre-expansion value.=0A=
>=0A=
> The space is not missing, it is embedded in the ' ${LIC_FILES_CHKSUM_MBED=
TLS}'=0A=
> You should be able to check it by setting TFA_MBEDTLS=3D1 and running bit=
bake -e=0A=
>=0A=
>=0A=
> > But the oe-core/meta/classes-global/license.bbclass check would miss.=
=0A=
> >=0A=
> > This went unnoticed for a long time and over many clean-builds, as=0A=
> > it would only very rarily raise the QA error.=0A=
> >=0A=
> > Sidenote:=0A=
> > I've looked over the meta-layer, but didn't spot any similar problems.=
=0A=
> >=0A=
> > ---=0A=
> >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--=
=0A=
> >  1 file changed, 2 insertions(+), 2 deletions(-)=0A=
> >=0A=
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=0A=
> > index 6a2c0da9..987b7a66 100644=0A=
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=0A=
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=0A=
> > @@ -49,10 +49,10 @@ SRC_URI_MBEDTLS ??=3D ""=0A=
> >  # This should be set to MBEDTLS LIC FILES checksum=0A=
> >  LIC_FILES_CHKSUM_MBEDTLS ??=3D ""=0A=
> >  # add MBEDTLS to our sources if activated=0A=
> > -SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_U=
RI_MBEDTLS}', '', d)}"=0A=
>=0A=
> Here the space is always appended, as it's outside of the inline code sec=
tion.=0A=
>=0A=
>=0A=
> > +SRC_URI +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBED=
TLS}', '', d)}"=0A=
> >  # Update license variables=0A=
> >  LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apach=
e-2.0', '', d)}"=0A=
> > -LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', =
' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"=0A=
>=0A=
> And here the space only gets appended, if the inline code returns true ^^=
^=0A=
>=0A=
=0A=
I see - thnx for the rundown :-)=0A=
=0A=
What tripped me up was that in that trusted-firmware-a.inc file the variabl=
e=0A=
assignments above/below do it differently - e.g. use '+=3D' instead of appe=
nd.=0A=
=0A=
IMHO we could align all of them, to avoid someone else stumbling over that =
too (-:=0A=
shall i send another patch that does this?=0A=
(or a v2 of this one, dropping the wrong assumption in the commit message)=
=0A=
=0A=
=0A=
Bottom line: i'm wrong / am barking up the wrong tree:=0A=
the issue was hidden in our CI setup, not the recipe=0A=
-> sorry for the noise :-S=0A=
=0A=
=0A=
Gru=DF=0A=
Johannes=0A=
=0A=
>=0A=
> > +LIC_FILES_CHKSUM +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '${LIC=
_FILES_CHKSUM_MBEDTLS}', '', d)}"=0A=
> >  # add mbed TLS to version=0A=
> >  SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_m=
bedtls', '', d)}"=0A=
> >=0A=
> >=0A=
> > base-commit: be599f9523c5784904274cec12596ae31e20121f=0A=
> > --=0A=
> > 2.43.0=0A=
>=

