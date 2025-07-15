Return-Path: <m.grand@trustngo.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F51C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:57:35 +0000 (UTC)
Received: from PA5P264CU001.outbound.protection.outlook.com (PA5P264CU001.outbound.protection.outlook.com [52.101.167.97])
 by mx.groups.io with SMTP id smtpd.web10.2816.1752566252559884605
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 00:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: trustngo.tech, ip: 52.101.167.97, mailfrom: m.grand@trustngo.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ue2FRiNKF2b56kuQ+J8M3OXxGqLjXbjVW4QR4hrjsDG/mb8Wc0XAoDmAt1YdIT0RBnr9/Ipik2OF8VCW8vV5SC4RmR7Sw2IVgXkSyWofSElPyxDWyLKyex7DCaheQIMv0zYgV8obFaiWBYHu9Def9w8FUVuux+F1CdnDp6Dr+9uQrtbb+inVMMsIZj+2pC+kSdCkJtOA34soBV6PQTSdTkHNlf+pUJtBeCv/u1uzHlxAtm7FKmMgJhtBeKNIFkOlhVTKHirQ2qb1r8RL9cUPddMLNBN5aHuU0E9tM0VB89p5VXXXOj8107A9faDIXKhnpn8+bildScaQvOKhih0cbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pRGCflBklmMeBn1mbOFKdJQQPBSmFJ1S3z6bZPuo9U=;
 b=YcbhZQ7uTvOkDYuEYx43eV0J/uQevAYDGkooBh91IhFGykhVRFRl6xU+ULANsCDu47oNKpJCo8UNJtTGiPV6moIGXCf7bE0gMUfncIiQ6J8q3LfKF6h7hwfy+htwfhwWlJA6ILlp9ws/f8hwULI6UnDhMqlS4oZiXsDeiyk34XoFVBloiB/wzE+UyKwJLsRfz3ag5ss6jUwJtHklLfTyALIwfKdlQRc42GAWPsGFrQNLHyn8K/pqsCmmBRWABMxEucDm4JzM/CiGAV3E2CwQz4ZNI+RhZpVMT6NLHiZSOeX67N6V3Cf+tk8lDmTHGtAI0t9rFRhzNWnbJOAZ2SwEIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trustngo.tech; dmarc=pass action=none
 header.from=trustngo.tech; dkim=pass header.d=trustngo.tech; arc=none
Received: from MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::15) by
 PAZP264MB3735.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:d9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Tue, 15 Jul 2025 07:57:28 +0000
Received: from MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d2a:b4d4:4cc4:2df]) by MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d2a:b4d4:4cc4:2df%4]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 07:57:28 +0000
From: Michael Grand <m.grand@trustngo.tech>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Full secure boot with qemuarm64
Thread-Topic: Full secure boot with qemuarm64
Thread-Index: AQHb9VjeApHhJyqFx0WKRkFOI3LafA==
Date: Tue, 15 Jul 2025 07:57:28 +0000
Message-ID: 
 <MR1P264MB1841ADD5E68964B57B0DA05BE157A@MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=trustngo.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB1841:EE_|PAZP264MB3735:EE_
x-ms-office365-filtering-correlation-id: 93e5fd7c-ae52-458d-7ab6-08ddc3753ea3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|7055299006|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?ZZkYN9cDbVuXh0ziy4w3m/ODePHWhUWq+XkyuLKfbV5mgejY3/ZUhDItYD?=
 =?iso-8859-1?Q?Vz3xTQOi3mYG+3LeqcLXiyWgRmUwfw5tu2EFCBVCqcZtFgz12nkkSg41AM?=
 =?iso-8859-1?Q?11giqmCz6yCBXpCU+hSgY0z4VJjqut0xyThbgvuq6TgeCOzitq/aJJgMXU?=
 =?iso-8859-1?Q?bxqtfOzy+x+gWerLB37PYON2d5WCkc9ouZ93lhNhbAKbRjoyHLfM3MmT47?=
 =?iso-8859-1?Q?XKoAwjnskKMQI429wVwUpwhBpv6iIFvcXxkXjPO7rGew+7K8ElpM1O8fUW?=
 =?iso-8859-1?Q?h/SKUnktvA5qWWIU7+UDuGGwt8AIzsJCr0KqISzfzloWZIi0QW8paECut5?=
 =?iso-8859-1?Q?+0IOdVPosGP7S844QuAYH4B8hMmK+rWqHlPWnOL+gLQHXR6QKrA1/TJ1Q+?=
 =?iso-8859-1?Q?deTEMVYg+pf9Wwl8njNjbnaJBtdCln3FMY+f1fIK2do+Or7d85P69vHlKv?=
 =?iso-8859-1?Q?V0LJatUD0m/nZ74lRFs+2+aUyFa8oTPLzWTmUzF2e6Ln85Leojszb72k14?=
 =?iso-8859-1?Q?PxOKgMOWs+wZPhMvph5ogWYQpkT3W+lxdrj2TofF6fk7I6mOu0/HHZGmfQ?=
 =?iso-8859-1?Q?yD0VsHNLLcRRH7DNJyLi+7USSlFe1TfMyhlWE4cPsdoYMO5s5VY9/78CD1?=
 =?iso-8859-1?Q?Q/klhvpTY/AUpMTDyzI3+uD/6Sp2W8QOFXcOGBNoVm0CIwHBtKdNh5NADn?=
 =?iso-8859-1?Q?1nkM5ZqDIFZH2poL6d5ZH0TW5SfaJzW/ox7UpQU8oohM+LFQh2J/PP5YbW?=
 =?iso-8859-1?Q?5nHEm51GmMggRb9wIi9zvT9y8TIDHK3Y/ESK6GE+oMcXHHvmYgHlwU3iK+?=
 =?iso-8859-1?Q?X8ofoCcJzNuxLhfgp72hZKs9WDCsRiVUyOzMY/Civy9RQHyq5i8oMecJOY?=
 =?iso-8859-1?Q?WXA+ESRzeK0GjqP1U3xORyWBKhF3NvPD1E3KhsLXLNezMbZcIy+9MSE1tT?=
 =?iso-8859-1?Q?Q3DeAC3VrTKNRJpBEx4mXx1VD3i7diMzH3+602Ts/SCz51b3KAtVbLfCHE?=
 =?iso-8859-1?Q?dPNU7sgnNLo6XrSTGZERBCwr70IhW52F0gVpd+E1+kJdHOrNG/FAKU/tx7?=
 =?iso-8859-1?Q?W6V3VaFARm7BF4IdhM3WDTumJ6kFf90NZezj8EU91k7RzbeNcsT0vmzJP6?=
 =?iso-8859-1?Q?YDI4C1uw4OlIyPjCEXk+lLh6zr+wxnqSt8Pjk/iWEvpON2BZQA8iA1SkYC?=
 =?iso-8859-1?Q?cyf2ZPZ1wlff+NZWY8R3wpfImhG97CvK2OsZ99I1jz8za+dfU33GCv/Ss0?=
 =?iso-8859-1?Q?tw0IGgdklvPJrOwx9LfPBStKFyq9os0chXl6RieRr2Z1vwBJ4xf0RnG7tP?=
 =?iso-8859-1?Q?daY6UGyYlr8nL7oIaG/X5fugRHboz/kesBhxEW8HI5twdcpWoIYZ1F7Aw/?=
 =?iso-8859-1?Q?HvKEXuSXWSZvl3KPz1NaHbVOAovQkfFCxpZytFc9zbz3dQyrYaN4fKLcdN?=
 =?iso-8859-1?Q?KaOPBnBmaArZaLH5OobynjxMj+R0E2zLeu7jhmwW8KM7SISOAPErS4LtYu?=
 =?iso-8859-1?Q?IYmoaNO2fwS2SJA4+eTHSC?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(7055299006)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ycbc9N6h8Cw3pgyYSi9WTQ20huVod04wP0JPuHvCkjiN1qxoeNA7qJrXIe?=
 =?iso-8859-1?Q?pTaZkmxnyKV+HfYtRuY5WjmW6ES/mB+BEaukRBvtgCss55GedNSN7HJ8ql?=
 =?iso-8859-1?Q?iCPXpwlIeICgpaI/sRch+PCSs1+BkF2mZ9cSk9gEBxu5OXeK2N5vyiKkt+?=
 =?iso-8859-1?Q?Z1TMsnoC73nTK/R6RxrE6NQjhG/GBgo69GfAWK5TJp/J6QAchPsaOn0Zm1?=
 =?iso-8859-1?Q?qCy/02Un1norAREPL1lky3SWc2jQYHLMCFmp77qkndqOKV4ay9ZLInRXg2?=
 =?iso-8859-1?Q?WwLl3whLdzUi2d56S5A91vh6ghzbGGXbPwpsflOr4elaGNajbCarFo/N75?=
 =?iso-8859-1?Q?Sb3zCR5M+xUrw/ZWlBYzNWBR17toDdmhWnR/cEIFe3xGYmqL3leIEFHMCz?=
 =?iso-8859-1?Q?EGRc8Lnhg6KM5Wjje9FaObTO70iqXu1HG7WNDX9i882PwWezrRP0O00hmb?=
 =?iso-8859-1?Q?Y+0JGcNFiWrYRr2USp9N6pbC8dk2d/BCQj2YKhZENckFA8C/JraJFdDQi3?=
 =?iso-8859-1?Q?kzQB/PELuF8OFKpLEoeXKt2uM6z0rnHsCvH+P61o9mT/vw1D3gL9PLphcA?=
 =?iso-8859-1?Q?JHoceptmpD5alGzLfRo3N6hQu4bpxeWIWxhf6wmVmIjCVSRu/Oc02UzIc0?=
 =?iso-8859-1?Q?r8VYjvSvUVqrrGrK2YDWz7ndzjpjMr4xuV36Empgg0h0gN428tpmErzIOj?=
 =?iso-8859-1?Q?81NEiPNIYAGokDWHXTqsvpvBga1KE/sI+baSE4WSzkOmM18hlhEnnXR/or?=
 =?iso-8859-1?Q?2SMhITE3qG/R9rhk/UX8f0ddronYZnipxwLnXLnK/xBN+sNUlZ2abDRSLE?=
 =?iso-8859-1?Q?U146wlCvYuL0gITIh0V3MBUPZJhTozYzgiiAbXFFYlVyYD+05gowsOr2Io?=
 =?iso-8859-1?Q?+uV4GfL3Ztj8VuxD3LIpi33QQZ/TK2LCljPSTupc1iBszKcwQKfjNY+Tub?=
 =?iso-8859-1?Q?gGZwg2cZXFtxfzpde1tHy9YhxcqtBnXiMKhOGQb7ahkUuRfYTSCnUxf12v?=
 =?iso-8859-1?Q?pG0UwL+qLOa3Bg/10BiQ2xRG9CCtrg2FhrWD93CDwz5fxgMJkgekpr0rmf?=
 =?iso-8859-1?Q?7QdvCfJI2yfiVI1UeHbImEfO4l7H+VECj1jymQz0IfQKa7rJGW30Ca+ZpM?=
 =?iso-8859-1?Q?WZAzQ7yteieh+rzmrBzr6y+cNVVZYab4N6GDBYm+aNken08sCaTE6LvVbz?=
 =?iso-8859-1?Q?OGP6dKC8/RA17HEf1PTgu9e8SSJ5me82yibnm6LgoXZU+lWVm3/2lFON9R?=
 =?iso-8859-1?Q?hfa1Iz0HD1vD74321b5ophgbgc/gwKwB2QbL383TWzL6dUF/EX4p6H9A3x?=
 =?iso-8859-1?Q?ac/m1iLeZ9ejtOJ91qyC3p1X9svGQlg6+w25UXuIB2E/pLtvpc52otyeHG?=
 =?iso-8859-1?Q?Rp2hhC4cGRxM7xX8ray70ztLfiC/hUGHAyLTK7VGZIFSNvyaxrGURkMeUI?=
 =?iso-8859-1?Q?lq0l+5x6Wk8joLxFqWxW2p5jDtjO/TeHKxm2QPE8NYXaG40tOa9rAIE5kN?=
 =?iso-8859-1?Q?KFjN6dltc3jA36nYnKR3TqqFSmBR5PeTzXS8ngiKK7AHSjB4xvgUMuFXQB?=
 =?iso-8859-1?Q?Z4u+MlDFkDJ4jFo7w+A40z++qx64FtLanigNRV2PQfo321XwPKW99ImP9+?=
 =?iso-8859-1?Q?nekEf9dSJgnV9Sl3aNo7Q3eNaykHXcZNDwBc4qRMGCSkJVnFueH8THmA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MR1P264MB1841ADD5E68964B57B0DA05BE157AMR1P264MB1841FRAP_"
MIME-Version: 1.0
X-OriginatorOrg: trustngo.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e5fd7c-ae52-458d-7ab6-08ddc3753ea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 07:57:28.4826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 280e357f-0dfa-41a5-a69c-e53fb549f178
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mu1s33hDJ2UhywG2W7L8lbcW89ScFyNNrLvaRWhNd/nr4KVXmmxoT71a9TdYvoh5gU7+kAdyC+8JszvqcUZN3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3735
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Jul 2025 07:57:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6612

--_000_MR1P264MB1841ADD5E68964B57B0DA05BE157AMR1P264MB1841FRAP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear all,

I'm trying to develop a PoC of a fully secure embedded software. Because th=
is PoC is intended for educational use, I don't want to depend on a specifi=
c hardware vendor and therefore, I'm using qemuarm64 as target.

Unfortunately, i'm struggling in having a working secure boot (TF-A + OP-TE=
E + U-boot + kernel) and I cannot find useful (and working) information on =
the internet. Do somebody has some kind of a minimal working secure boot ex=
ample based on qemuarm64 ?

Best regards,
Michael Grand

Envoy=E9 =E0 partir de Outlook pour Android<https://aka.ms/AAb9ysg>

--_000_MR1P264MB1841ADD5E68964B57B0DA05BE157AMR1P264MB1841FRAP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Dear all,</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
I'm trying to develop a PoC of a fully secure embedded software. Because th=
is PoC is intended for educational use, I don't want to depend on a specifi=
c hardware vendor and therefore, I'm using qemuarm64 as target.</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Unfortunately, i'm struggling in having a working secure boot (TF-A + OP-TE=
E + U-boot + kernel) and I cannot find useful (and working) information on =
the internet. Do somebody has some kind of a minimal working secure boot ex=
ample based on qemuarm64 ?</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Best regards,</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Michael Grand&nbsp;</div>
<div id=3D"ms-outlook-mobile-body-separator-line" dir=3D"auto"><br>
</div>
<div id=3D"ms-outlook-mobile-signature" style=3D"font-family: Aptos, Aptos_=
MSFontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; font-si=
ze: 12pt;" dir=3D"auto">
Envoy=E9 =E0 partir de <a href=3D"https://aka.ms/AAb9ysg">Outlook pour Andr=
oid</a></div>
</body>
</html>

--_000_MR1P264MB1841ADD5E68964B57B0DA05BE157AMR1P264MB1841FRAP_--

