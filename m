Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.81])
 by mx.groups.io with SMTP id smtpd.web09.8397.1603361597823811154
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Oct 2020 03:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Q29BM0ZS;
 spf=pass (domain: arm.com, ip: 40.107.1.81, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phaofQeaihojJoNV/MQxU4uRtbht+MoLQCPvSiN+xSQ=;
 b=Q29BM0ZS1EyR4CSxCXCzOOynQd8heczUSd3mEnwpdFgOCTnKBnpdSdurCUIaZdG1pFgBmQBW/RGakXwcelD5jaiupBdtNfzmoVUROAlpuVn5WCriAgoDaXQEohv/WllKly1t9dIn2YMoiKY4IJBG3VLufsaSKLMJVkSWH3FC7jg=
Received: from AM6PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:20b:2e::28)
 by AM4PR08MB2787.eurprd08.prod.outlook.com (2603:10a6:205:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 10:13:09 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::11) by AM6PR05CA0015.outlook.office365.com
 (2603:10a6:20b:2e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Thu, 22 Oct 2020 10:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 10:13:09 +0000
Received: ("Tessian outbound d5e343850048:v64"); Thu, 22 Oct 2020 10:13:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 661c017bb14d8dda
X-CR-MTA-TID: 64aa7808
Received: from 36777daedfff.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 545903EA-2AAD-47B9-B940-D01362E0DB18.1;
	Thu, 22 Oct 2020 10:12:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36777daedfff.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Oct 2020 10:12:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER4yqoAG/jWf8zffV0bXTVmL7ybcRyNFtUg2AXoZHpl7OKCL43GBxFgYt+xP7B4Js/AJSLHRIaG9+e0E8U/hn3x5kBP8VyoDleSmhfOC6mOPMwbFJDnsjZMhz1KSaJmmp+2SdSHMaz2lxQ9sdpBjzWgXIOvKx0cFpW8f1v6iDO0k15/f7hWCChumAk+0+bsLxxOVvGHAaAgj/V7eIkud8jji1eLYFy3KHIIrmUl7JD0+EWWvu0lQji6UYslptMl4S8xH5jjXyv63wIqbJYkSyIe0EljF7i5Zysyi0cUVPanm0pHfVDITiKrz+3QPswxkihBciPAZ+YYU5tDDIxkrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phaofQeaihojJoNV/MQxU4uRtbht+MoLQCPvSiN+xSQ=;
 b=g1KKOesWbVq8W1c8+Mg5ndqawrlUQZusAURQyug3BduJxp1h/7wv8a99LJnJqG/zNEgjSLkmwXZHaSz1+nChMOQHEA5lp+82wH7bxG5CyD9YDDIDRI5kCCGQ8yacH5ZCDytSlm4Wfnfl352X4zuiVfxj7aFdndTEM8gtQgiSOQWCg6iTYckBmDTnHgNPGBwz6hAdTFsywM1VGtyWDqYsfaAg+dPVmZsKIFgiRlr+uS9lLHxmgxRzf2pDBOisgYrvQZQqvuVEbZDwY1N4LfLI+HFk0OmisAk5epbtkxW78vmSgwy4WH8aryC/jvPnsmo2uyYWdsaDGVEcNnGo0iW5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phaofQeaihojJoNV/MQxU4uRtbht+MoLQCPvSiN+xSQ=;
 b=Q29BM0ZS1EyR4CSxCXCzOOynQd8heczUSd3mEnwpdFgOCTnKBnpdSdurCUIaZdG1pFgBmQBW/RGakXwcelD5jaiupBdtNfzmoVUROAlpuVn5WCriAgoDaXQEohv/WllKly1t9dIn2YMoiKY4IJBG3VLufsaSKLMJVkSWH3FC7jg=
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB8PR08MB5338.eurprd08.prod.outlook.com (2603:10a6:10:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 10:12:35 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32%5]) with mapi id 15.20.3477.029; Thu, 22 Oct 2020
 10:12:35 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: Denys Dmytriyenko <denis@denix.org>, Ross Burton <ross@burtonini.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Lakshmi Kailasanathan <Lakshmi.Kailasanathan@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
Thread-Topic: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test
 recipe for systems comms
Thread-Index: AQHWp80b3ElNfkHUzUWB+wCnb04hGqmiTjsAgAAVHwCAAAWDgIAA/Aso
Date: Thu, 22 Oct 2020 10:12:35 +0000
Message-ID: 
 <DB7PR08MB35315C5884296F6030B51474FD1D0@DB7PR08MB3531.eurprd08.prod.outlook.com>
References: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
 <20201021172340.GF19155@denix.org>
 <CAAnfSTviL7v4i=YVO78ANwTH6859iKivy-Br+AQQXogtG_km9g@mail.gmail.com>,<20201021185859.GG19155@denix.org>
In-Reply-To: <20201021185859.GG19155@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e90ad474-353f-41e0-2851-08d876731373
x-ms-traffictypediagnostic: DB8PR08MB5338:|AM4PR08MB2787:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB2787CBDC349272B40A3B34CBFD1D0@AM4PR08MB2787.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qWf7Rjs/W7E0LNLr9OBPmIuOlJZ+lHVtoKIPW4ioeACFjkM1nCQ0NwZKlVqxywa1sveVCUdJDY9aYfRXIuwY73Sjq7kaZ7fPPBeEXy6KZRd9UBnFeVyiTb5/Qmvh7sSQ+0BqkuaJhkxU1rM/KpOEZttiDeE+BJjZhCyEDPzkn15nb+Es4MBji8X0nTW2MYlyPZoFUWs7CtbpKCE6fmXlAUPkYQkLM+m9sA9EPnt3FW3CDN9JY+FUFPPT1wJrt0BSM44vbv6S9E1b3cUghpWY9QXwz5qDN1PaarlWmxOBXXlX/+3WQODJwvO6v0v+IFdP
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(110136005)(66476007)(66556008)(64756008)(66446008)(186003)(316002)(66946007)(91956017)(76116006)(26005)(5660300002)(8676002)(86362001)(54906003)(19627405001)(33656002)(52536014)(2906002)(478600001)(53546011)(7696005)(9686003)(8936002)(55016002)(71200400001)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 v/2GDV4vaPr/E3HeWyb8XmcD+yYldkU7R7pL7pdxM9p9w9y8+tYdta99UGYUKBk6VB1lbxBYDF3I5bO8CS+qLR27R1gdY5PHRhE8fAf4JorVol7DUOj/u0/xKIXQP8aPnJhfOBcg0K2yOIRwuF36Xaq/yURqqcGJgkNpTZbjx1y2hJPZ/waUP0UhR8akS3oTTmFiFLOQBDXsLLIvSENpRkj349HTogeV5qOUqJiZEtq3tyS+2bwFqa7nl+jCiMCqx9f7HQcI+6ILiN7Udi9/47+Z5gaAZQkLNwXpJ616FdGdziOObO2wFzt4GBRCeq4oxaFh9fPIUH8VNhoAx7Qe3qC7jXdac49eK5UhI1JzGETVCkHMo51XULXXRlGMrIrk/aekI8oAzT2yfFiHel/zWU1mY2rmKYlwaxgavuDlWpuiFWiSgfqBQ2JyJOyM9JpJB6x1ODGr2QaSxJ7/9peWFr0PIiVNWSPNBEkz2IJGz3Z4ERFFC+EjKAKE59HTadAViueRArnzTj7lOWTxctS9IVA6ZQIvB4k7fPGwaefmBGonLRed0xLAC/B6t96U7hKVD6QLKF79BFrwtuMpxpo+aJWfbJFSaa4hVoHfkptVk21cHkpzRiZtzktAzYqjRdl8Tn5i2Ou4/BtqhDVenP5H7A==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5338
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9663670f-cb8a-4d0c-bbd0-08d87672ff3e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lO3YmUTXK1VhfGjZOh2uyo8pOtcrs9Qc1+geTcDoyHtm4HFlrmw/g/bgptnv4Z/jthbF+nG4zLkWheO5+8hHht84hH7AgixMIi1+rC13QNykeK88pq45baPSu241PrQmGiYIDZxhR9Gd6aMm2IsDy9ZuqgaV4fPFgCQlHb6Wok2u46qIrucLbQ8kkK8rd+o63LsuBqTiIAVbTz0TbKHOR+K4dazXMrvXvPTEQQUQ5k3YT5MwrrxJ8dFh2QtMfNvIyvKi0WYJuSVkH7tdZfK+g8Lt53dL3xVqUlNzsKY3aoD1RU5k6S8dUhnVB96ahMUPDxZB/ZWhzr8P7oxqP6ECIUM6rmU0a+2nlKPGrMXC9j5REM64FxByyId28AtILBk7C3aqJsntJqS2k0+CoPROgw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(47076004)(2906002)(81166007)(70586007)(8936002)(19627405001)(5660300002)(52536014)(55016002)(6506007)(53546011)(8676002)(26005)(356005)(478600001)(186003)(7696005)(9686003)(336012)(82740400003)(54906003)(86362001)(110136005)(33656002)(82310400003)(316002)(4326008)(36906005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 10:13:09.1916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e90ad474-353f-41e0-2851-08d876731373
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2787
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB7PR08MB35315C5884296F6030B51474FD1D0DB7PR08MB3531eurp_"

--_000_DB7PR08MB35315C5884296F6030B51474FD1D0DB7PR08MB3531eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The choice made to use ~ is because the 1.0 release hasn't happened yet.

This convention is already used under openembedded/meta-openembedded:

meta-oe/recipes-devtools/luajit/luajit_git.bb :

PV =3D "2.1.0~beta3-200809"
________________________________
From: Denys Dmytriyenko <denis@denix.org>
Sent: 21 October 2020 19:58
To: Ross Burton <ross@burtonini.com>
Cc: Abdellatif El Khlifi <Abdellatif.ElKhlifi@arm.com>; meta-arm@lists.yoct=
oproject.org <meta-arm@lists.yoctoproject.org>; Lakshmi Kailasanathan <Laks=
hmi.Kailasanathan@arm.com>; Ross Burton <Ross.Burton@arm.com>; nd <nd@arm.c=
om>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test r=
ecipe for systems comms

On Wed, Oct 21, 2020 at 07:39:16PM +0100, Ross Burton wrote:
> On Wed, 21 Oct 2020 at 18:23, Denys Dmytriyenko <denis@denix.org> wrote:
> > > +PV .=3D "~git${SRCPV}"
> >
> > OpenEmbedded convention is to use "+git..."
>
> + and ~ have different behaviour, so the question is whether this SHA
> is before or after the 1.0 release.
>
> If the 1.0 release hasn't happened yet, ~ is correct.  If 1.0 has
> already happened, + would be correct.
>
> The lack of a 1.0 tag suggests that ~ is in fact the correct character to=
 use.
>
> ( 1.0~1 < 1.0 < 1.0+1)

Yeah, I know this is Debian convention for things like -rc1

And OpenEmbedded convention for this case historically was 0.9+1.0-rc1

--
Denys

--_000_DB7PR08MB35315C5884296F6030B51474FD1D0DB7PR08MB3531eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The choice made to use ~ is because the 1.0 release hasn't happened yet.</d=
iv>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This convention is already used under openembedded/meta-openembedded:
<div><br>
</div>
<div>meta-oe/recipes-devtools/luajit/luajit_git.bb :<br>
</div>
<div><br>
</div>
PV =3D &quot;2.1.0~beta3-200809&quot;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Denys Dmytriyenko &lt=
;denis@denix.org&gt;<br>
<b>Sent:</b> 21 October 2020 19:58<br>
<b>To:</b> Ross Burton &lt;ross@burtonini.com&gt;<br>
<b>Cc:</b> Abdellatif El Khlifi &lt;Abdellatif.ElKhlifi@arm.com&gt;; meta-a=
rm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.org&gt;; Lakshmi =
Kailasanathan &lt;Lakshmi.Kailasanathan@arm.com&gt;; Ross Burton &lt;Ross.B=
urton@arm.com&gt;; nd &lt;nd@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding=
 test recipe for systems comms</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Oct 21, 2020 at 07:39:16PM +0100, Ross Bur=
ton wrote:<br>
&gt; On Wed, 21 Oct 2020 at 18:23, Denys Dmytriyenko &lt;denis@denix.org&gt=
; wrote:<br>
&gt; &gt; &gt; +PV .=3D &quot;~git${SRCPV}&quot;<br>
&gt; &gt;<br>
&gt; &gt; OpenEmbedded convention is to use &quot;+git...&quot;<br>
&gt; <br>
&gt; + and ~ have different behaviour, so the question is whether this SHA<=
br>
&gt; is before or after the 1.0 release.<br>
&gt; <br>
&gt; If the 1.0 release hasn't happened yet, ~ is correct.&nbsp; If 1.0 has=
<br>
&gt; already happened, + would be correct.<br>
&gt; <br>
&gt; The lack of a 1.0 tag suggests that ~ is in fact the correct character=
 to use.<br>
&gt; <br>
&gt; ( 1.0~1 &lt; 1.0 &lt; 1.0+1)<br>
<br>
Yeah, I know this is Debian convention for things like -rc1<br>
<br>
And OpenEmbedded convention for this case historically was 0.9+1.0-rc1<br>
<br>
-- <br>
Denys<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB7PR08MB35315C5884296F6030B51474FD1D0DB7PR08MB3531eurp_--
